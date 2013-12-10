//
//  WebViewController.h
//  boulder
//
//  Created by Emily Sayrs on 10/17/13.
//  Copyright (c) 2013 Emily Sayrs. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WebViewController : UIViewController<UIWebViewDelegate>
@property (weak, nonatomic) IBOutlet UIWebView *boulderWebView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *boulderSpinner;

@end
