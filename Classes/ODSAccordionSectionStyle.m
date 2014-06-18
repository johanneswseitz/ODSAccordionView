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
        _headerTitleLabelTextColour = [UIColor blackColor];
        _headerStyle = ODSAccordionHeaderStyleLabelLeft;
        _headerBackgroundColour = [UIColor clearColor];
        _backgroundColour = [UIColor clearColor];
        _dividerColour = [UIColor lightGrayColor];
        _arrowVisible = YES;
    }
    return self;
}

-(UIColor *)arrowColour {
    if (_arrowColour){
        return _arrowColour;
    } else {
        return _dividerColour;
    }
}

@end