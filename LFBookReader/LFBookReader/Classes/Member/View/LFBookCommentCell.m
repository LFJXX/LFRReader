//
//  LFBookCommentCell.m
//  LFBookReader
//
//  Created by apple on 16/4/25.
//  Copyright © 2016年 xyb100. All rights reserved.
//

#import "LFBookCommentCell.h"

@interface LFBookCommentCell ()
@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@property (weak, nonatomic) IBOutlet UILabel *nameLable;
@property (weak, nonatomic) IBOutlet UIButton *auther;
@property (weak, nonatomic) IBOutlet UILabel *commentCount;
@property (weak, nonatomic) IBOutlet UIButton *bookSource;
@property (weak, nonatomic) IBOutlet UILabel *weekScore;
@property (weak, nonatomic) IBOutlet UILabel *scorebank;

@end
@implementation LFBookCommentCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setBookComment:(LFBookComment *)bookComment{

    _bookComment = bookComment;
    NSString *bid = [NSString stringWithFormat:@"%zd",bookComment.book.bid];
    NSString *str = [bid substringFromIndex:bid.length - 3];
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://wfqqreader.3g.qq.com/cover/%@/%@/t5_%@.jpg",str,bid,bid]];
    if (!url) {
        url = [NSURL URLWithString:[NSString stringWithFormat:@"http://wfqqreader.3g.qq.com/cover/%@/%@/m_%@.jpg",str,bid,bid]];
    }
    [self.iconView sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"2"]];
    self.nameLable.text = bookComment.book.title;
    [self.auther setTitle:bookComment.book.author forState:UIControlStateNormal];
//    self.commentCount.text = [NSString stringWithFormat:@"书评  %ld",bookComment.book.commentcount];
    self.weekScore.text = [NSString stringWithFormat:@"周活跃  %ld",bookComment.book.score];
    self.scorebank.text = [NSString stringWithFormat:@"( 排名  %ld )",bookComment.book.scorerank];
    [self.bookSource setTitle:bookComment.book.topuser.lastObject forState:UIControlStateNormal];
    
    self.commentCount.attributedText = [self accordingWithString:[NSString stringWithFormat:@"书评  %ld",bookComment.book.commentcount] String:[NSString stringWithFormat:@"%ld",bookComment.book.commentcount]];
    
    self.weekScore.attributedText = [self accordingWithString:[NSString stringWithFormat:@"周活跃  %ld",bookComment.book.score] String:[NSString stringWithFormat:@"%ld",bookComment.book.score]];
   
    self.scorebank.attributedText = [self accordingWithString:[NSString stringWithFormat:@"( 排名  %ld )",bookComment.book.scorerank] String:[NSString stringWithFormat:@"%ld",bookComment.book.scorerank]];
}
#pragma  mark - 设置titleLabel显示文字颜色
- (NSMutableAttributedString *)accordingWithString:(NSString*)str1 String:(NSString*)str2
{
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:str1];
    NSRange range = [str1 rangeOfString:str2];
    [str addAttribute:NSForegroundColorAttributeName value:[UIColor grayColor] range:NSMakeRange(0, str1.length)];
    [str addAttribute:NSForegroundColorAttributeName value:[UIColor orangeColor] range:range];
    
    return  str;
}

@end
