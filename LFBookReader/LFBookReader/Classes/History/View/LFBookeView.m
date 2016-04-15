//
//  LFBookeView.m
//  LFBookReader
//
//  Created by apple on 16/3/31.
//  Copyright © 2016年 xyb100. All rights reserved.
//

#import "LFBookeView.h"

@implementation LFBookeView

+ (LFBookeView *)bookView{
    
    return  [[[NSBundle mainBundle] loadNibNamed:@"LFBookView" owner:self options:nil] lastObject];
}

- (void)setBookList:(LFBookList *)bookList{
    
    _bookList = bookList;
    NSString *bid = [NSString stringWithFormat:@"%zd",bookList.bid];
    NSString *str = [bid substringFromIndex:bid.length - 3];
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://wfqqreader.3g.qq.com/cover/%@/%@/t5_%@.jpg",str,bid,bid]];
    NSData *data = [NSData dataWithContentsOfURL:url];
    if (!data) {
        url = [NSURL URLWithString:[NSString stringWithFormat:@"http://wfqqreader.3g.qq.com/cover/%@/%@/m_%@.jpg",str,bid,bid]];
    }
    [self.iconView sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"2"]];
    self.nameLable.text = bookList.title;

    
}

@end
