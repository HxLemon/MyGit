//
//  LongPressViewController.m
//  GestureRecognizer
//
//  Created by qianfeng001 on 15/7/2.
//  Copyright (c) 2015年 whx. All rights reserved.
//

#import "LongPressViewController.h"

@interface LongPressViewController ()

@end

@implementation LongPressViewController

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
    
    UILongPressGestureRecognizer *longPress =[[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPressClick:)];
    //设置几根手指有效
    longPress.numberOfTouchesRequired=1;
    //设置最小响应时间
    longPress.minimumPressDuration=3;
    
    [imageView addGestureRecognizer:longPress];
    [longPress release];
}

-(void)longPressClick:(UILongPressGestureRecognizer*)longpPress
{
    NSLog(@"图片被长按了");
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
