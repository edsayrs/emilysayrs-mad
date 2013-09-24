//
//  ViewController.m
//  browser
//
//  Created by Emily Davis Sayrs on 9/24/13.
//  Copyright (c) 2013 Emily Davis Sayrs. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    _webView.delegate=self;//sets the controller as the delegate of the UIWebView instance
    [self loadWebPageWithString:@"http://www.servehaus.com"];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//**load a new web page in the web view-this is the first time we are declaring our method "loadWebPageWithString" this is our method, not in the UI Kit.

-(void) loadWebPageWithString:(NSString *)urlString
//the NSString passed should be a properly formed URL
{
    NSURL *url = [NSURL URLWithString:urlString];
    //a NSURL object is initialized using a NSString that is passed to the method.
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url];//constructs a NSURLRequest object from a NSURL object
    
    [_webView loadRequest:request];//loads a NSURLRequest object.
    
    //**because loadRequest takes a NSURLRequest object, we have to set that up before hand, and the NSURLRequest object takes a NSURL object, so we have to set that up before the NSURLRequest object. These could be nested but it can get complicated. 
}
//call UIWebDelegate method when the page doesn't load properly
-(void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
    UIAlertView *alertView =[[UIAlertView alloc] initWithTitle:@"Error loading web page" message: [error localizedDescription]//NSError translates error messages into the user's language
delegate:self
cancelButtonTitle:nil
otherButtonTitles:@"OK", nil];
    [alertView show];//send the show message to display the alertView 
}

- (IBAction)bookmarkItemTapped:(UIBarButtonItem *)sender {
    //creates the action sheet(the pop up sheet that lets you choose another page)
    UIActionSheet *actionSheet=[[UIActionSheet alloc]initWithTitle:nil delegate:self cancelButtonTitle:@"cancel"  destructiveButtonTitle:nil otherButtonTitles:@"SERVE", @"Twitter", @"Facebook", @"Tumblr", nil];
    //nil is needed as the last title in this array. "comma seperated, nil terminated list of titles"
    
    [actionSheet showFromToolbar:_toolBar];

    //displays the action sheet from the toolbar
}

//UActionSheetDelegate method, called when a selection is made on an action sheet
    -(void) actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger) buttonIndex
    {
        if(buttonIndex == 0)
        {
            [self loadWebPageWithString:@"http://www.servehaus.com"];
        }

        if(buttonIndex == 1)
        {
            [self loadWebPageWithString:@"http://www.twitter.com/servehq"];
        }
        else if (buttonIndex==2)
        {
            [self loadWebPageWithString:@"http://www.facebook.com/servehq"];
        }
        else if (buttonIndex==3)
        {
            [self loadWebPageWithString:@"http://www.servehq.tumblr.com"];
        }
    
}

//UIWebViewDelegate method that is called when a web page begins to load
-(void)webViewDidStartLoad:(UIWebView *)webView
{
    [_spinner startAnimating];
    //sends the startAnimating message to the spinner
}
//UIWebViewDelegate method that is called when a web page loads successfully
-(void)webViewDidFinishLoad:(UIWebView *)webView
{
    [_spinner stopAnimating];
    //sends the stopAnimating message to the spinner
}

@end
