//
//  RootViewController.h
//  UIScrollView2
//
//  Created by qianfeng001 on 15/7/3.
//  Copyright (c) 2015年 whx. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RootViewController : UIViewController<UIScrollViewDelegate>

@property (strong,atomic)UIScrollView *srollView;

@property(strong,atomic)UIPageControl*pageControl;

@property(strong,atomic)NSTimer*timer;

@end
