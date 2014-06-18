//
//  ODSAccordionSection.m
//  
//
//  Created by Johannes Seitz on 17/06/14.
//
//

#import "ODSAccordionSection.h"


@implementation ODSAccordionSection

-(id)initWithTitle:(NSString *)sectionTitle andView:(UIView *)sectionView {
    self = [super init];
    if (self){
        _title = sectionTitle;
        _view = sectionView;
    }
    return self;
}

@end
