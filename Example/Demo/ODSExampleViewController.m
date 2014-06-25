//
//  ODSExampleViewController.m
//  Demo
//
//  Created by Johannes Seitz on 17/06/14.
//  Copyright (c) 2014 Johannes W. Seitz. All rights reserved.
//

#import "ODSExampleViewController.h"
#import "ODSAccordionView.h"
#import "ODSAccordionSectionStyle.h"

@interface ODSExampleViewController ()

@end

@implementation ODSExampleViewController {
    ODSAccordionView *_accordionView;
}

- (id)init {
    return [self initWithNibName:nil bundle:nil];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"ODSAccordionView Demo";
    
    CGFloat fullSpectrum = 255.0;
    UIColor *darkBlue = [UIColor colorWithRed:222/fullSpectrum green:235/fullSpectrum blue:247/fullSpectrum alpha:1];
    UIColor *blue = [UIColor colorWithRed:158/fullSpectrum green:202/fullSpectrum blue:225/fullSpectrum alpha:1];
    UIColor *lightBlue = [UIColor colorWithRed:49/fullSpectrum green:130/fullSpectrum blue:189/fullSpectrum alpha:1];
    
    ODSAccordionSectionStyle *style = [[ODSAccordionSectionStyle alloc] init];
    style.arrowColor = lightBlue;
    style.headerStyle = ODSAccordionHeaderStyleLabelLeft;
    style.headerTitleLabelTextColor = [UIColor blackColor];
    style.headerTitleLabelFont = [UIFont systemFontOfSize:15];
    style.backgroundColor = blue;
    style.headerBackgroundColor = darkBlue;
    style.dividerColor = [UIColor lightGrayColor];
    style.headerHeight = 40;
    style.stickyHeaders = YES;

    NSArray *sections = @[
                          [[ODSAccordionSection alloc] initWithTitle:@"Text"
                                                             andView: [self textView]],
                          [[ODSAccordionSection alloc] initWithTitle:@"Cat content"
                                                             andView: [self imageView]],
                          [[ODSAccordionSection alloc] initWithTitle:@"Web content"
                                                             andView: [self webView]],
                          [[ODSAccordionSection alloc] initWithTitle:@"Slow loading web content"
                                                             andView: [self slowWebView]],
                          [[ODSAccordionSection alloc] initWithTitle:@"Your own content"
                                                             andView: [self emptyView]],
                         ];
    _accordionView = [[ODSAccordionView alloc] initWithSections:sections andSectionStyle:style];
    _accordionView.keyboardDismissMode = UIScrollViewKeyboardDismissModeOnDrag;
    self.view = _accordionView;
    self.view.backgroundColor = lightBlue;
}

-(void)viewDidAppear:(BOOL)animated {
    [_accordionView flashScrollIndicators];
}

-(UITextView *)textView {
    UITextView *textView = [[UITextView alloc] init];
    textView.frame = CGRectMake(0, 0, 0, 100);
    textView.backgroundColor = [UIColor clearColor];
    textView.text = @"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec a diam lectus. Sed sit amet ipsum mauris.\n\n Maecenas congue ligula ac quam viverra nec consectetur ante hendrerit.\n Donec et mollis dolor.";
    return textView;
    
}

-(void)webViewDidFinishLoad:(UIWebView *)webView {
    CGFloat webContentHeight = webView.scrollView.contentSize.height;
    webView.bounds = CGRectMake(webView.bounds.origin.x, webView.bounds.origin.y, webView.bounds.size.width, webContentHeight);
}

-(UIView *)imageView {
    UIImage *image = [UIImage imageNamed:@"catcontent"];
    NSAssert(image != nil, @"image not found");
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    imageView.contentMode = UIViewContentModeBottom;
    return imageView;
}

-(UIView *)webView {
    return [self webViewForUrl:@"http://www.printhelloworld.de"];
}

-(UIView *)slowWebView {
    return [self webViewForUrl:@"http://httpbin.org/delay/5"];
}

-(UIWebView *)webViewForUrl:(NSString*)urlString {
    // Make sure the frame you init your embedded WebView with does not have a zero heigh/width,
    // otherwise it misbehaves and returns a sizeThatFits: of {0,0}
    UIWebView *webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, 1, 20)];
    webView.userInteractionEnabled = NO;
    [webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:urlString]]];
    webView.delegate = self;
    return webView;
}


-(UIView *)emptyView {
    UIView *yourContent = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 300)];
    yourContent.backgroundColor = [UIColor greenColor];
    return yourContent;
}

@end
