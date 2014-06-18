//
//  ODSSectionView.m
//  ODSAccordionView
//
//  Created by Johannes Seitz on 17/06/14.
//  Copyright (c) 2014 Johannes W. Seitz. All rights reserved.
//

#import "ODSAccordionSectionView.h"
#import "ODSAccordionSectionStyle.h"

@interface ODSAccordionSectionView (private)


@end

@implementation ODSAccordionSectionView {
    UIView *_sectionView;
    ODSAccordionSectionStyle *_sectionStyle;
    CGFloat _sectionViewAlpha;
    BOOL _open;
}

-(instancetype)initWithTitle:(NSString *)sectionTitle
                     andView:(UIView *)sectionView
                sectionStyle:(ODSAccordionSectionStyle *)sectionStyle {
    self = [super init];
    if (self) {
        _sectionStyle = sectionStyle;
        if (_sectionStyle.backgroundColour){
            self.backgroundColor = _sectionStyle.backgroundColour;
        }
        _sectionView = sectionView;
        [self makeHeader:sectionTitle];
        [self addSubview: sectionView];
        [self layoutIfNeeded];
        [self collapseSectionAnimated:NO];
        [self setClipsToBounds:YES];
    }
    return self;
}

-(void)makeHeader:(NSString *)sectionTitle {
    _header = [UIButton buttonWithType:UIButtonTypeCustom];
    [_header setTitle:sectionTitle forState:UIControlStateNormal];
    if (_sectionStyle.headerBackgroundColour){
        _header.backgroundColor = _sectionStyle.headerBackgroundColour;
    }
    if (_sectionStyle.headerTitleLabelTextColour){
        [_header setTitleColor:_sectionStyle.headerTitleLabelTextColour forState:UIControlStateNormal];
    }
    if (_sectionStyle.headerTitleLabelFont){
        _header.titleLabel.font = _sectionStyle.headerTitleLabelFont;
    }
    if (_sectionStyle.headerTitleTextAlignment == NSTextAlignmentLeft){
        [_header setContentHorizontalAlignment:UIControlContentHorizontalAlignmentLeft];
        [_header setTitleEdgeInsets:UIEdgeInsetsMake(0, 10, 0, 0)];
    } else if (_sectionStyle.headerTitleTextAlignment == NSTextAlignmentRight){
        [_header setContentHorizontalAlignment:UIControlContentHorizontalAlignmentRight];
        [_header setTitleEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 10)];
    }
    [_header addTarget:self action:@selector(toggleButtonPressed:) forControlEvents:UIControlEventTouchDown];
    [self addSubview:_header];
}

-(void)collapseSectionAnimated:(BOOL)animated {
    _open = NO;
    self.height = self.collapsedHeight;
    _sectionViewAlpha = 0.0;
    [self sectionViewAlphaChanged:animated];
}

-(void)expandSectionAnimated:(BOOL)animated {
    _open = YES;
    self.height = self.expandedHeight;
    _sectionViewAlpha = 1.0;
    [self sectionViewAlphaChanged:animated];
}

-(void)sectionViewAlphaChanged:(BOOL)animated {
    if (animated){
        [UIView animateWithDuration:0.5 animations:^{ _sectionView.alpha = _sectionViewAlpha; }];
    } else {
        _sectionView.alpha = _sectionViewAlpha;
    }
}

-(void)toggleButtonPressed:(id)sectionPressed {
    if (_open){
        [self collapseSectionAnimated:YES];
    } else {
        [self expandSectionAnimated:YES];
    }
    [self setNeedsLayout];
}

-(CGFloat)headerHeight {
    if (_sectionStyle.headerHeight != 0){
        return _sectionStyle.headerHeight;
    } else {
        CGFloat defaultHeaderHeight = 30;
        return defaultHeaderHeight;
    }
}

-(void)layoutSubviews {
    [super layoutSubviews];
    _header.frame = CGRectMake(0, 0, self.width, self.headerHeight);
    _sectionView.frame = CGRectMake(0, self.headerHeight, self.width, _sectionView.frame.size.height);
}

-(CGFloat)expandedHeight {
    return _sectionView.frame.size.height  + self.headerHeight;
}

-(CGFloat)collapsedHeight {
    return self.headerHeight;
}

-(CGFloat)width {
    return self.frame.size.width;
}

@end
