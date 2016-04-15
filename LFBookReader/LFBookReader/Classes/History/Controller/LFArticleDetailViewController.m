//
//  LFArticleDetailViewController.m
//  LFBookReader
//
//  Created by apple on 16/4/6.
//  Copyright © 2016年 xyb100. All rights reserved.
//
#import <ShareSDK/ShareSDK.h>
#import <ShareSDKUI/ShareSDK+SSUI.h>
#import "LFArticleDetailViewController.h"

@interface LFArticleDetailViewController ()
@property (nonatomic,strong) UILabel *sourceLable;
@property (nonatomic,strong) UILabel *authorLable;
@property (nonatomic,strong) UIButton *checkButton;
@property (nonatomic,strong) UIImageView *iconView;
@property (nonatomic,strong) UILabel *titleLable;
@property (nonatomic,strong) UITextView *contentView;
@end

@implementation LFArticleDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"share" style:UIBarButtonItemStyleDone target:self action:@selector(share)];
    [self creatUI];
}

- (void)creatUI{
    CGFloat marginX = 20;
    CGFloat marginY = 10;
    NSString *source = @"文章来自于《悲伤逆流成河》";
    CGSize  size = [source boundingRectWithSize:CGSizeMake(self.view.width, 20) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15]} context:nil].size;
    self.sourceLable = [self creatLableWithFrame:CGRectMake(marginX, marginY, size.width, size.height) font:15 color:[UIColor blackColor] title:source];
    
    self.authorLable = [self creatLableWithFrame:CGRectMake(marginX, CGRectGetMaxY(self.sourceLable.frame), self.view.width, self.sourceLable.height) font:14 color:[UIColor grayColor] title:@"郭敬明"];
    
    self.checkButton = [[UIButton alloc] initWithFrame:CGRectMake(self.view.width - 80, marginY, 80, self.sourceLable.height)];
    [self.checkButton setTitle:@"查看书目" forState:UIControlStateNormal];
    [self.checkButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    self.checkButton.titleLabel.font = [UIFont systemFontOfSize:14];
    [self.checkButton addTarget:self action:@selector(checkBooks) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.checkButton];
    
    self.iconView = [[UIImageView alloc] initWithFrame:CGRectMake(marginX, CGRectGetMaxY(self.authorLable.frame) + marginY, self.view.width - 2*marginX, 100)];
    self.iconView.image = [UIImage imageNamed:@"1"];
    [self.view addSubview:self.iconView];
    
    self.titleLable = [self creatLableWithFrame:CGRectMake(marginX, CGRectGetMaxY(self.iconView.frame) + marginY, self.view.width - 2*marginX, self.sourceLable.height) font:15 color:[UIColor blackColor] title:@"悲伤逆流成河"];
    self.titleLable.textAlignment = NSTextAlignmentCenter;
    self.contentView = [[UITextView alloc] initWithFrame:CGRectMake(marginX, CGRectGetMaxY(self.titleLable.frame) , self.view.width - 2*marginX, self.view.height - CGRectGetMaxY(self.titleLable.frame)-64-marginX)];
    self.contentView.text = @"小说讲述了少女易遥在17岁时爱上不良少年后怀孕，和她毗邻而居的齐铭则生活在完全不一样的世界里——老师的宠儿，父母的掌中宝。两人之间产生了某种介于爱情和友情之间、或者说是凌驾于爱情与友谊之上的微妙情感。直到顾森湘和顾森西姐弟俩出现在他们的生活中，齐铭和顾森湘自然而然的相爱，大人们眼中的“坏孩子”顾森西对易遥产生了好感，当易遥与齐铭各自有了感情归属、彼此渐行渐远时，可是最后易遥收到一个匿名的短信，对方以为易遥是齐铭的女朋友，约她去见面，于是易遥把短信转发给了顾森湘，后来顾森湘去了，那些人对她做了很残忍的事，所以顾森湘割腕自杀了。后来，易遥因为齐铭和顾森西对自己的不信任以及他们对自己的厌恶，于是跳楼自杀在齐铭的面前。那种全身的关节、骨骼、胸腔、头颅一起碎裂的声音，让齐铭再也承受不了，在弥漫着煤气的黑暗中慢慢闭上了眼睛。易遥，顾森湘，齐铭，都被淹没在悲伤的河流里，还有在电视机前哭红了双眼的顾森西，四个人的爱情，四个人的命运，纠结，撕裂……有人说这是两段爱情悲剧，但是在那个常年弥漫着潮湿空气的弄堂里，那个怀着怜悯之心心疼着易遥的齐铭，在满载的怜悯同情之中没有萌生出一点点的爱的感觉吗，易遥爱着顾森西，却在两个否定她的男生面前，选择了以那样惨烈的方式死在齐铭面前。是齐铭而不是顾森西。从童年的相伴到少年的相随，相依相伴的或许不仅仅是同情和依靠。只是在残忍的生活面前，这两个孩子需要的不是爱情，而是信任和彼此给予的对爱情的希望小说讲述了少女易遥在17岁时爱上不良少年后怀孕，和她毗邻而居的齐铭则生活在完全不一样的世界里——老师的宠儿，父母的掌中宝。两人之间产生了某种介于爱情和友情之间、或者说是凌驾于爱情与友谊之上的微妙情感。直到顾森湘和顾森西姐弟俩出现在他们的生活中，齐铭和顾森湘自然而然的相爱，大人们眼中的“坏孩子”顾森西对易遥产生了好感，当易遥与齐铭各自有了感情归属、彼此渐行渐远时，可是最后易遥收到一个匿名的短信，对方以为易遥是齐铭的女朋友，约她去见面，于是易遥把短信转发给了顾森湘，后来顾森湘去了，那些人对她做了很残忍的事，所以顾森湘割腕自杀了。后来，易遥因为齐铭和顾森西对自己的不信任以及他们对自己的厌恶，于是跳楼自杀在齐铭的面前。那种全身的关节、骨骼、胸腔、头颅一起碎裂的声音，让齐铭再也承受不了，在弥漫着煤气的黑暗中慢慢闭上了眼睛。易遥，顾森湘，齐铭，都被淹没在悲伤的河流里，还有在电视机前哭红了双眼的顾森西，四个人的爱情，四个人的命运，纠结，撕裂……有人说这是两段爱情悲剧，但是在那个常年弥漫着潮湿空气的弄堂里，那个怀着怜悯之心心疼着易遥的齐铭，在满载的怜悯同情之中没有萌生出一点点的爱的感觉吗，易遥爱着顾森西，却在两个否定她的男生面前，选择了以那样惨烈的方式死在齐铭面前。是齐铭而不是顾森西。从童年的相伴到少年的相随，相依相伴的或许不仅仅是同情和依靠。只是在残忍的生活面前，这两个孩子需要的不是爱情，而是信任和彼此给予的对爱情的希望";
    self.contentView.scrollEnabled = NO;
    self.contentView.font = [UIFont systemFontOfSize:14];
    [self.view addSubview:self.contentView];
}

- (UILabel *)creatLableWithFrame:(CGRect)frame font:(CGFloat)font color:(UIColor *)color title:(NSString *)title{
    
    UILabel *lable = [[UILabel alloc] initWithFrame:frame];
    lable.text = title;
    
    lable.textColor = color;
    lable.font = [UIFont systemFontOfSize:font];
    [self.view addSubview:lable];
    return lable;

}
#pragma mark action
- (void)share{
    //1、创建分享参数
    NSArray* imageArray = @[[UIImage imageNamed:@"3"]];
    //（注意：图片必须要在Xcode左边目录里面，名称必须要传正确，如果要分享网络图片，可以这样传iamge参数 images:@[@"http://mob.com/Assets/images/logo.png?v=20150320"]）
    if (imageArray) {
        
        NSMutableDictionary *shareParams = [NSMutableDictionary dictionary];
        [shareParams SSDKSetupShareParamsByText:@"分享内容"
                                         images:imageArray
                                            url:[NSURL URLWithString:@"http://mob.com"]
                                          title:@"分享标题"
                                           type:SSDKContentTypeAuto];
        //2、分享（可以弹出我们的分享菜单和编辑界面）
        [ShareSDK showShareActionSheet:nil //要显示菜单的视图, iPad版中此参数作为弹出菜单的参照视图，只有传这个才可以弹出我们的分享菜单，可以传分享的按钮对象或者自己创建小的view 对象，iPhone可以传nil不会影响
                                 items:nil
                           shareParams:shareParams
                   onShareStateChanged:^(SSDKResponseState state, SSDKPlatformType platformType, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error, BOOL end) {
                       
                       switch (state) {
                           case SSDKResponseStateSuccess:
                           {
                               UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"分享成功"
                                                                                   message:nil
                                                                                  delegate:nil
                                                                         cancelButtonTitle:@"确定"
                                                                         otherButtonTitles:nil];
                               [alertView show];
                               break;
                           }
                           case SSDKResponseStateFail:
                           {
                               UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"分享失败"
                                                                               message:[NSString stringWithFormat:@"%@",error]
                                                                              delegate:nil
                                                                     cancelButtonTitle:@"OK"
                                                                     otherButtonTitles:nil, nil];
                               [alert show];
                               break;
                           }
                           default:
                               break;
                       }
                   }
         ];}

}

- (void)checkBooks{

    LFBookDetailView *detail = [LFBookDetailView show];
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
