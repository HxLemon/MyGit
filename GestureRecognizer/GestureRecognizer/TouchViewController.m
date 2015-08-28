//
//  TouchViewController.m
//  GestureRecognizer
//
//  Created by qianfeng001 on 15/7/2.
//  Copyright (c) 2015年 whx. All rights reserved.
//

#import "TouchViewController.h"
#import "TouchView.h"
@interface TouchViewController ()

@end

@implementation TouchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    TouchView *tv =[[TouchView alloc] initWithFrame:CGRectMake(50, 100, 200, 200)];
    
    [self.view addSubview:tv];
    
    [tv release];
    
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"开始触摸");
    //单点触摸
#if 0  
    UITouch *touch=[touches anyObject];
    
    CGPoint point=[touch locationInView:self.view];
    
    NSLog(@"%@",NSStringFromCGPoint(point));
    
    //多点触摸
    
#else
    NSSet *touchesSet=[event allTouches];
    
    for (UITouch *touch in touchesSet) {
        CGPoint point=[touch locationInView:self.view];
        
        NSLog(@"%@",NSStringFromCGPoint(point));
    }
#endif
}


-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"触摸结束");
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"触摸移动");
}

-(void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"来电中断");
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
