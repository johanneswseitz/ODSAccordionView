//
//  ODSAccordionView.h
//  
//
//  Created by Johannes Seitz on 17/06/14.
//
//

#import <UIKit/UIKit.h>
#import "ODSAccordionSection.h"
#import "ODSMacros.h"

@class ODSAccordionSectionStyle;


@interface ODSAccordionView : UIScrollView

-(id)initWithSections:(NSArray *)sections andSectionStyle:(ODSAccordionSectionStyle *)sectionStyle;

@end
