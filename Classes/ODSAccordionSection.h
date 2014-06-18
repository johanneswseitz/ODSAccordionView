//
//  ODSAccordionSection.h
//  
//
//  Created by Johannes Seitz on 17/06/14.
//
//

#import <UIKit/UIKit.h>
#import "ODSMacros.h"

@interface ODSAccordionSection : NSObject

-(id)initWithTitle:(NSString *)sectionTitle andView:(UIView *)sectionView NS_DESIGNATED_INITIALIZER;

@property (nonatomic) UIView *view;
@property (nonatomic) NSString *title;

@end
