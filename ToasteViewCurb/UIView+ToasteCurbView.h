//
//  UIView+ToasteCurbView.h
//  ToasteViewCurb
//
//  Created by 侯云鹏 on 16/2/2.
//  Copyright © 2016年 侯云鹏. All rights reserved.
//

#import <UIKit/UIKit.h>
/*
 pageCurl               向上翻一页
 
 pageUnCurl             向下翻一页
 
 rippleEffect             滴水效果
 
 suckEffect 收缩效果，如一块布被抽走
 
 cube                   立方体效果
 
 oglFlip              上下翻转效果
 
 */
typedef NS_ENUM(NSUInteger, AnimationType) {
    AnimatioTypeCube,
    AnimatioTypePageUnCurl,
    AnimatioTypeRippleEffect,
    AnimatioTypeSuckEffect,
    AnimatioTypePageCurl,
    AnimatioTypeOglFlip,

    
};
@interface UIView (ToasteCurbView)
-(void)makeToastView:(NSString*)title;

-(void)makeToastView:(NSString*)title offsetHeight:(CGFloat)offsetHeight;

-(void)makeToastView:(NSString*)title offsetHeight:(CGFloat)offsetHeight animationType:(AnimationType)ap;


@end
