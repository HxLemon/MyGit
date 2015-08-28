//
//  ShakeViewController.m
//  GestureRecognizer
//
//  Created by qianfeng001 on 15/7/2.
//  Copyright (c) 2015年 whx. All rights reserved.
//

#import "ShakeViewController.h"
#import "UIView+shakeAnimation.h"
@interface ShakeViewController ()

@end

@implementation ShakeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self createImageView];
}

-(void)createImageView
{
    UIImageView *imageview=[[UIImageView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    
    imageview.tag=1;
    
    NSString *path=[[NSBundle mainBundle] pathForResource:@"10_5" ofType:@"jpg"];
    
    UIImage *image=[UIImage imageWithContentsOfFile:path];
    
    imageview.image=image;
    
    [imageview shakeWithRaid:0.5 duration:0.5 repeatCount:0];
    
    [self.view addSubview:imageview];
    [imageview release];
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
