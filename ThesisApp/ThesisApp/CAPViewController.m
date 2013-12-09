//
//  CAPViewController.m
//  ThesisApp
//
//  Created by Emily Sayrs on 12/8/13.
//  Copyright (c) 2013 Emily Sayrs. All rights reserved.
//

#import "CAPViewController.h"
#import "CAPYellowChildViewController.h"

@interface CAPViewController ()

@end

@implementation CAPViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.pageController = [[UIPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];
    
    self.pageController.dataSource = self;
    [[self.pageController view] setFrame:[[self view] bounds]];
    
    CAPYellowChildViewController *initialViewController = [self viewControllerAtIndex:0];
    
    NSArray *viewControllers = [NSArray arrayWithObject:initialViewController];
    
    [self.pageController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
    
    [self addChildViewController:self.pageController];
    [[self view] addSubview:[self.pageController view]];
    [self.pageController didMoveToParentViewController:self];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (CAPYellowChildViewController *)viewControllerAtIndex:(NSUInteger)index {
    
    CAPYellowChildViewController *yellowChildViewController = [[CAPYellowChildViewController alloc] initWithNibName:@"CAPYellowChildViewController" bundle:nil];
    yellowChildViewController.index = index;
    
    return yellowChildViewController;
    
}


-(UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController{

NSUInteger index = [(CAPYellowChildViewController *)viewController index];

if(index == 0){
    return nil;
}
index--;
return [self viewControllerAtIndex:index];
    
}

-(UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController{
 
    NSUInteger index = [(CAPYellowChildViewController *)viewController index];
    
    index ++;
    
    if(index == 21){
        return nil;
    }
    
    return [self viewControllerAtIndex:index];
}
- (NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController {
    // The number of items reflected in the page indicator.
    return 21;
}

- (NSInteger)presentationIndexForPageViewController:(UIPageViewController *)pageViewController {
    // The selected item reflected in the page indicator.
    return 0;
}


@end
