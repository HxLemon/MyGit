//
//  RootViewController.m
//  UIScrollView2
//
//  Created by qianfeng001 on 15/7/3.
//  Copyright (c) 2015年 whx. All rights reserved.
//

#import "RootViewController.h"

@interface RootViewController ()

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    [self createScrollView];
    
}

-(void)createScrollView
{
    _srollView=[[UIScrollView alloc] initWithFrame:self.view.bounds];
    //contentsize的高度小于scrollView的高度，图片就不会垂直滚动
    _srollView.contentSize=CGSizeMake(_srollView.frame.size.width*8, 0);
   // _srollView.contentOffset=CGPointMake(_srollView.bounds.size.width, 0);

    for (int i=0; i<8; i++) {
        UIImageView *imageView =[[UIImageView alloc] initWithFrame:CGRectMake(i*_srollView.frame.size.width, 0, _srollView.bounds.size.width, _srollView.bounds.size.height)];
        
        //广告关闭，对应的image释放掉
        NSString *path=nil;
        
        if (i!=7&&i!=0) {
            path=[NSString stringWithFormat:@"海贼0%d",i];
        }else if(i==7){
            path=[NSString stringWithFormat:@"海贼01"];
        }else if(i==0){
            path=[NSString stringWithFormat:@"海贼06"];
        }
        
        NSString *filePath=[[NSBundle mainBundle] pathForResource:path ofType:@"jpg"];
        UIImage*image=[UIImage imageWithContentsOfFile:filePath];
        
        //image离开imageview的时候会自动release一次，但是图片不会消失，imageview会自动保留计数
        imageView.image=image;
        
        [_srollView addSubview:imageView];
    
        [imageView release];
        
        
    }
    
    
    //设置scrollView翻页
    _srollView.pagingEnabled=YES;
    
    //设置反弹效果
    _srollView.bounces=NO;
    
    _srollView.delegate=self;
    [self.view addSubview:_srollView];
    
    [self createPageControl];
    
    [self createTimer];
}

-(void)createPageControl
{
    _pageControl=[[UIPageControl alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height-40, self.view.frame.size.width, 40)];
    
    _pageControl.backgroundColor=[UIColor orangeColor];
    
    _pageControl.pageIndicatorTintColor=[UIColor redColor];
    
    _pageControl.currentPageIndicatorTintColor=[UIColor blueColor];
    
    _pageControl.numberOfPages=6;
    
    
    
    [self.view addSubview:_pageControl];
    
}

-(void)createTimer
{
    _timer=[NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(nextImage) userInfo:nil repeats:YES];
    
    [_timer setFireDate:[NSDate distantPast]];
}

-(void)nextImage
{
    CGPoint point =_srollView.contentOffset;
    
    if (point.x<_srollView.bounds.size.width*6) {
        _pageControl.currentPage=(_srollView.contentOffset.x/_srollView.bounds.size.width);
        _srollView.contentOffset=CGPointMake(point.x+_srollView.bounds.size.width, 0);
        
    }else if(point.x==_srollView.bounds.size.width*6){
        
        _srollView.contentOffset=CGPointMake(_srollView.bounds.size.width*7, 0);
        [self scrollViewDidEndDecelerating:_srollView];
    }
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    //NSLog(@"减速结束");
    
    if (scrollView.contentOffset.x==_srollView.bounds.size.width*7) {
        [_srollView setContentOffset:CGPointMake(_srollView.bounds.size.width, 0)];
        
    }
    else if (scrollView.contentOffset.x==0){
        [_srollView setContentOffset:CGPointMake(_srollView.bounds.size.width*6, 0)];
        
    }
    
    _pageControl.currentPage=(_srollView.contentOffset.x/_srollView.bounds.size.width);

}

-(void)dealloc
{
    [_pageControl release];
    _pageControl=nil;
    [_srollView release];
    _srollView=nil;
    [super dealloc];
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
