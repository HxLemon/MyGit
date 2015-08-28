//
//  RotationViewController.m
//  GestureRecognizer
//
//  Created by qianfeng001 on 15/7/2.
//  Copyright (c) 2015年 whx. All rights reserved.
//

#import "RotationViewController.h"

@interface RotationViewController ()

@end

@implementation RotationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self createRotation];
    
    
}

-(void)createRotation
{
    UIImageView *imageView=[[UIImageView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    
    imageView.tag=1;
    
    imageView.image=[UIImage imageNamed:@"10_0.jpg"];
    
    imageView.userInteractionEnabled=YES;
    
    imageView.center=self.view.center;
    [self.view addSubview:imageView];
    
    [imageView release];
    
    //定义旋转手势
    
    UIRotationGestureRecognizer *rgr =[[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(rotation:)];

    [imageView addGestureRecognizer:rgr];
    
    [rgr release];
}

-(void)rotation:(UIRotationGestureRecognizer*)rgr
{
    static CGFloat roatation=0;
    rgr.view.transform=CGAffineTransformMakeRotation(rgr.rotation+roatation);
    
    if (rgr.state==UIGestureRecognizerStateEnded) {
        roatation=rgr.rotation;
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
