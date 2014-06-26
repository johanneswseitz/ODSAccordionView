//
// Created by Johannes Seitz on 18/06/14.
// Copyright (c) 2014 Johannes W. Seitz. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum ODSAccordionHeaderStyle : NSUInteger {
    ODSAccordionHeaderStyleLabelRight,
    ODSAccordionHeaderStyleLabelCentered,
    ODSAccordionHeaderStyleLabelLeft
} ODSAccordionHeaderStyle;

@interface ODSAccordionSectionStyle : NSObject

/// Defaults to 30
@property (nonatomic) CGFloat headerHeight;
/// Defaults to [UIFont systemFontOfSize:14]
@property (nonatomic) UIFont  *headerTitleLabelFont;
/// Defaults to [UIColor blackColor]
@property (nonatomic) UIColor *headerTitleLabelTextColor;
/// Defaults to [UIColor darkGrayColor]
@property (nonatomic) UIColor *headerTitleLabelHighlightedTextColor;
/// Defaults to ODSAccordionHeaderStyleLabelLeft
@property (nonatomic) ODSAccordionHeaderStyle headerStyle;
/// Defaults to [UIColor clearColor]
@property (nonatomic) UIColor *headerBackgroundColor;
/// Defaults to [UIColor clearColor]
@property (nonatomic) UIColor *backgroundColor;
/// Defaults to [UIColor lightGrayColor]
@property (nonatomic) UIColor *dividerColor;
/// Defaults to [self dividerColour]
@property (nonatomic) UIColor *arrowColor;
/// Defaults to YES
@property (nonatomic) BOOL arrowVisible;
/// Keep the section headers visible on top while scrolling. Defaults to YES
@property (nonatomic) BOOL stickyHeaders;

@end