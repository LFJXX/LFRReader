//
//  LFBookReviewCell.m
//  LFBookReader
//
//  Created by apple on 16/4/1.
//  Copyright © 2016年 xyb100. All rights reserved.
//

#import "LFBookReviewCell.h"

@interface LFBookReviewCell ()
@property (weak, nonatomic) IBOutlet UILabel *titleLable;
@property (weak, nonatomic) IBOutlet UILabel *authorLable;
@property (weak, nonatomic) IBOutlet UILabel *contenView;
@property (weak, nonatomic) IBOutlet UIImageView *iconView;

@end

@implementation LFBookReviewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.iconView.layer.cornerRadius = 5;
    self.iconView.layer.masksToBounds = YES;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (void)setBooklist:(LFBookList *)booklist{
    
    _booklist = booklist;
    NSString *bid = [NSString stringWithFormat:@"%zd",booklist.bid];
    NSString *str = [bid substringFromIndex:bid.length - 3];
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://wfqqreader.3g.qq.com/cover/%@/%@/t5_%@.jpg",str,bid,bid]];
    if (!url) {
        url = [NSURL URLWithString:[NSString stringWithFormat:@"http://wfqqreader.3g.qq.com/cover/%@/%@/m_%@.jpg",str,bid,bid]];
    }
    [self.iconView sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"2"]];
    self.titleLable.text = booklist.title;
    self.authorLable.text = booklist.author;
    self.contenView.text = booklist.intro;
    
}


@end
