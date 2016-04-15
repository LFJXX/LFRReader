//
//  LFResigterViewController.m
//  LFBookReader
//
//  Created by apple on 16/3/31.
//  Copyright © 2016年 xyb100. All rights reserved.
//

#import "LFResigterViewController.h"

@interface LFResigterViewController ()
@property (nonatomic,strong) UITextField *phoneTextFeild;
@property (nonatomic,strong) UITextField *authCodeTextFeild;
@property (nonatomic,strong) UITextField *passWordTextFeild;
@property (nonatomic,strong) UITextField *replyPsdTextFeild;
@property (nonatomic,strong) UIButton *authCodeBtn;

@property (nonatomic,strong) UIButton *encollBtn;
@end

@implementation LFResigterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];

    [self creatUI];
}

- (void)creatUI{

    CGFloat Y = 90;
    CGFloat marginY = 10;
    CGFloat marginX = 20;
    CGFloat W = LFScreenW - 2*marginX;
    CGFloat H = 35;
    UILabel *lable = [[UILabel alloc] initWithFrame:CGRectMake(marginX, Y, W, H)];
    lable.text = @"国家和地区 中国+86";
    lable.textColor = LFlightBlackColor;
    [self.view addSubview:lable];
    self.phoneTextFeild = [self creatTextFieldWithFrame:CGRectMake(marginX, CGRectGetMaxY(lable.frame), W, H) placeHolder:@"手机号"];
    self.authCodeTextFeild = [self creatTextFieldWithFrame:CGRectMake(marginX, CGRectGetMaxY(self.phoneTextFeild.frame) + marginY, W/2, H) placeHolder:@"验证码"];
    self.passWordTextFeild = [self creatTextFieldWithFrame:CGRectMake(marginX, CGRectGetMaxY(self.authCodeTextFeild.frame) + marginY, W, H) placeHolder:@"请设置登录密码"];
    self.replyPsdTextFeild = [self creatTextFieldWithFrame:CGRectMake(marginX, CGRectGetMaxY(self.passWordTextFeild.frame) + marginY, W, H) placeHolder:@"请确认登录密码"];
    
    // 发送验证码

    self.authCodeBtn = [self creatButtonWithFrame:CGRectMake(CGRectGetMaxX(self.authCodeTextFeild.frame) +marginX*2, self.authCodeTextFeild.y, self.authCodeTextFeild.width-2*marginX, H) sel:@selector(sendAuthCode:) title:@"发送验证码"];
    
    // 注册按钮
    self.encollBtn = [self creatButtonWithFrame:CGRectMake(marginX, CGRectGetMaxY(self.replyPsdTextFeild.frame) + 2* marginX , W, 40) sel:@selector(encrollAccount:) title:@"注册"];
    
}

- (void)encrollAccount:(UIButton *)sender{

    LFLOG(@"注册账号");
}
- (void)sendAuthCode:(UIButton *)sender{

    LFLOG(@"发送验证码");
}

- (UIButton *)creatButtonWithFrame:(CGRect)frame  sel:(SEL)sel title:(NSString *)title{
    UIButton *btn = [[UIButton alloc] initWithFrame:frame];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setBackgroundColor:LFLightBlueColor];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btn addTarget:self action:sel forControlEvents:UIControlEventTouchUpInside];
    btn.layer.cornerRadius = 5;
    btn.layer.masksToBounds = YES;
    [self.view addSubview:btn];

    return btn;
    
}
- (UITextField *)creatTextFieldWithFrame:(CGRect)frame placeHolder:(NSString *)placeHolder {

    UITextField *textFeild = [[UITextField alloc] initWithFrame:frame];
    textFeild.placeholder = placeHolder;
    textFeild.borderStyle = UITextBorderStyleNone;
    [self.view addSubview:textFeild];
    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, textFeild.height -1 , textFeild.width, 1)];
    lineView.backgroundColor = LFlightBlackColor;
    [textFeild addSubview:lineView];
    return textFeild;
    
}
- (void)back{

    [self.navigationController popoverPresentationController];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}


@end
