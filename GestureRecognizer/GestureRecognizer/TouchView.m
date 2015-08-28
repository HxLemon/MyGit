//
//  TouchView.m
//  GestureRecognizer
//
//  Created by qianfeng001 on 15/7/2.
//  Copyright (c) 2015年 whx. All rights reserved.
//

#import "TouchView.h"

@implementation TouchView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(instancetype)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if (self) {
        self.backgroundColor=[UIColor redColor];
    }
    return self;
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    
    
    NSLog(@"TouchView被触摸了");
}

@end
