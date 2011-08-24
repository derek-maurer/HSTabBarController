//
//  HSTabBarController.m
//
//  Created by Derek Maurer on 6/8/11.
//  Copyright 2011 HomeSchoolDev. All rights reserved.
//
//  This visual object was created by Derek, owner of HomeSchoolDev. 
//  If you like this object and find it useful in your application, help me out by downloading my applications
//  or donating to my Paypal. You can find my applications by searching the app store for "HomeSchoolDev". 
//  You can donate to my Paypal by sending the payment to derekm9292@gmail.com

//  How to setup HSTabBarController:
//
//  1. Copy the HSTabBarController folder into your project (make sure to check the box that copies the files)
//
//  (In this next step I assume you already have a TabBar application already running correctly)
//
//  2. Import HSTabBarController.h into your AppDelegate
//  3. Change the class of the tabBarController property from UITabBarController to HSTabBarController
//  4. Inside your MainWindow.xib, change the class of the TabBarController to HSTabBarController
//
//  That's all you have to do to setup HSTabBarController. Enjoy.

#import "HSTabBarController.h"

@implementation HSTabBarController
@synthesize arrow;


-(void)viewDidLoad {
    [super viewDidLoad];
    
    self.delegate = self;
    
    CGRect frame = CGRectMake(0.0, 0.0, self.view.bounds.size.width, 49);
    UIImageView *image = [[UIImageView alloc] initWithFrame:frame];
    [image setImage:[UIImage imageNamed:@"TabBar.png"]];
    
    UIImageView *background = [[UIImageView alloc] initWithFrame:CGRectMake(0, 421, 320, 10)];
    [background setImage:[UIImage imageNamed:@"Background.png"]];
    
    UIImage* tabBarArrowImage = [UIImage imageNamed:@"Arrow.png"];
    self.arrow = [[UIImageView alloc] initWithImage:tabBarArrowImage];
    self.arrow.frame = CGRectMake([self tabBarItemLocation:0.0], 423.0, 10.0, 15.0);
   
    [self.tabBar addSubview:image];
    [self.tabBar sendSubviewToBack:image];
    [self.view addSubview:arrow];
    [self.view addSubview:background];
    [self.view bringSubviewToFront:background];
    
    [image release];
    [arrow release];
    [background release];
    [tabBarArrowImage release];
}

-(CGFloat)tabBarItemLocation:(NSUInteger)tabIndex
{   
    //This is used because the arrow would be offset if there were more than 4 tabs.
    float tabBarCount = self.tabBar.items.count;
    if (tabBarCount > 5) {
        tabBarCount -= 4.5;
        tabBarCount -= tabBarCount;
        tabBarCount += 4.5;
    }
    CGFloat tabItemWidth = self.tabBar.frame.size.width / tabBarCount;
    CGFloat halfTabItemWidth = (tabItemWidth / 2.0) - (arrow.frame.size.width / 2.0);
    return (tabIndex * tabItemWidth) + halfTabItemWidth;
}

-(void)moveArrowWithAnimation:(BOOL)animated andIsMoreTab:(BOOL)more {
    if (animated && !more) {
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:0.2];
        CGRect frame = self.arrow.frame;
        frame.origin.x = [self tabBarItemLocation:self.selectedIndex];
        self.arrow.frame = frame;
        [UIView commitAnimations];
    }
    if (!animated && !more) {
        CGRect frame = arrow.frame;
        frame.origin.x = [self tabBarItemLocation:self.selectedIndex];
        arrow.frame = frame;
    }
    if (animated && more) {
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:0.2];
        CGRect frame = self.arrow.frame;
        frame.origin.x = [self tabBarItemLocation:4];
        self.arrow.frame = frame;
        [UIView commitAnimations];
    }
    if (!animated && more) {
        CGRect frame = arrow.frame;
        frame.origin.x = [self tabBarItemLocation:4];
        arrow.frame = frame;
    }
}

- (void)tabBarController:(UITabBarController *)theTabBarController didSelectViewController:(UIViewController *)viewController
{
    if (theTabBarController.selectedViewController == theTabBarController.moreNavigationController) {
        [self moveArrowWithAnimation:YES andIsMoreTab:YES];
    }
    else {
        [self moveArrowWithAnimation:YES andIsMoreTab:NO];
    }
}


@end
