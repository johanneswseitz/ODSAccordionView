//
//  ODSArrowIcon.m
//  ODSAccordionView
//
//  Created by Johannes Seitz on 18/06/14.
//  Copyright (c) 2014 Johannes W. Seitz. All rights reserved.
//

#import "ODSArrowIcon.h"
#define DegreesToRadians(x) ((x) * M_PI / 180.0)
#define ARROW_CURVATURE DegreesToRadians(20)
#define ANIMATION_DURATION 0.5

@implementation ODSArrowIcon {
    UIView *leftArrowPart;
    UIView *rightArrowPart;
}

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.userInteractionEnabled = NO;

        CGFloat overlap = 3;
        leftArrowPart = [self makeArrowPart];
        CGFloat middle = frame.size.width / 2.0;
        leftArrowPart.frame = CGRectMake(0, 0, middle + overlap, frame.size.height);
        [self addSubview: leftArrowPart];
        rightArrowPart = [self makeArrowPart];
        rightArrowPart.frame = CGRectMake(middle - overlap , 0, frame.size.width/2 + overlap, frame.size.height);
        [self addSubview:rightArrowPart];
        
        self.color = [UIColor lightGrayColor];
    }
    return self;
}

-(UIView *)makeArrowPart {
    UIView *arrowPart = [[UIView alloc] init];
    arrowPart.layer.cornerRadius = 4;
    arrowPart.layer.allowsEdgeAntialiasing = YES;
    return arrowPart;
}

-(void)pointDownAnimated:(BOOL)animated {
    if (animated){
        [UIView animateWithDuration:ANIMATION_DURATION animations:^{ [self pointDown]; }];
    } else {
        [self pointDown];
    }
}

-(void)pointDown {
    leftArrowPart.transform = CGAffineTransformMakeRotation(ARROW_CURVATURE);
    rightArrowPart.transform = CGAffineTransformMakeRotation(-ARROW_CURVATURE);
}


-(void)pointUp {
    leftArrowPart.transform = CGAffineTransformMakeRotation(-ARROW_CURVATURE);
    rightArrowPart.transform = CGAffineTransformMakeRotation(ARROW_CURVATURE);
}

-(void)pointUpAnimated:(BOOL)animated {
    if (animated){
        [UIView animateWithDuration:ANIMATION_DURATION animations:^ { [self pointUp]; }];
    } else {
        [self pointUp];
    }
}

-(void)setColor:(UIColor *)color {
    _color = color;
    rightArrowPart.backgroundColor = color;
    leftArrowPart.backgroundColor = color;
}

@end
