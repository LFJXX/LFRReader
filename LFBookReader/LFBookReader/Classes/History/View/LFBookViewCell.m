//
//  LFBookViewCell.m
//  LFBookReader
//
//  Created by apple on 16/4/1.
//  Copyright © 2016年 xyb100. All rights reserved.
//

#import "LFBookViewCell.h"


@interface LFBookViewCell ()
@property (weak, nonatomic) IBOutlet UIImageView *iconVIew;
@property (weak, nonatomic) IBOutlet UILabel *nameLable;
@property (weak, nonatomic) IBOutlet UILabel *authorLable;
@property (weak, nonatomic) IBOutlet UILabel *contentsView;
//@property (weak, nonatomic) IBOutlet UIButton *competitionBtn;

@end
@implementation LFBookViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.competitionBtn.layer.cornerRadius = self.competitionBtn.height/2;
    self.competitionBtn.layer.masksToBounds = YES;
}

- (void)setBooklist:(LFBookList *)booklist{

    _booklist = booklist;
    NSString *bid = [NSString stringWithFormat:@"%zd",booklist.bid];
    NSString *str = [bid substringFromIndex:bid.length - 3];
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://wfqqreader.3g.qq.com/cover/%@/%@/t5_%@.jpg",str,bid,bid]];
    if (!url) {
        url = [NSURL URLWithString:[NSString stringWithFormat:@"http://wfqqreader.3g.qq.com/cover/%@/%@/m_%@.jpg",str,bid,bid]];
    }
    [self.iconVIew sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"2"]];
    self.nameLable.text = booklist.title;
    self.authorLable.text = booklist.author;
    self.contentsView.text = booklist.intro;
    
}

- (void)setBookInfo:(LFBookInfo *)bookInfo{

    _bookInfo = bookInfo;
    
    NSString *bid = [NSString stringWithFormat:@"%zd",bookInfo.bid];
    NSString *str;
    if (bid.length > 3) {
        
      str  = [bid substringFromIndex:bid.length - 3];
    }
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://wfqqreader.3g.qq.com/cover/%@/%@/t5_%@.jpg",str,bid,bid]];
    NSData *data = [NSData dataWithContentsOfURL:url];
    if (!data) {
        url = [NSURL URLWithString:[NSString stringWithFormat:@"http://wfqqreader.3g.qq.com/cover/%@/%@/m_%@.jpg",str,bid,bid]];
    }
    [self.iconVIew sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"2"]];
    self.nameLable.text = bookInfo.title;
    self.authorLable.text = bookInfo.author;
    self.contentsView.text = bookInfo.desc;
    
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
