//
// Created by Johannes Seitz on 18/06/14.
// Copyright (c) 2014 Johannes W. Seitz. All rights reserved.
//

#import "ODSAccordionSectionStyle.h"


@implementation ODSAccordionSectionStyle

-(id)init {
    self = [super init];
    if (self) {
        _headerHeight = 30;
        _headerTitleLabelFont = [UIFont systemFontOfSize:14];
        _headerTitleLabelTextColor = [UIColor blackColor];
        _headerTitleLabelHighlightedTextColor = [UIColor darkGrayColor];
        _headerStyle = ODSAccordionHeaderStyleLabelLeft;
        _headerBackgroundColor = [UIColor clearColor];
        _backgroundColor = [UIColor clearColor];
        _dividerColor = [UIColor lightGrayColor];
        _arrowVisible = YES;
        _stickyHeaders = YES;
    }
    return self;
}

-(UIColor *)arrowColor {
    if (_arrowColor){
        return _arrowColor;
    } else {
        return _dividerColor;
    }
}

@end