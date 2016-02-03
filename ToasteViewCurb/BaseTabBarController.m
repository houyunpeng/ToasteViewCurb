//
//  BaseTabBarController.m
//  ToasteViewCurb
//
//  Created by 侯云鹏 on 16/2/3.
//  Copyright © 2016年 侯云鹏. All rights reserved.
//

#import "BaseTabBarController.h"
#import "FirstVC.h"
#import "SecondVC.h"
#import "ThirdVC.h"
#import "ForthVC.h"
#import "UIView+ToasteCurbView.h"
#import "AppDelegate.h"
@implementation BaseTabBarController

-(void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    FirstVC* first = [[FirstVC alloc] init];
    UINavigationController* nav1 = [[UINavigationController alloc] initWithRootViewController:first];
    first.tabBarItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemMore tag:0];
    
    
    
    SecondVC* second = [[SecondVC alloc] init];
    UINavigationController* nav2 = [[UINavigationController alloc] initWithRootViewController:second];
    second.tabBarItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemFavorites tag:1];
    
    ThirdVC* third = [[ThirdVC alloc] init];
    UINavigationController* nav3 = [[UINavigationController alloc] initWithRootViewController:third];
    third.tabBarItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemFeatured tag:2];
    
    ForthVC* forth = [[ForthVC alloc] init];
    UINavigationController* nav4 = [[UINavigationController alloc] initWithRootViewController:forth];
    forth.tabBarItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemDownloads tag:3];
    
    self.viewControllers = @[nav1,nav2,nav3,nav4];
    
    
    
    
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    AppDelegate* app = [UIApplication sharedApplication].delegate;
    [app.window makeToastView:@"hello world"];
    
}


@end
