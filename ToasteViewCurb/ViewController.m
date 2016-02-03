//
//  ViewController.m
//  ToasteViewCurb
//
//  Created by 侯云鹏 on 16/2/2.
//  Copyright © 2016年 侯云鹏. All rights reserved.
//

#import "ViewController.h"
#import "UIView+ToasteCurbView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view makeToastView:@"hellow world"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
