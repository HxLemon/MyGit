//
//  ViewController.m
//  HXPlayerDemo
//
//  Created by qianfeng001 on 15/8/26.
//  Copyright (c) 2015年 王华歆. All rights reserved.
//

#import "ViewController.h"
#define kPath @"http://7fvgtj.com2.z0.glb.qiniucdn.com/e254fdd852cd761259c8e6b6ccb6116534a2acee"
#import <AVFoundation/AVFoundation.h>
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSURL *url =[NSURL URLWithString:kPath];
    AVAsset*asset =[AVURLAsset URLAssetWithURL:url options:nil];
    AVPlayerItem*playerItem=[AVPlayerItem playerItemWithAsset:asset];
    AVPlayer*player=[AVPlayer playerWithPlayerItem:playerItem];
    AVPlayerLayer*layer=[AVPlayerLayer playerLayerWithPlayer:player];
    layer.frame=self.view.layer.bounds;
    
    [self.view.layer addSublayer:layer];
    [player play];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
