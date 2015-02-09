//
//  ODSAccordionSection.m
//  
//
//  Created by Johannes Seitz on 17/06/14.
//
//

#import "ODSAccordionSection.h"


@implementation ODSAccordionSection

-(instancetype)initWithTitle:(NSString *)sectionTitle andView:(UIView *)sectionView collapse:(BOOL)collapse {
    self = [super init];
    if (self){
        _title = sectionTitle;
        _view = sectionView;
        _collapse = collapse;
    }
    return self;
}

-(instancetype)initWithTitle:(NSString *)sectionTitle andView:(UIView *)sectionView {
    return [self initWithTitle:sectionTitle andView:sectionView collapse:YES];
}



@end
