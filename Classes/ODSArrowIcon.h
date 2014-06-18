//
//  ODSArrowIcon.h
//  ODSAccordionView
//
//  Created by Johannes Seitz on 18/06/14.
//  Copyright (c) 2014 Johannes W. Seitz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ODSArrowIcon : UIView

@property (nonatomic) UIColor *color; /// Defaults to [UIColor lightGreyColor]


-(void)pointDownAnimated:(BOOL)animated;
-(void)pointUpAnimated:(BOOL)animated;

@end
