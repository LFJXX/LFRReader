//
//  LFComposeView.m
//  LFBookReader
//
//  Created by apple on 16/4/27.
//  Copyright © 2016年 xyb100. All rights reserved.
//

#import "LFComposeView.h"
#import "LFTextView.h"
@interface LFComposeView ()<LFTextViewDeleagte>

@property (nonatomic,weak) UILabel *numCountLable;
@property (nonatomic,weak) LFTextView *commentView;
@end

@implementation LFComposeView

- (instancetype)initWithFrame:(CGRect)frame{

    if (self = [super initWithFrame:frame]) {
        [self setUpUI];
    }
    return self;
}

- (void)setUpUI{
    CGFloat marginX = 10;
    CGFloat W = LFScreenW - 2*marginX;
    CGFloat H = 20;
    LFTextView *textView = [[LFTextView alloc] initWithFrame: CGRectMake(marginX, marginX,W, self.height - marginX - H)];
    self.commentView = textView;
    self.commentView.backgroundColor = [UIColor greenColor];
    self.commentView.delegate = self;
    [self addSubview:self.commentView];
    
    UILabel *numCountLable = [LFUtility creatLableWithFrame:CGRectMake(marginX, self.height - H, W, H) font:14 color:[UIColor grayColor] title:@"0/3000"];
    self.numCountLable = numCountLable;
    self.numCountLable.textAlignment = NSTextAlignmentRight;
    [self addSubview:self.numCountLable];
    
    
}



- (void)textViewDidChange:(UITextView *)textView{

    self.numCountLable.text = [NSString stringWithFormat:@"%ld/3000",textView.text.length];
}


@end
