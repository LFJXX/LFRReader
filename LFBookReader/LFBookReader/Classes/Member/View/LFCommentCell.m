//
//  LFCommentCell.m
//  LFBookReader
//
//  Created by apple on 16/4/21.
//  Copyright © 2016年 xyb100. All rights reserved.
//

#import "LFCommentCell.h"


@interface LFCommentCell ()
@property (nonatomic,weak) UIView *titleView;
@property (nonatomic,weak) UILabel *titleLable;
@property (nonatomic,weak) UILabel *commentLable;
@property (nonatomic,weak) UILabel *weekLable;
@property (nonatomic,weak) UIImageView *iconView;
@property (nonatomic,weak) UILabel *nameLable;
@property (nonatomic,weak) UILabel *timeLable;
@property (nonatomic,weak) UILabel *textlable;
@property (nonatomic,weak) UILabel *contentLable;
@property (nonatomic,weak) UILabel *platFormLable;
@property (nonatomic,weak) UILabel *replayLable;
@property (nonatomic,weak) UILabel *likeLable;
@end
@implementation LFCommentCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{

    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self makeUI];
    }
    return self;
}
- (void)setBookDetailInfo:(LFBookDetailInfo *)bookDetailInfo{
    _bookDetailInfo = bookDetailInfo;
    self.commentLable.text = [NSString stringWithFormat:@"书评  %ld",bookDetailInfo.commentinfo.commentcount];
    self.weekLable.text = [NSString stringWithFormat:@"周活跃  %ld",bookDetailInfo.commentinfo.score];
    
    
    
}

- (void)setCommentList:(LFCommentList *)commentList{

    _commentList = commentList;
    [self.iconView sd_setImageWithURL:[NSURL URLWithString:commentList.user.icon]];
    self.nameLable.text = commentList.user.nickname;
    NSString *timestr = [NSString stringWithFormat:@"%ld",commentList.createtime];
    self.timeLable.text = [LFUtility stringFromData:[LFUtility dateWithTimeStr:timestr]];
    self.textlable.text = commentList.title;
    self.contentLable.text = commentList.content;
    self.platFormLable.text = commentList.platformname;
    self.replayLable.text = [NSString stringWithFormat:@"回复%ld",commentList.status];
    self.likeLable.text = [NSString stringWithFormat:@"赞 %ld",commentList.mark];
}

- (void)setHidden:(BOOL)hidden{
    _hidden = hidden;
    if (hidden) {
        self.titleView.hidden = YES;
    }else{
        self.titleView.hidden = NO;
    }
}
- (void)makeUI{

    UIView *titleView = [[UIView alloc] init];
    self.titleView = titleView;
    [self addSubview:titleView];
    
    UILabel *titleLable = [LFUtility creatLableWithFrame:CGRectZero font:15 color:[UIColor blackColor] title:@"书评区"];
    self.titleLable = titleLable;
    [titleView addSubview:titleLable];
    
    UILabel *commentLable = [LFUtility creatLableWithFrame:CGRectZero font:13 color:[UIColor grayColor] title:@"书评"];
    self.commentLable = commentLable;
    [titleView addSubview:commentLable];
    
    UILabel *weekLable = [LFUtility creatLableWithFrame:CGRectZero font:13 color:[UIColor grayColor] title:@"周活跃"];
    self.weekLable = weekLable;
    [titleView addSubview:weekLable];
    
    UIImageView *iconView = [[UIImageView alloc] init];
    self.iconView = iconView;
    [self addSubview:iconView];
    
    UILabel *nameLable = [LFUtility creatLableWithFrame:CGRectZero font:14 color:[UIColor orangeColor] title:@""];
    self.nameLable = nameLable;
    self.nameLable.textAlignment = NSTextAlignmentLeft;
    [self addSubview:nameLable];
    
    UILabel *timeLable = [LFUtility creatLableWithFrame:CGRectZero font:14 color:[UIColor grayColor] title:@""];
    self.timeLable = timeLable;
    self.timeLable.textAlignment = NSTextAlignmentLeft;
    [self addSubview:timeLable];
    
    UILabel *textLable = [LFUtility creatLableWithFrame:CGRectZero font:15 color:[UIColor blackColor] title:@""];
    self.textlable = textLable;
    [self addSubview:textLable];
    
    UILabel *contentLable = [LFUtility creatLableWithFrame:CGRectZero font:14 color:[UIColor grayColor] title:@""];
    self.contentLable = contentLable;
    self.contentLable.numberOfLines = 0;
    [self addSubview:contentLable];
    
    UILabel *platFormLable = [LFUtility creatLableWithFrame:CGRectZero font:14 color:[UIColor grayColor] title:@""];
    self.platFormLable = platFormLable;
    [self addSubview:platFormLable];
    
    UILabel *replayLable = [LFUtility creatLableWithFrame:CGRectZero font:14 color:[UIColor grayColor] title:@""];
    self.replayLable.textAlignment = NSTextAlignmentLeft;
    self.replayLable = replayLable;
    [self addSubview:replayLable];
    
    
    UILabel *likeLable = [LFUtility creatLableWithFrame:CGRectZero font:14 color:[UIColor grayColor] title:@""];
    likeLable.textAlignment = NSTextAlignmentRight;
    self.likeLable = likeLable;
    [self addSubview:likeLable];

}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    CGFloat marginX = 10;
    CGFloat lableH = 40;
    if (self.titleView.hidden == NO) {
        
        self.titleView.frame = CGRectMake(0, marginX, LFScreenW, lableH);
    }else{
    
        self.titleView.frame = CGRectMake(0, marginX, LFScreenW, 0);
    }
    self.titleLable.frame = CGRectMake(marginX, 0, 60, lableH);
    
    CGFloat W = [self.commentLable.text boundingRectWithSize:CGSizeMake(CGFLOAT_MAX, lableH) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:self.commentLable.font} context:nil].size.width;
    self.commentLable.frame = CGRectMake(CGRectGetMaxX(self.titleLable.frame), 0, W, lableH);
    CGFloat weekW = [self.weekLable.text boundingRectWithSize:CGSizeMake(CGFLOAT_MAX, lableH) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:self.weekLable.font} context:nil].size.width;
    self.weekLable.frame = CGRectMake(CGRectGetMaxX(self.commentLable.frame)+2*marginX, 0, weekW, lableH);
    self.iconView.frame = CGRectMake(marginX, CGRectGetMaxY(self.titleView.frame), 40, 40);
    self.nameLable.frame = CGRectMake(CGRectGetMaxX(self.iconView.frame)+marginX, self.iconView.y, LFScreenW, lableH/2);
    self.timeLable.frame = CGRectMake(self.nameLable.x,CGRectGetMaxY(self.nameLable.frame), LFScreenW, lableH/2);
    
    CGFloat contentH = [self.contentLable.text boundingRectWithSize:CGSizeMake(LFScreenW - 2*marginX, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:self.contentLable.font} context:nil].size.height;
    if (self.commentList.title.length > 0) {
        
        self.textlable.frame = CGRectMake(marginX, CGRectGetMaxY(self.iconView.frame)+marginX, LFScreenW, lableH/2);
        self.contentLable.frame = CGRectMake(marginX, CGRectGetMaxY(self.textlable.frame)+marginX, LFScreenW - 2*marginX, contentH);
    }else{
        self.contentLable.frame = CGRectMake(marginX, CGRectGetMaxY(self.iconView.frame)+marginX, LFScreenW - 2*marginX, contentH);
    }
    CGFloat platFormW = [self.platFormLable.text boundingRectWithSize:CGSizeMake(CGFLOAT_MAX, lableH/2) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:self.platFormLable.font} context:nil].size.width;
    self.platFormLable.frame = CGRectMake(marginX, CGRectGetMaxY(self.contentLable.frame)+marginX, platFormW, lableH/2);
    self.replayLable.frame = CGRectMake(CGRectGetMaxX(self.platFormLable.frame)+2*marginX, self.platFormLable.y, 100, lableH/2);
    self.likeLable.frame = CGRectMake(LFScreenW-110, self.platFormLable.y, 100, lableH/2);
}
@end
