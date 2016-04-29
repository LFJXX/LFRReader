//
//  LFButton.m
//  LFBookReader
//
//  Created by apple on 16/4/28.
//  Copyright © 2016年 xyb100. All rights reserved.
//

#import "LFButton.h"

@implementation LFButton

- (void)layoutSubviews{
    [super layoutSubviews];
    self.imageView.frame = CGRectMake(self.width-20, (self.height-15)/2, 15, 15);
    self.titleLabel.frame = CGRectMake(0, 0, self.width - 20, self.height);
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
}

@end
