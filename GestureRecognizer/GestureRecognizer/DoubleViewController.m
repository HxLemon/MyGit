//
//  DoubleViewController.m
//  GestureRecognizer
//
//  Created by qianfeng001 on 15/7/2.
//  Copyright (c) 2015年 whx. All rights reserved.
//

#import "DoubleViewController.h"

@interface DoubleViewController ()

@end

@implementation DoubleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self createDouble];
}

-(void)createDouble
{
    UIImageView *imageView=[[UIImageView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    
    imageView.tag=1;
    
    imageView.image=[UIImage imageNamed:@"10_0.jpg"];
    
    imageView.userInteractionEnabled=YES;
    
    imageView.center=self.view.center;
    [self.view addSubview:imageView];
    
    [imageView release];

    //添加捏合手势
    
    UIPinchGestureRecognizer *pgr =[[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(pinch:)];
    pgr.delegate=self;
    
    [imageView addGestureRecognizer:pgr];
    [pgr release];
    
    //添加旋转手势
    
    UIRotationGestureRecognizer*rgr=[[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(rotation:)];
    
    rgr.delegate=self;
    [imageView addGestureRecognizer:rgr];
    [rgr release];
}


-(void)pinch:(UIPinchGestureRecognizer *)pgr
{
    if (pgr.state==UIGestureRecognizerStateBegan||pgr.state==UIGestureRecognizerStateChanged ) {
    
        pgr.view.transform=CGAffineTransformScale(pgr.view.transform, pgr.scale, pgr.scale);
    
        [pgr setScale:1 ];
    }
}

-(BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer
{
    return YES;
}

-(void)rotation:(UIRotationGestureRecognizer*)rgr
{
    
    if (rgr.state==UIGestureRecognizerStateBegan||rgr.state==UIGestureRecognizerStateChanged) {
        rgr.view.transform=CGAffineTransformRotate(rgr.view.transform,rgr.rotation);
        //重置
        [rgr setRotation:1];
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
