//
//  UIView+shakeAnimation.h
//  GestureRecognizer
//
//  Created by qianfeng001 on 15/7/2.
//  Copyright (c) 2015年 whx. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (shakeAnimation)
-(void)shakeWithRaid:(CGFloat)raid duration:(NSTimeInterval)duration repeatCount:(NSUInteger)count;

-(void)stopShake;
@end
