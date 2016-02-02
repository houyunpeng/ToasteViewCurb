//
//  UIView+ToasteCurbView.m
//  ToasteViewCurb
//
//  Created by 侯云鹏 on 16/2/2.
//  Copyright © 2016年 侯云鹏. All rights reserved.
//

#import "UIView+ToasteCurbView.h"
static bool _isMoving = NO;
static UILabel* _contentLab = nil;
static UIImageView* _bgIV = nil;
static UIView* _toastView = nil;
static NSString* _title = @"";
static UIImage* _subImage = nil;
#define AnimationDurition 0.35
#define WaitingDurition 1.5
@implementation UIView (ToasteCurbView)
-(void)makeToastView:(NSString*)title
{
    if (!_isMoving) {
        CGRect frame = CGRectMake(0, 3, 375, 40);
        _toastView = [[UIView alloc] initWithFrame:frame];
        _toastView.backgroundColor = [UIColor clearColor];
        [self addSubview:_toastView];
        _contentLab = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 375, 40)];
        _contentLab.textAlignment = NSTextAlignmentCenter;
        _contentLab.numberOfLines = 0;
        _contentLab.backgroundColor = [UIColor clearColor];
        _contentLab.layer.backgroundColor = [UIColor clearColor].CGColor;
        _contentLab.textColor = [UIColor lightGrayColor];
        [_toastView.layer addSublayer:_contentLab.layer];
        _bgIV = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 375, 40)];
        _bgIV.image = nil;
        _bgIV.contentMode = UIViewContentModeScaleAspectFit;
        [_toastView.layer addSublayer:_bgIV.layer];
        
        UIImage* image = [self capture];
        _subImage = [self cutImage:image toRect:_contentLab.frame];
        _bgIV.image = _subImage;
        
        _title = title;
        _isMoving = YES;
        
        
        
        [self action];
    }
    
}

#pragma mark - Utility Methods -生成透明的图片
- (UIImage *)capture
{
    UIView* superView = self.superview==nil?self:self.superview;
    CGRect rect = [superView convertRect:self.frame fromView:self];
    
    
    
    UIGraphicsBeginImageContextWithOptions(rect.size, self.opaque, 0.0);
    [self.layer renderInContext:UIGraphicsGetCurrentContext()];
    
    UIImage * img = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return img;
}

-(UIImage*)cutImage:(UIImage*)image toRect:(CGRect)rect
{
    CGRect tRect = CGRectMake(CGRectGetMinX(rect), CGRectGetMinY(rect), CGRectGetWidth(rect)*2, CGRectGetHeight(rect)*2);
    CGImageRef subImageRef = CGImageCreateWithImageInRect(image.CGImage, tRect);
    CGRect smallBounds = CGRectMake(0, 0, CGImageGetWidth(subImageRef), CGImageGetHeight(subImageRef));
    
    UIGraphicsBeginImageContext(smallBounds.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextDrawImage(context, smallBounds, subImageRef);
    UIImage* smallImage = [UIImage imageWithCGImage:subImageRef];
    UIGraphicsEndImageContext();
    
    return smallImage;
}

-(void)action
{
    
    /*
     pageCurl               向上翻一页
     
     pageUnCurl             向下翻一页
     
     rippleEffect             滴水效果
     
     suckEffect 收缩效果，如一块布被抽走
     
     cube                   立方体效果
     
     oglFlip              上下翻转效果
     
     */
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(.01 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        _contentLab.text = _title;
        _bgIV.image = nil;
        //        [_toast bringSubviewToFront:_toastView];
        [_bgIV removeFromSuperview];
        _contentLab.backgroundColor = [UIColor whiteColor];
        CATransition *animation = [CATransition animation];
        [animation setDuration:AnimationDurition];
        [animation setFillMode:kCAFillModeForwards];
        [animation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut]];
        [animation setType:@"cube"];
        //    animation.type = kCATransitionPush;
        [animation setSubtype:kCATransitionFromBottom];
        animation.delegate = self;
        [animation setValue:@"step1" forKey:@"name"];
        [_toastView.layer addAnimation:animation forKey:@"1"];
    });
}
-(void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    if ([[anim valueForKey:@"name"] isEqualToString:@"step1"]) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(WaitingDurition * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            _contentLab.text = @"";
            _contentLab.backgroundColor = [UIColor whiteColor];
            //            [_toastView bringSubviewToFront:_bgIV];
            [_toastView addSubview:_bgIV];
            _bgIV.image = _subImage;
            
            CATransition *animation = [CATransition animation];
            [animation setDuration:AnimationDurition];
            [animation setFillMode:kCAFillModeForwards];
            [animation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut]];
            [animation setType:@"cube"];
            //    animation.type = kCATransitionPush;
            [animation setSubtype:kCATransitionFromTop];
            animation.delegate = self;
            [_toastView.layer addAnimation:animation forKey:@"2"];
        });
    }else{
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.01 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [_toastView removeFromSuperview];
            
            [self reset];
        });
    }
    
}

-(void)reset
{
    _isMoving = NO;
    _title = nil;
}

@end
