//
//  HSTabBarController.h
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

#import <Foundation/Foundation.h>

@interface HSTabBarController : UITabBarController <UITabBarControllerDelegate> {
    UIImageView *arrow;
}
@property (nonatomic, retain) UIImageView *arrow;

-(void)moveArrowWithAnimation:(BOOL)animated andIsMoreTab:(BOOL)more;
-(CGFloat)tabBarItemLocation:(NSUInteger)tabIndex;

@end
