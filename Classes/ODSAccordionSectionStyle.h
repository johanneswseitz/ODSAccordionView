//
// Created by Johannes Seitz on 18/06/14.
// Copyright (c) 2014 Johannes W. Seitz. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface ODSAccordionSectionStyle : NSObject

@property (nonatomic) CGFloat headerHeight; /// Nil is ok. Defaults to 30
@property (nonatomic) UIFont  *headerTitleLabelFont; /// Nil is ok. Defaults to UIButton.textLabel system default
@property (nonatomic) UIColor *headerTitleLabelTextColour; /// Nil is ok. Defaults to UIButton.textLabel system default
@property (nonatomic) NSTextAlignment headerTitleTextAlignment; // Nil is ok. Defaults to NSTextAlignmentCenter.
@property (nonatomic) UIColor *headerBackgroundColour; /// Nil is ok. Defaults to UIButton.backgroundColor system default
@property (nonatomic) UIColor *backgroundColour; /// Nil is ok. Defaults to UIView.backgroundColor system default
@property (nonatomic) UIColor *dividerColour; /// Nil is ok. Defaults to [UIColor blackColor]

@end