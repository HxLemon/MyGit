//
//  SwipeViewController.m
//  GestureRecognizer
//
//  Created by qianfeng001 on 15/7/2.
//  Copyright (c) 2015年 whx. All rights reserved.
//

#import "SwipeViewController.h"

@interface SwipeViewController ()

@end

@implementation SwipeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self createImageView];
}

-(void)createImageView
{
    
    UIImageView *imageView=[[UIImageView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    
    imageView.tag=1;
    
    imageView.image=[UIImage imageNamed:@"10_0.jpg"];
    
    imageView.userInteractionEnabled=YES;
    
    [self.view addSubview:imageView];
    
    [imageView release];
    
    //添加滑动手势
    
    UISwipeGestureRecognizer *leftSwipe =[[UISwipeGestureRecognizer alloc]
            initWithTarget:self action:@selector(swipe:)];
    //设置滑动方向
    leftSwipe.direction=UISwipeGestureRecognizerDirectionLeft;
    [imageView addGestureRecognizer:leftSwipe];
    [leftSwipe release];

    //向右滑动
    
    UISwipeGestureRecognizer *rightSwipe=[[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipe:)];
    
    rightSwipe.direction=UISwipeGestureRecognizerDirectionRight;
    
    [imageView addGestureRecognizer:rightSwipe];
    [rightSwipe release];
    
}

-(void)swipe:(UISwipeGestureRecognizer *)sgr
{
    if (sgr.direction&UISwipeGestureRecognizerDirectionLeft) {
        NSLog(@"向左滑动");
    }else if (sgr.direction&&UISwipeGestureRecognizerDirectionRight){
        NSLog(@"向右滑动");
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
