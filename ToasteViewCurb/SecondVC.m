//
//  SecondVC.m
//  ToasteViewCurb
//
//  Created by 侯云鹏 on 16/2/3.
//  Copyright © 2016年 侯云鹏. All rights reserved.
//

#import "SecondVC.h"
#import "UIView+ToasteCurbView.h"
@implementation SecondVC
-(void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor cyanColor];
    
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view makeToastView:@"hello world" offsetHeight:64 animationType:arc4random()%6];
}
@end
