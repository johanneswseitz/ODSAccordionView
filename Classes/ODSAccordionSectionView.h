//
//  ODSSectionView.h
//  ODSAccordionView
//
//  Created by Johannes Seitz on 17/06/14.
//  Copyright (c) 2014 Johannes W. Seitz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ODSMacros.h"

@class ODSAccordionSectionStyle;

@interface ODSAccordionSectionView : UIView

@property (nonatomic, readwrite) CGFloat height;
@property (nonatomic, readonly) UIButton *header;
@property (nonatomic, readonly) UIView *sectionView;
@property (nonatomic, readonly, getter=isExpanded) BOOL expanded;

-(instancetype)initWithTitle:(NSString *)sectionTitle
                     andView:(UIView *)sectionView
                sectionStyle:(ODSAccordionSectionStyle *)sectionStyle NS_DESIGNATED_INITIALIZER;

@end
