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


@implementation ODSAccordionView {
    NSArray *_sectionViews;
}

-(id)initWithSections:(NSArray *)sections andSectionStyle:(ODSAccordionSectionStyle *)sectionStyle {
    self = [super init];
    if (self) {
        _sectionViews = @[];
        for (NSUInteger i = 0; i < [sections count]; i++) {
            ODSAccordionSection*currentSection = [sections objectAtIndex:i];
            ODSAccordionSectionView *sectionView = [[ODSAccordionSectionView alloc] initWithTitle:currentSection.title
                                                                        andView:currentSection.view
                                                                   sectionStyle:sectionStyle];
            [sectionView addObserver:self forKeyPath:@"height" options:0 context:nil];
            _sectionViews = [_sectionViews arrayByAddingObject:sectionView];
            [self addSubview:sectionView];
            BOOL isLastOrFirstSection = i == 0 || i == [_sectionViews count];
            if (!isLastOrFirstSection){
                [sectionView addSubview:[self makeDivider:sectionStyle.dividerColour]];
            }
        }
        //a[self layoutIfNeeded];
    }
    return self;
}

-(UIView *)makeDivider:(UIColor *)dividerColour {
    UIView *divider = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.width, 0.5)];
    if (dividerColour){
        divider.backgroundColor = dividerColour;
    } else {
        divider.backgroundColor = [UIColor blackColor];
    }
    divider.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    return divider;
}

-(void)updateScrollViewContentSize {
    CGFloat contentHeight = [self calculateContentHeight];
    self.contentSize = CGSizeMake([self width], contentHeight);
}

-(void)layoutSubviews {
    [super layoutSubviews];
    CGFloat lastSectionBottom = 0;
    for (ODSAccordionSectionView *section in _sectionViews) {
        CGRect newFrame = CGRectMake(0, lastSectionBottom, self.width, section.height);
        if (!CGRectEqualToRect(newFrame, section.frame)){
            section.frame = newFrame;
        }
        [self updateScrollViewContentSize];
        lastSectionBottom = lastSectionBottom + section.height;
    }
}

-(void)observeValueForKeyPath:(NSString *)keyPath
                     ofObject:(id)object
                       change:(NSDictionary *)change
                      context:(void *)context {
    if ([keyPath isEqualToString:@"height"]) {
        ODSAccordionSectionView *expandedSection = (ODSAccordionSectionView *) object;
        [UIView animateWithDuration:0.5 animations:^{
            [self layoutSubviews];
            if (expandedSection.isExpanded){
                CGRect expandedSectionRect = [self convertRect:expandedSection.sectionView.frame
                                                      fromView:expandedSection];
                [self scrollRectToVisible:CGRectMake(expandedSectionRect.origin.x, expandedSectionRect.origin.y, 1, 100)
                                 animated:YES];
            }
        } completion:^(BOOL finished){
            [self flashScrollIndicators];    
        }];
    }
}

-(CGFloat)width {
    return self.frame.size.width;
}

-(CGFloat)calculateContentHeight {
    CGFloat totalHeight = 0;
    for (ODSAccordionSectionView *section in _sectionViews) {
        totalHeight += section.height;
    }
    return totalHeight;
}

@end
