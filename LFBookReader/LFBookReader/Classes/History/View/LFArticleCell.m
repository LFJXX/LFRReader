//
//  LFArticleCell.m
//  LFBookReader
//
//  Created by apple on 16/4/5.
//  Copyright © 2016年 xyb100. All rights reserved.
//

#import "LFArticleCell.h"

@interface LFArticleCell ()
@property (weak, nonatomic) IBOutlet UILabel *nameLable;
@property (weak, nonatomic) IBOutlet UILabel *authorLable;
@property (weak, nonatomic) IBOutlet UILabel *articleContentLable;

@end
@implementation LFArticleCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
