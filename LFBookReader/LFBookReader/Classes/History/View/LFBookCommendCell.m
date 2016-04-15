//
//  LFBookCommendCell.m
//  LFBookReader
//
//  Created by apple on 16/4/5.
//  Copyright © 2016年 xyb100. All rights reserved.
//

#import "LFBookCommendCell.h"


@interface LFBookCommendCell ()
@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@property (weak, nonatomic) IBOutlet UILabel *nameLable;
@property (weak, nonatomic) IBOutlet UILabel *Countlable;
@property (weak, nonatomic) IBOutlet UILabel *bookContentLable;

@end
@implementation LFBookCommendCell

- (void)awakeFromNib {
    // Initialization code
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
    NSData *data = [NSData dataWithContentsOfURL:url];
    if (!data) {
        url = [NSURL URLWithString:[NSString stringWithFormat:@"http://wfqqreader.3g.qq.com/cover/%@/%@/m_%@.jpg",str,bid,bid]];
    }
    [self.iconView sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"2"]];
    self.nameLable.text = booklist.title;
    self.Countlable.text = booklist.author;
    self.bookContentLable.text = booklist.intro;
    
}
@end
