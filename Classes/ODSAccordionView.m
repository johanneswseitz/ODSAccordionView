//
//  ODSAccordionView.m
//  
//
//  Created by Johannes Seitz on 17/06/14.
//
//

#import "ODSAccordionView.h"
#import "ODSAccordionSection.h"
#import "ODSAccordionSectionView.h"
#import "ODSAccordionSectionStyle.h"

#define DIVIDER_HEIGHT ([UIScreen mainScreen].scale == 2.0) ? 0.5 : 1.0
#define SECTION_HEIGHT_GETTER NSStringFromSelector(@selector(height))

@implementation ODSAccordionView {
    NSArray *_sectionViews;
    ODSAccordionSectionStyle *_sectionStyle;
}

-(id)initWithSections:(NSArray *)sections andSectionStyle:(ODSAccordionSectionStyle *)sectionStyle {
    self = [super init];
    if (self) {
        _sectionViews = @[];
        _sectionStyle = sectionStyle;
        for (NSUInteger i = 0; i < [sections count]; i++) {
            ODSAccordionSection*currentSection = [sections objectAtIndex:i];
            ODSAccordionSectionView *sectionView =
                    [[ODSAccordionSectionView alloc] initWithTitle:currentSection.title
                                                           andView:currentSection.view
                                                      sectionStyle:sectionStyle];
            [self addSection:sectionView];
        }
    }
    return self;
}

-(void)addSection:(ODSAccordionSectionView*)newSection {
    [self addSubview:newSection];
    [self requestNotificationWhenSectionHeightChanges:newSection];
    _sectionViews = [_sectionViews arrayByAddingObject:newSection];
    BOOL isFirstSection = [_sectionViews count] == 1;
    if (!isFirstSection){
        [newSection.header addSubview:[self makeDivider:_sectionStyle.dividerColor]];
    }
}

-(void)requestNotificationWhenSectionHeightChanges:(ODSAccordionSectionView *)sectionView {
    [sectionView addObserver:self forKeyPath:SECTION_HEIGHT_GETTER options:0 context:nil];
}

-(void)dealloc {
    for (ODSAccordionSectionView *section in _sectionViews){
        @try {
            [section removeObserver:self forKeyPath:SECTION_HEIGHT_GETTER];
        }
        @catch (NSException * __unused exception) {}
    }
}

- (BOOL)touchesShouldCancelInContentView:(UIView *)view {
    if ([view isKindOfClass:[UIButton class]])
        return YES;
    else
        return [super touchesShouldCancelInContentView:view];
}

-(UIView *)makeDivider:(UIColor *)dividerColour {
    UIView *divider = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.width, DIVIDER_HEIGHT)];
    if (dividerColour){
        divider.backgroundColor = dividerColour;
    } else {
        divider.backgroundColor = [UIColor blackColor];
    }
    divider.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    return divider;
}

-(void)layoutSubviews {
    [super layoutSubviews];
    [self updateViewLayout];
}

-(void)updateViewLayout {
    [self recalculateSectionPositionsAndHeight];
    if (_sectionStyle.stickyHeaders){
        [self preventSectionHeaderFromBeingScrolledOutOfViewport];
    }
}

-(void)preventSectionHeaderFromBeingScrolledOutOfViewport {
    for (ODSAccordionSectionView *section in _sectionViews){
        CGPoint contentOffsetInSection = [self convertPoint:self.contentOffset toView:section];
        CGFloat highestPossiblePosition = 0;
        CGFloat lowestPossiblePosition = section.frame.size.height - section.header.frame.size.height;
        CGFloat headerYPosition = MAX(highestPossiblePosition,
                                      MIN(contentOffsetInSection.y + self.contentInset.top, lowestPossiblePosition));
        
        section.header.frame = CGRectMake(0, headerYPosition,
                               section.header.frame.size.width, section.header.frame.size.height);
        section.header.alpha = 0.95;
        [section bringSubviewToFront:section.header];
    }
}

-(void)recalculateSectionPositionsAndHeight {
    CGFloat bottomOfPreviousSection = 0;
    for (ODSAccordionSectionView *section in _sectionViews) {
        CGRect newFrame = CGRectMake(0, bottomOfPreviousSection, self.width, section.height);
        if (!CGRectEqualToRect(newFrame, section.frame)){
            section.frame = newFrame;
        }
        bottomOfPreviousSection = bottomOfPreviousSection + section.height;
    }
    [self updateScrollViewContentSize:bottomOfPreviousSection];
}

-(void)updateScrollViewContentSize:(CGFloat)bottomOfLastSection {
    self.contentSize = CGSizeMake([self width], bottomOfLastSection);
}

-(void)observeValueForKeyPath:(NSString *)keyPath
                     ofObject:(id)object
                       change:(NSDictionary *)change
                      context:(void *)context {
    if ([keyPath isEqualToString:SECTION_HEIGHT_GETTER]) {
        ODSAccordionSectionView *changedSection = (ODSAccordionSectionView *) object;
        [UIView animateWithDuration:0.5 animations:^{
            [self updateViewLayout];
            if (changedSection.isExpanded){
                [self makeSureSomeOfTheExpandedContentIsVisible:changedSection];
            }
        } completion:^(BOOL finished){
            [self flashScrollIndicators];
        }];
    }
}

-(void)makeSureSomeOfTheExpandedContentIsVisible:(ODSAccordionSectionView *)expandedSection {
    CGRect expandedSectionRect = [self convertRect:expandedSection.sectionView.frame
                                          fromView:expandedSection];
    //FIXME: figure out why the origin is sometimes negative
    if (expandedSectionRect.origin.y > 0){
        [self scrollRectToVisible:CGRectMake(expandedSectionRect.origin.x, expandedSectionRect.origin.y, self.width, 100)
                         animated:YES];
    }
}

-(CGFloat)width {
    return self.frame.size.width;
}

@end
