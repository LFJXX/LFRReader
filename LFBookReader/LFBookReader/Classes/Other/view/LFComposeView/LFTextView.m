//
//  LFTextView.m
//  LFBookReader
//
//  Created by apple on 16/4/27.
//  Copyright © 2016年 xyb100. All rights reserved.
//

#import "LFTextView.h"

@interface LFTextView ()<UITextViewDelegate>
@property (nonatomic,weak) UILabel *plactHolderLable;
@property (nonatomic,weak) UITextView *textView;
@end
@implementation LFTextView

- (instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        [self setUpUI];
    }
    return self;
}

- (void)setUpUI{
    
    CGFloat marginX = 10;
    CGFloat H = 20;
    CGFloat W = LFScreenW - 2*marginX;
    UITextView *textView = [[UITextView alloc] init];
    
    self.textView = textView;
    self.textView.frame = CGRectMake(0, 0,W, self.height);
    self.textView.font = [UIFont systemFontOfSize:15];
    self.textView.delegate = self;
    [self addSubview:textView];
    
    UILabel *placeHolderLable = [LFUtility creatLableWithFrame:CGRectMake(5, 5, self.width, H+5) font:15 color:[UIColor grayColor] title:@"写点什么呢 (不少于5个字)"];
    self.plactHolderLable = placeHolderLable;
//    self.plactHolderLable.backgroundColor = [UIColor redColor];
    self.placeHolder = @"写点什么呢 (不少于5个字)";
    self.plactHolderLable.textAlignment = NSTextAlignmentLeft;
    [self addSubview:placeHolderLable];

    
}

- (void)setPlaceHolder:(NSString *)placeHolder{

    _placeHolder = placeHolder;
    self.plactHolderLable.text = placeHolder;
}
- (void)textViewDidEndEditing:(UITextView *)textView{
    
    if (textView.text.length == 0) {
        self.plactHolderLable.hidden = NO;
    }
}

- (void)textViewDidChange:(UITextView *)textView{
    if (textView.text.length > 0) {
        
        self.plactHolderLable.hidden = YES;
    }else{
        self.plactHolderLable.hidden = NO;
        
    }
  
    if ([self.delegate respondsToSelector:@selector(textViewDidChange:)]) {
        [self.delegate textViewDidChange:textView];
    }
}

@end
