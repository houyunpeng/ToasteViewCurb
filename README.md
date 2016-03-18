#install by cocoapods
	ADD  pod 'ToasteCurbView', :git => 'git@github.com:houyunpeng/ToasteViewCurb.git'  to your Podfile,
	then,pod install.




##usage

 toast has 6 animationTypes: 
 
 * AnimatioTypeCube,
 * AnimatioTypePageUnCurl,
 * AnimatioTypeRippleEffect,
 * AnimatioTypeSuckEffect,
 * AnimatioTypePageCurl,
 * AnimatioTypeOglFlip
 
 pageCurl               向上翻一页
 
 pageUnCurl             向下翻一页
 
 rippleEffect             滴水效果
 
 suckEffect 收缩效果，如一块布被抽走
 
 cube                   立方体效果
 
 oglFlip              上下翻转效果
 
 
##效果图

![](/Users/houyunpeng/Desktop/Simulator Screen Shot 2016年2月3日 下午5.24.09.png)
![](/Users/houyunpeng/Desktop/Simulator Screen Shot 2016年2月3日 下午5.24.05.png)
![](/Users/houyunpeng/Desktop/Simulator Screen Shot 2016年2月3日 下午5.23.57.png)

 
### .h header file
```
@interface UIView (ToasteCurbView)
-(void)makeToastView:(NSString*)title;
-(void)makeToastView:(NSString*)title offsetHeight:(CGFloat)offsetHeight;
-(void)makeToastView:(NSString*)title offsetHeight:(CGFloat)offsetHeight animationType:(AnimationType)ap;
@end
```

### .m file
```
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
        
        /* set toasteBackgroundcolor */
        _contentLab.backgroundColor = [UIColor whiteColor];
        
        CATransition *animation = [CATransition animation];
        [animation setDuration:AnimationDurition];
        [animation setFillMode:kCAFillModeForwards];
        [animation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut]];
        [animation setType:[self animationType]];
        //    animation.type = kCATransitionPush;
        [animation setSubtype:kCATransitionFromBottom];
        animation.delegate = self;
        [animation setValue:@"step1" forKey:@"name"];
        [_toastView.layer addAnimation:animation forKey:@"1"];
    });
}

```






