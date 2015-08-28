//
//  PichViewController.m
//  GestureRecognizer
//
//  Created by qianfeng001 on 15/7/2.
//  Copyright (c) 2015年 whx. All rights reserved.
//

#import "PichViewController.h"

@interface PichViewController ()

@end

@implementation PichViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self createPich];
}

-(void)createPich
{
    
    UIImageView *imageView=[[UIImageView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    
    imageView.tag=1;
    
    imageView.image=[UIImage imageNamed:@"10_0.jpg"];
    
    imageView.userInteractionEnabled=YES;
    
    imageView.center=self.view.center;
    [self.view addSubview:imageView];
    
    [imageView release];
    
    //创建捏合手势
    UIPinchGestureRecognizer *pgr =[[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(pinch:)];
    
    [imageView addGestureRecognizer:pgr];
    [pgr release];
    
}

-(void)pinch:(UIPinchGestureRecognizer*)pgr
{
    static CGFloat scale=1;
    
    pgr.view.transform=CGAffineTransformMakeScale(scale*pgr.scale, scale*pgr.scale);
    
    if (pgr.scale==UIGestureRecognizerStateEnded) {
        scale*=pgr.scale;
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
