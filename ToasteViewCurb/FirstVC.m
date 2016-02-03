//
//  FirstVC.m
//  ToasteViewCurb
//
//  Created by 侯云鹏 on 16/2/3.
//  Copyright © 2016年 侯云鹏. All rights reserved.
//

#import "FirstVC.h"
#import "UIView+ToasteCurbView.h"
@implementation FirstVC
-(void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor orangeColor];
    
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view makeToastView:@"hello world" offsetHeight:64];
}
@end
