//
//  MADViewController.m
//  animation
//
//  Created by Emily Sayrs on 11/14/13.
//  Copyright (c) 2013 Emily Sayrs. All rights reserved.
//

#import "MADViewController.h"

@interface MADViewController ()

@end

@implementation MADViewController{
    CGPoint delta;// sepcifies how many points the image must move every time the timer fires
    NSTimer *timer; //the animation times
    float ballRadius;// radius of the ball
    CGPoint translation;
}

-(IBAction)changeSliderValue{//has to be up here and not in view did load because we are going to be creating more timers when you change the interval.
    
    _sliderLabel.text=[NSString stringWithFormat:@"%.2f", _slider.value];//creates a new timer object with the slider's time interval
    timer = [NSTimer scheduledTimerWithTimeInterval:_slider.value//number of seconds between firings of the timer
                                             target:self selector:@selector(onTimer)//the message sent when the timer fires
                                           userInfo:nil repeats:YES];//weather of not the timer repeatedly reschedules itself. //YES will repeatedly reschedule the timer until invalidated
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    //ball radius is half the width of the image
    ballRadius=_imageView.frame.size.width/2;
    //initalize the delta. trlls it to move 12 pixels horizontally, 4 px vertically
    delta=CGPointMake(12.0, 4.0);
    [self changeSliderValue];
    translation=CGPointMake(0.0, 0.0);
    [super viewDidLoad];
    
	// Do any additional setup after loading the view, typically from a nib.
}
-(void) onTimer{
    //changes the position by setting a new center of the image view
    //uncoment to switch back to first version, not using animation block
    //_imageView.center = CGPointMake(_imageView.center.x + delta.x, _imageView.center.y + delta.y);
    
    
    [UIView beginAnimations:@"my_own_animation" context:nil];
    [UIView animateWithDuration:_slider.value//animate for the duration of the slider value (time interval)
                          delay:0//have the animation start right away
                        options:UIViewAnimationOptionCurveEaseOut//set the animation curve type
                     animations:^{
         _imageView.transform=CGAffineTransformMakeTranslation (translation.x, translation.y);
         translation.x += delta.x;
                         translation.y += delta.y;
                     }
                           completion:NULL];
        
    [UIView commitAnimations];
    
    //if the image touched the sides of the screen it reverses the direction
    if(_imageView.center.x + translation.x > self.view.bounds.size.width - ballRadius || _imageView.center.x +translation.x < ballRadius) delta.x = - delta.x;
    //if the image touched the top or bottom of the screen it reverses direction
    if(_imageView.center.y + translation.y> self.view.bounds.size.height - ballRadius || _imageView.center.y + translation.y < ballRadius)
        delta.y = -delta.y;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)sliderMoved:(UISlider *)sender {
    [timer invalidate]; //stops the timer, because you cant change the timer once you create it. this stops the current timer and the next like creates a new timer 
    //must invalidate and create a new object to change its firing interval
    [self changeSliderValue];
}
@end
