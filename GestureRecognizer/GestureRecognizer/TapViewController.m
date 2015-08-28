//
//  TapViewController.m
//  GestureRecognizer
//
//  Created by qianfeng001 on 15/7/2.
//  Copyright (c) 2015年 whx. All rights reserved.
//

#import "TapViewController.h"

@interface TapViewController ()

@end

@implementation TapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self createImageView];
}

-(void)createImageView
{
    UIImageView *imageView=[[UIImageView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    
    imageView.tag=1;
    
    
    
    NSString *path=[[NSBundle mainBundle] pathForResource:@"10_0" ofType:@"jpg"];
    
    NSData *data=[NSData dataWithContentsOfFile:path];
    
    UIImage*image=[UIImage imageWithData:data];
    imageView.image=image;
    
    [self.view addSubview:imageView];
    [imageView release];
    
    //敲击手势
    
    UITapGestureRecognizer *tap=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapClick:)];
    imageView.userInteractionEnabled=YES;
    [imageView addGestureRecognizer:tap];
    [tap release];
    
    //添加双击手势
    //一个试图可以有多个手势。但一个手势只能添加在一个视图上
    
    UITapGestureRecognizer *doubleTap=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(doubleTapClick:)];
    
    doubleTap.numberOfTapsRequired=2;
    [imageView addGestureRecognizer:doubleTap];
    [doubleTap release];
    
    //优先响应双击手势。双击失败，再响应单击手势
    [tap requireGestureRecognizerToFail:doubleTap];
}

-(void)tapClick:(UITapGestureRecognizer*)tap
{
    NSLog(@"图片被敲击了");
}

-(void)doubleTapClick:(UITapGestureRecognizer*)doubleTap
{
    NSLog(@"图片被双击了");
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
