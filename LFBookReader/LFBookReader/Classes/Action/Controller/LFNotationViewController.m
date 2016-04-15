//
//  LFNotationViewController.m
//  LFBookReader
//
//  Created by apple on 16/4/6.
//  Copyright © 2016年 xyb100. All rights reserved.
//

#import "LFNotationViewController.h"

@interface LFNotationViewController ()<UITextViewDelegate>
@property (nonatomic,strong) UILabel *contentLable;
@property (nonatomic,strong) UITextView *notationView;
@end

@implementation LFNotationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"取消" style:UIBarButtonItemStyleDone target:self action:@selector(back)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"完成" style:UIBarButtonItemStyleDone target:self action:@selector(addNotation)];
    self.navigationItem.title = @"添加批注";
    [self.view addSubview:self.contentLable];
    [self.view addSubview:self.notationView];
}

- (void)back{
     [self.view endEditing:YES];
    UIAlertController *alterVc = [UIAlertController alertControllerWithTitle:@"" message:@"确定要取消添加批注吗?" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    UIAlertAction *verify = [UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self dismissViewControllerAnimated:YES completion:nil];
    }];
    [alterVc addAction:cancel];
    [alterVc addAction:verify];
    [self presentViewController:alterVc animated:YES completion:nil];

}
- (void)addNotation{
     [self.view endEditing:YES];
}


- (UILabel *)contentLable{

    if (_contentLable == nil) {
        _contentLable = [[UILabel alloc] init];
        _contentLable.backgroundColor = LFlightGrayColor;
        _contentLable.numberOfLines = 0;
    }
    _contentLable.text = self.Content;
    _contentLable.font = [UIFont systemFontOfSize:15];
    CGFloat X = 10;
    CGFloat Y = 10;
    CGFloat W = self.view.width - 2*X;
    CGFloat H = [self.Content boundingRectWithSize:CGSizeMake(W, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:_contentLable.font} context:nil].size.height;
    _contentLable.frame = CGRectMake(X, Y, W, H);
    return _contentLable;
}

- (UITextView *)notationView{

    if (_notationView == nil) {
        _notationView = [[UITextView alloc] initWithFrame:CGRectMake(10, CGRectGetMaxY(self.contentLable.frame)+20, self.view.width - 2*10, 100)];
        _notationView.delegate = self;
        _notationView.font = [UIFont systemFontOfSize:15];
        _notationView.textColor = [UIColor purpleColor];
        _notationView.backgroundColor = LFlightGrayColor;
    }
    return _notationView;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}



@end
