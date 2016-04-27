//
//  LFReplyViewCell.m
//  LFBookReader
//
//  Created by apple on 16/4/22.
//  Copyright © 2016年 xyb100. All rights reserved.
//

#import "LFReplyViewCell.h"

@interface LFReplyViewCell()
@property (nonatomic,strong) UILabel *titleLable;
@property (nonatomic,strong) UIImageView *iconView;
@property (nonatomic,strong) UILabel *orderLable;
@property (nonatomic,strong) UILabel *auther;
@property (nonatomic,strong) UILabel *contentLable;
@property (nonatomic,strong) UILabel *timeLable;

//@property (nonatomic,strong) UILabel *replyAuther;
//@property (nonatomic,strong) UILabel *replyLable;

@end
@implementation LFReplyViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{

    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self creatUI];
    }
    return self;
}
- (void)setCommentlist:(LFCommentList *)commentlist{
    _commentlist = commentlist;
    [self.iconView sd_setImageWithURL:[NSURL URLWithString:commentlist.user.icon]];
    self.orderLable.text = [NSString stringWithFormat:@"%ld楼",commentlist.index];
    self.auther.text = commentlist.user.nickname;
    self.contentLable.text = commentlist.content;
    
}
- (void)creatUI{
    self.titleLable = [LFUtility creatLableWithFrame:CGRectZero font:15 color:[UIColor blackColor] title:@"全部回复"];
    [self addSubview:self.titleLable];
    
    self.iconView = [[UIImageView alloc] init];
    [self addSubview:self.iconView];
    
    self.orderLable = [LFUtility creatLableWithFrame:CGRectZero font:13 color:[UIColor lightGrayColor] title:@""];
    [self addSubview:self.orderLable];
    
    self.auther = [LFUtility creatLableWithFrame:CGRectZero font:14 color:[UIColor orangeColor] title:@""];
    [self addSubview:self.auther];
    
    self.contentLable = [LFUtility creatLableWithFrame:CGRectZero font:13 color:[UIColor grayColor] title:@""];
    self.contentLable.numberOfLines = 0;
    [self addSubview:self.contentLable];
    
//    self.replyLable = [LFUtility creatLableWithFrame:CGRectZero font:13 color:[UIColor grayColor] title:@"回复"];
//    [self addSubview:self.replyLable];
//    
//    self.replyAuther = [LFUtility creatLableWithFrame:CGRectZero font:13 color:[UIColor orangeColor] title:@""];
//    [self addSubview:self.replyAuther];
    
    
}

- (void)setHidden:(BOOL)hidden{

    _hidden = hidden;
    if (hidden) {
        self.titleLable.hidden = YES;
    }else{
        self.titleLable.hidden = NO;
    }

}

- (void)layoutSubviews{

    [super layoutSubviews];
    CGFloat marginX = 10;
    CGFloat W = LFScreenW - 2*marginX;
    CGFloat lableH = 20;
    CGFloat iconWH = 40;
    CGFloat titleLableH = lableH;
    CGFloat iconY = CGRectGetMaxY(self.titleLable.frame)+marginX;
    if (self.titleLable.hidden == YES) {
        titleLableH = 0;
        iconY = marginX + titleLableH;
    }else{
        titleLableH = lableH;
        iconY = titleLableH+2*marginX;
    }
    self.titleLable.frame = CGRectMake(marginX, marginX, W, titleLableH);
    self.iconView.frame = CGRectMake(marginX,iconY , iconWH, iconWH);
    self.orderLable.frame = CGRectMake(CGRectGetMaxX(self.iconView.frame) +marginX, self.iconView.y+marginX, iconWH, lableH);
    self.auther.frame = CGRectMake(CGRectGetMaxX(self.orderLable.frame)+marginX, self.orderLable.y, W -CGRectGetMaxX(self.orderLable.frame) , lableH);
//    CGFloat replyW = [self.replyLable.text boundingRectWithSize:CGSizeMake(CGFLOAT_MAX, lableH) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:self.replyLable.font} context:nil].size.width;
//    self.replyLable.frame = CGRectMake(self.orderLable.x, CGRectGetMaxY(self.orderLable.frame)+marginX, replyW, lableH);
    
    
//    CGFloat replyAuthorW = [self.replyAuther.text boundingRectWithSize:CGSizeMake(CGFLOAT_MAX, lableH) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:self.replyAuther.font} context:nil].size.width;
//    self.replyAuther.frame = CGRectMake(CGRectGetMaxX(self.replyLable.frame), self.replyLable.y, replyAuthorW, lableH);
    CGSize contentLableSize = [self.contentLable.text boundingRectWithSize:CGSizeMake(W - marginX - iconWH, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:self.contentLable.font} context:nil].size;
    self.contentLable.frame = CGRectMake(self.orderLable.x, CGRectGetMaxY(self.orderLable.frame)+marginX, contentLableSize.width, contentLableSize.height);
    
}
@end
