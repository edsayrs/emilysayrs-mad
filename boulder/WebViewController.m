//
//  WebViewController.m
//  boulder
//
//  Created by Emily Sayrs on 10/17/13.
//  Copyright (c) 2013 Emily Sayrs. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController ()

@end


@implementation WebViewController

//load a new web page in the web view
-(void)loadWebPageWithString:(NSString *)urlString{
    //NSString shoud be a correct url
    NSURL *url =[NSURL URLWithString:urlString];//a NSURL object is initialzed using a NSString that is passed to the method
    NSURLRequest *request =[NSURLRequest requestWithURL:url];//constructs a NSURLRequest object from a NSURL object
    [_boulderWebView loadRequest:request];//loads a NSURLRequest object
}



- (void)viewDidLoad
{
    [super viewDidLoad];
	_boulderWebView.delegate=self;
    [self loadWebPageWithString:@"http://www.communityconch.org"];
//do any additional setup after loading the view 
}

//UIWebView Delegatemethod that is called when a webpage begins to load
-(void)webViewDidStartLoad:(UIWebView *)webView{
    [_boulderSpinner startAnimating];//sends the startAnimatingmessage to the spinner
}

//UIWebViewDelegate method is called when a web page loads sucessfully
-(void)webViewDidFinishLoad:(UIWebView *)webView{
    [_boulderSpinner stopAnimating];//sends the stop animating message to spinner
    
}
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
