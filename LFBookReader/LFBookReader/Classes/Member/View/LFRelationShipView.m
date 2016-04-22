//
//  LFRelationShipView.m
//  LFBookReader
//
//  Created by apple on 16/4/22.
//  Copyright © 2016年 xyb100. All rights reserved.
//

#import "LFRelationShipView.h"

@implementation LFRelationShipView

- (instancetype)initWithFrame:(CGRect)frame{

    if (self = [super initWithFrame:frame]) {
        [self setUpUI];
    }
    return self;
}

- (void)setUpUI{
    
    CGFloat marginX = 10;
    CGFloat height = 150;
  
    
    CGFloat Y = 0;
    CGFloat W = (self.width - 2*marginX)/3;
    CGFloat H = height - 20;
    for (int i = 0; i < 3; i++) {
        CGFloat X = W*i;
        LFBookeView *view = [LFBookeView bookView];
        view.tag = i;
        view.nameLable.backgroundColor = [UIColor clearColor];
        view.frame = CGRectMake(X, Y, W, H);
        view.tag = i;
        view.userInteractionEnabled = YES;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(relationShipViewDidClick:)];
        [view addGestureRecognizer:tap];
        [self addSubview:view];
    }

}


- (void)relationShipViewDidClick:(UIGestureRecognizer *)tap{

}
@end
