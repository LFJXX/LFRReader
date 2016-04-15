//
//  LFBookDetailView.m
//  LFBookReader
//
//  Created by apple on 16/4/5.
//  Copyright © 2016年 xyb100. All rights reserved.
//

#import "LFBookDetailView.h"

@interface LFBookDetailView ()

@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@property (weak, nonatomic) IBOutlet UILabel *bookNameLable;
@property (weak, nonatomic) IBOutlet UILabel *authorLable;
@property (weak, nonatomic) IBOutlet UILabel *creatTimeLable;
@property (weak, nonatomic) IBOutlet UITextView *contentTextView;
@property (weak, nonatomic) IBOutlet UILabel *priceLable;
@property (weak, nonatomic) IBOutlet UIView *ContentView;

@end
@implementation LFBookDetailView
- (IBAction)addBookLibraryClcik:(UIButton *)sender {
    if ([self.delegate respondsToSelector:@selector(bookDetailViewDelegateAddLibrary:)]) {
        [self.delegate bookDetailViewDelegateAddLibrary:self];
    }
    [self dissMiss];
}

- (IBAction)tryRead:(UIButton *)sender {
    if ([self.delegate respondsToSelector:@selector(bookDetailViewDelegateTryRead:)]) {
        [self.delegate bookDetailViewDelegateTryRead:self];
    }
    [self dissMiss];
}

- (IBAction)BuyClick:(UIButton *)sender {
    if ([self.delegate respondsToSelector:@selector(bookDetailViewDelegateBuyBook:)]) {
        [self.delegate bookDetailViewDelegateBuyBook:self];
    }
    [self dissMiss];
}

- (IBAction)popView:(UIButton *)sender {
    [self dissMiss];
}

-(void)dissMiss{
    self.alpha = 1;
    [UIView animateWithDuration:1 animations:^{
        //        self.frame = CGRectMake(LFScreenW/2,LFScreenH/2, 0, 0);
        //        self.alpha = 0;
        self.hidden = YES;
    } completion:^(BOOL finished) {
        
        [self removeFromSuperview];
    }];
}
+ (LFBookDetailView *)shareBookDetailView{
    
    
    return  [[[NSBundle mainBundle] loadNibNamed:@"LFBookDetailView" owner:self options:nil] firstObject];
}

+ (LFBookDetailView *)show{
    
    LFBookDetailView *bookDeatal = [LFBookDetailView shareBookDetailView];
    bookDeatal.bookNameLable.textAlignment = NSTextAlignmentRight;
        bookDeatal.backgroundColor = [UIColor blackColor];
    bookDeatal.frame = [UIScreen mainScreen].bounds;
    [[UIApplication sharedApplication].keyWindow addSubview:bookDeatal];
    
    return bookDeatal;

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
    [self.iconView sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"4"]];
    self.bookNameLable.text = booklist.title;
    self.authorLable.text = booklist.author;
    self.creatTimeLable.text = [NSString stringWithFormat:@"%zd",booklist.updateTime];
    self.contentTextView.text = booklist.intro;
    self.priceLable.text = booklist.showPrice;

}

@end
