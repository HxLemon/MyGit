//
//  PanViewController.m
//  GestureRecognizer
//
//  Created by qianfeng001 on 15/7/2.
//  Copyright (c) 2015年 whx. All rights reserved.
//

#import "PanViewController.h"

@interface PanViewController ()

@end

@implementation PanViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self createPan];
}

-(void)createPan
{
    UIImageView *imageView=[[UIImageView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    
    imageView.tag=1;
    
    imageView.image=[UIImage imageNamed:@"10_0.jpg"];
    
    imageView.userInteractionEnabled=YES;
    
    [self.view addSubview:imageView];
    
    [imageView release];
    
    //创建拖动手势
    
    UIPanGestureRecognizer *pgr =[[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panClick:)];
    
    [imageView addGestureRecognizer:pgr];
    
    [pgr release];
}

-(void)panClick:(UIPanGestureRecognizer*)pgr
{
    //获取拖动时坐标，相当于偏移量
    CGPoint point=[pgr translationInView:pgr.view];
    
    static CGPoint center;
    
    if (pgr.state==UIGestureRecognizerStateBegan) {
        //记录起始坐标
        center=pgr.view.center;
    }
    pgr.view.center=CGPointMake(point.x+center.x, point.y+center.y);
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
