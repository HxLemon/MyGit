//
//  UIView+shakeAnimation.m
//  GestureRecognizer
//
//  Created by qianfeng001 on 15/7/2.
//  Copyright (c) 2015年 whx. All rights reserved.
//

#import "UIView+shakeAnimation.h"

@implementation UIView (shakeAnimation)
-(void)shakeWithRaid:(CGFloat)raid duration:(NSTimeInterval)duration repeatCount:(NSUInteger)count
{
    //添加摇动动画
    CABasicAnimation * shakeAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    
    shakeAnimation.duration=duration;
    
    shakeAnimation.fromValue=[NSNumber numberWithFloat:-raid];
    
    shakeAnimation.toValue=[NSNumber numberWithFloat:raid];
    
    shakeAnimation.autoreverses=YES;
    
    shakeAnimation.removedOnCompletion=YES;
    
    if (count==0) {
        shakeAnimation.repeatCount=FLT_MAX;
    }else{
        shakeAnimation.repeatCount=count;
    }
    
    [self.layer addAnimation:shakeAnimation forKey:@"shake and shake"];
    
    
}
//停止，移除动画
-(void)stopShake
{
    [self.layer removeAnimationForKey:@"shake and shake"];
}
@end
