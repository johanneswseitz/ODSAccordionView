//
//  ODSAccordionViewTests.m
//  ODSAccordionViewTests
//
//  Created by Johannes Seitz on 17/06/14.
//  Copyright (c) 2014 Johannes W. Seitz. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "ODSAccordionView.h"

@interface ODSAccordionViewTests : XCTestCase

@end

@implementation ODSAccordionViewTests

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)test_accordionViewDeterminesContentSizeByAddingHeightOfSectionView {
    NSArray *sections = @[];
    ODSAccordionView *accordionView = [[ODSAccordionView alloc] initWithSections:sections andSectionStyle:nil];
}

@end
