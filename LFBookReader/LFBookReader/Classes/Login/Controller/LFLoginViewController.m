//
//  LFLoginViewController.m
//  LFBookReader
//
//  Created by apple on 16/3/30.
//  Copyright © 2016年 xyb100. All rights reserved.
//

#import "LFLoginViewController.h"
#import "LFResigterViewController.h"
@interface LFLoginViewController ()<TencentSessionDelegate>
@property (weak, nonatomic) IBOutlet UITextField *AccountView;
@property (weak, nonatomic) IBOutlet UITextField *psdView;
@property (weak, nonatomic) IBOutlet UIButton *registerBtn;
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;

@property (nonatomic,strong) TencentOAuth *oauth ;
@end

@implementation LFLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.registerBtn.layer.cornerRadius = 5;
    self.registerBtn.layer.masksToBounds = YES;
    self.loginBtn.layer.cornerRadius = 5;
    self.loginBtn.layer.masksToBounds = YES;
}

- (void)viewWillAppear:(BOOL)animated{

    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
}
- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    self.navigationController.navigationBarHidden = NO;
}
#pragma makr  action
- (IBAction)login:(UIButton *)sender {

    LFTabBarViewController *tabbar = [[LFTabBarViewController alloc] init];
    [UIApplication sharedApplication].keyWindow.rootViewController = tabbar;
}


- (IBAction)enroll:(UIButton *)sender {

    LFResigterViewController *resigterVc = [[LFResigterViewController alloc] init];

    [self.navigationController pushViewController:resigterVc animated:YES];
}


- (IBAction)VisitorType:(UIButton *)sender {

}

- (IBAction)tencentLogin:(UIButton *)sender {
    NSArray* permissions = [NSArray arrayWithObjects:
                            kOPEN_PERMISSION_GET_USER_INFO,
                            kOPEN_PERMISSION_GET_SIMPLE_USER_INFO,
                            kOPEN_PERMISSION_ADD_SHARE,
                            nil];
    
    _oauth = [[TencentOAuth alloc] initWithAppId:QQAppid andDelegate:self];
    [_oauth authorize:permissions inSafari:NO];
}
- (IBAction)weChatLogin:(UIButton *)sender {
}

- (IBAction)weiBoLogin:(UIButton *)sender {
}


#pragma mark TencentSessionDelegate
- (void)tencentDidLogin{

    LFLOG(@"登陆完成");
    if (_oauth.accessToken && 0 != [_oauth.accessToken length])
    {
        // 记录登录用户的OpenID、Token以及过期时间
       
    }else
    {
        LFLOG(@"登录不成功 没有获取accesstoken");
    }

}

- (void)tencentDidNotLogin:(BOOL)cancelled{
    LFLOG(@"登陆失败");
}

- (void)tencentDidNotNetWork{
    LFLOG(@"无网络连接,请设置网络");
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
