//
//  LFRecommendsCell.m
//  LFBookReader
//
//  Created by apple on 16/3/31.
//  Copyright © 2016年 xyb100. All rights reserved.
//

#import "LFRecommendsCell.h"

@interface LFRecommendsCell ()


@end
@implementation LFRecommendsCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.iconView.layer.cornerRadius = 10;
    self.iconView.layer.masksToBounds = YES;
}
- (void)setBooklist:(LFBookList *)booklist{
    
    _booklist = booklist;
    NSString *bid = [NSString stringWithFormat:@"%zd",booklist.bid];
    NSString *str = [bid substringFromIndex:bid.length - 3];
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://wfqqreader.3g.qq.com/cover/%@/%@/t5_%@.jpg",str,bid,bid]];
    NSData *data = [NSData dataWithContentsOfURL:url];
    if (!data) {
        url = [NSURL URLWithString:[NSString stringWithFormat:@"http://wfqqreader.3g.qq.com/cover/%@/%@/m_%@.jpg",str,bid,bid]];
    }
    [self.iconView sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"2"]];
    
    
}
@end
