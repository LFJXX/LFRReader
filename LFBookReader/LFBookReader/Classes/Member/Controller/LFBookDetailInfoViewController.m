//
//  LFBookDetailViewController.m
//  LFBookReader
//
//  Created by apple on 16/4/14.
//  Copyright © 2016年 xyb100. All rights reserved.
//

#import "LFBookDetailInfoViewController.h"
#import "LFBookDetailInfo.h"
#import "LFCommentCell.h"
#import "LFRelationShipView.h"
#import "FdButton.h"
#import "LFCommentDetailController.h"
#import "LFBookCommentController.h"

@interface LFBookDetailInfoViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) LFBookDetailInfo *bookInfo;
@property (nonatomic,strong) UIView *headerView;
@property (nonatomic,strong) UIImageView *iconView;
@property (nonatomic,strong) UILabel *nameLable;
@property (nonatomic,weak) SYStarRatingView *starView;
@property (nonatomic,strong) UILabel *scoreLable;
@property (nonatomic,strong) UILabel *catoryLable;
@property (nonatomic,strong) UILabel *autherLable;
@property (nonatomic,strong) UILabel *priceLable;
@property (nonatomic,strong) UILabel *vipLable;
@property (nonatomic,strong) UIView *lineView;
@property (nonatomic,strong) UIView *introView;
@property (nonatomic,strong) UILabel *introLable;
@property (nonatomic,strong) UIButton *expendBtn;
@property (nonatomic,strong) UIView *checkTableView;
@property (nonatomic,strong) UILabel *chapsizeLable;
@property (nonatomic,strong) LFRelationShipView *sameCatoryView;
@property (nonatomic,strong) LFRelationShipView *sameReaderView;
@property (nonatomic,strong) UIView *publishInfoView;
@property (nonatomic,strong) UILabel *publishSourse;

@property (nonatomic,strong) UIView *barView;
@property (nonatomic,strong) FdButton *downLoadBtn;
@property (nonatomic,strong) FdButton *tryReadBtn;
@property (nonatomic,strong) FdButton *addBookStoreBtn;


@end

@implementation LFBookDetailInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    UIView *bgView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.width, 200)];
    bgView.backgroundColor = LFRedColor;
    [self.view addSubview:bgView];
    [self.view addSubview:self.barView];
    [self.view addSubview:self.tableView];
    [self loadNewData];
    
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController.navigationBar setBarTintColor:LFRedColor];
}
- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self.navigationController.navigationBar setBarTintColor:LFLightBlueColor];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{

    if (self.bookInfo == nil) {
        return 0;
    }else{
    
        return 5;
    }
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    if (section==0) {
        return 2;
    }else if (section == 1){
    
        return 4;
    }else if (section == 2 || section == 3){
    
        return 2;
    }else{
    
        return 1;
    }
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    if (indexPath.section == 1 && indexPath.row != 3) {
         static NSString *identidier1 = @"commentList";
        LFCommentCell *cell = [tableView dequeueReusableCellWithIdentifier:identidier1];
        if (cell == nil) {
            cell = [[LFCommentCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identidier1];
        }
        cell.selectionStyle  = UITableViewCellSelectionStyleNone;
        cell.bookDetailInfo = self.bookInfo;
        cell.commentList = self.bookInfo.commentinfo.commentlist[indexPath.row];
        if (indexPath.row == 0) {
            cell.hidden = NO;
        }else{
        
            cell.hidden = YES;
        }
        
        return cell;
    }else if(indexPath.section == 2 || indexPath.section == 3){
    
        static NSString *identifier = @"retation";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        if (indexPath.row == 0) {

            LFRelationShipView *view;
            if (indexPath.section == 2) {
                view = self.sameCatoryView;
            }else{
                view = self.sameReaderView;
            }
            [cell.contentView addSubview:view];
            for (LFBookeView *bookView in view.subviews) {
                if ([bookView isKindOfClass:[LFBookeView class]]) {
                    
                    NSInteger  index = bookView.tag;
                    LFExpireBooks *member;
                    if (indexPath.section == 2) {
                       member = self.bookInfo.expRec;
                    }else{
                        member = self.bookInfo.columbooks;
                    }
                    
                    LFBookList *list = member.bookList[index];
                    NSString *bid = [NSString stringWithFormat:@"%zd",list.bid];
                    NSString *str = [bid substringFromIndex:bid.length - 3];
                    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://wfqqreader.3g.qq.com/cover/%@/%@/t5_%@.jpg",str,bid,bid]];
                    
                    bookView.nameLable.text = list.title;
                    [bookView.iconView sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"4"]];
                }
            }
        }else{
        
            cell.textLabel.text = @"换一批试试";
            cell.textLabel.textAlignment = NSTextAlignmentCenter;
            cell.textLabel.textColor = LFLightBlueColor;
            cell.textLabel.font = [UIFont systemFontOfSize:15];
        }
        return cell;
    }else{
    
        static NSString *identifier = @"detail";
        UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        cell.selectionStyle  = UITableViewCellSelectionStyleNone;
        
        if (indexPath.section == 0) {
            if (indexPath.row == 0) {
                [cell.contentView addSubview:self.introView];
            }else{
                
                cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
                
                [cell.contentView addSubview:self.checkTableView];
            }
        }else if (indexPath.section == 1 && indexPath.row == 3){
        
            cell.textLabel.text = @"去书评区看看";
            cell.textLabel.textAlignment = NSTextAlignmentCenter;
            cell.textLabel.textColor = LFLightBlueColor;
            cell.textLabel.font = [UIFont systemFontOfSize:15];
        }else if (indexPath.section == 4){
        
            [cell.contentView addSubview:self.publishInfoView];
            
        }
        return cell;
    }
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    if (indexPath.section == 1 ) {
        if (indexPath.row == 3) {
          
            LFBookCommentController *bookComment = [[LFBookCommentController alloc] init];
            bookComment.bid = self.bookInfo.commentinfo.bid;
            [self.navigationController pushViewController:bookComment animated:YES];
        }else{
        
            LFCommentDetailController *detailVC = [[LFCommentDetailController alloc] init];
            detailVC.commentList = self.bookInfo.commentinfo.commentlist[indexPath.row];
            [self.navigationController pushViewController:detailVC animated:YES];
        }
    }
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            return self.introView.height;
        }
    }else if(indexPath.section == 1 && indexPath.row != 3){
    
        return [self computeHeightWithIndex:indexPath.row];
    }else if (indexPath.section == 2 || indexPath.section == 3 ){
    
        if (indexPath.row == 0) {
            
            return 150;
        }else{
        
            return 44;
        }
    }else if (indexPath.section == 4){
    
        return 150;
    }
    return 44;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{

    if (section == 0) {
        return 0;
    }
    return 10;
}
- (CGFloat)computeHeightWithIndex:(NSInteger)index{

    LFCommentList *list = self.bookInfo.commentinfo.commentlist[index];
    CGFloat marginX = 10;
    CGFloat titleViewH = 40;
    CGFloat iconWH = 40;
    CGFloat textLableH = 20;
    if (list.title.length == 0) {
        textLableH = 0;
    }
    CGFloat platFormH = 20;
    CGFloat ContentH = [list.content boundingRectWithSize:CGSizeMake(LFScreenW - 2*marginX, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14]} context:nil].size.height;
    if (index == 0) {
        return titleViewH+iconWH+textLableH+ContentH+platFormH+5*marginX;
    }else{
        return iconWH+textLableH+ContentH+platFormH+5*marginX;
    
    }
    
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{

    
    CGPoint point = scrollView.contentOffset;
    if (point.y > 100) {
        [self.navigationController.navigationBar setBarTintColor:LFLightBlueColor];
    }else{
        [self.navigationController.navigationBar setBarTintColor:LFRedColor];
    }
}
- (void)loadNewData{

    LFStatParams *stat = _bookList.stat_params;
    NSString *url = [NSString stringWithFormat:@"http://android.reader.qq.com/v5_8/nativepage/book/detail?bid=%ld&pagestamp=1&alg=%@&data_type=%zd&origin=%@",_bookList.bid, stat.alg,stat.data_type,stat.origin];
    [LFHttpTool GET:url parameters:nil success:^(id response) {
        NSInteger code = [response[@"httpcode"] integerValue];
        if (code == 200) {

            self.bookInfo = [LFBookDetailInfo mj_objectWithKeyValues:response] ;
            self.tableView.tableHeaderView = self.headerView;
            [self.tableView reloadData];
        }
    } failure:^(NSError *error) {
        
    }];
}

#pragma mark

- (UIView *)barView{

    if (_barView == nil) {
        _barView = [[UIView alloc] initWithFrame:CGRectMake(0, LFScreenH - 44-64, self.view.width, 44)];
        _barView.backgroundColor = [UIColor purpleColor];
        self.downLoadBtn = [self creatButtonWithFrame:CGRectMake(0, 0, self.view.width/3, _barView.height) tag:101 backgroundColor:[UIColor whiteColor] titleColor:LFLightBlueColor image:nil title:@"下载"];
        self.tryReadBtn = [self creatButtonWithFrame:CGRectMake(CGRectGetMaxX(self.downLoadBtn.frame), 0, self.view.width/3, _barView.height) tag:102 backgroundColor:LFLightBlueColor titleColor:[UIColor whiteColor] image:nil title:@"免费试读"];
        self.addBookStoreBtn = [self creatButtonWithFrame:CGRectMake(CGRectGetMaxX(self.tryReadBtn.frame), 0, self.view.width/3, _barView.height) tag:103 backgroundColor:[UIColor whiteColor] titleColor:LFLightBlueColor image:nil title:@"加入书架"];
        
    }
    return _barView;
}

- (FdButton *)creatButtonWithFrame:(CGRect) frame tag:(NSInteger)tag backgroundColor:(UIColor *)color titleColor:(UIColor *)titleColor image:(UIImage *)image title:(NSString *)title{

    FdButton *btn = [FdButton buttonWithType:UIButtonTypeCustom];
    [btn setTitleColor:titleColor forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:15];
    btn.frame = frame;
    btn.tag = tag;
    [btn setBackgroundColor:color];
    [btn setImage:image forState:UIControlStateNormal];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(tabbarClick:) forControlEvents:UIControlEventTouchUpInside];
    [_barView addSubview:btn];
    
    return btn;
}
- (UIView *)publishInfoView{

    if (_publishInfoView == nil) {
        CGFloat marginX = 10;
        CGFloat W = LFScreenW - 2*marginX;
        CGFloat H = 30;
        _publishInfoView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.width, 100)];
        UILabel *lable = [LFUtility creatLableWithFrame:CGRectMake(marginX,  marginX, W,H) font:15 color:[UIColor blackColor] title:@"更多出版信息"];
        [_publishInfoView  addSubview:lable];
        
        self.publishSourse = [LFUtility creatLableWithFrame:CGRectMake(marginX, CGRectGetMaxY(lable.frame), W, H) font:13 color:[UIColor grayColor] title:@""];
        [_publishInfoView addSubview:self.publishSourse];
        UILabel *lable1 = [LFUtility creatLableWithFrame:CGRectMake(marginX, CGRectGetMaxY(_publishSourse.frame), W, H)  font:13 color:[UIColor grayColor] title:@"本书由QQ阅读电子版制作与发版"];
        [_publishInfoView  addSubview:lable1];
        UILabel *lable2 = [LFUtility creatLableWithFrame:CGRectMake(marginX, CGRectGetMaxY(lable1.frame), W, H)  font:13 color:[UIColor grayColor] title:@"版权所有*侵权必究"];
        [_publishInfoView  addSubview:lable2];
    }
    self.publishSourse.text = [NSString stringWithFormat:@"版权:%@",self.bookInfo.introinfo.book.bookfrom];
    return _publishInfoView;
}
- (UIView *)checkTableView{
   
    if (_checkTableView == nil) {
        _checkTableView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.width, 44)];
        UILabel *textlable = [LFUtility creatLableWithFrame:CGRectMake(10, 0, 80, _checkTableView.height) font:16 color:[UIColor blackColor] title:@"查看目录"];
        [_checkTableView addSubview:textlable];
       self.chapsizeLable  = [LFUtility creatLableWithFrame:CGRectMake(CGRectGetMaxX(textlable.frame)+20, 0, self.view.width, _checkTableView.height) font:14 color:[UIColor grayColor] title:@""];
         [_checkTableView addSubview:self.chapsizeLable];

    }
    NSString *text;
    if (self.bookInfo.chapinfo.finished == 1) {
        text = [NSString stringWithFormat:@"完结共%ld章",self.bookInfo.chapinfo.chapsize];
    }else{
        
        text = [NSString stringWithFormat:@"更新至第%ld章",self.bookInfo.chapinfo.chapsize];
    }
    self.chapsizeLable.text = text;
     LFLOG(@"%@",text);
    
    return _checkTableView;
}
- (UIView *)introView{

    if (_introView == nil) {
        _introView = [[UIView alloc] init];
        UILabel *introLable = [LFUtility creatLableWithFrame:CGRectZero font:14 color:[UIColor blackColor] title:@""];
        self.introLable = introLable;
        self.introLable.numberOfLines = 0;
        [_introView addSubview:introLable];
        UIButton *expendBtn = [[UIButton alloc] init];
        self.expendBtn = expendBtn;
        [self.expendBtn setBackgroundImage:[UIImage imageNamed:@"up"] forState:UIControlStateSelected];
        [self.expendBtn setBackgroundImage:[UIImage imageNamed:@"down"] forState:UIControlStateNormal];
        [self.expendBtn addTarget:self action:@selector(expendBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [_introView addSubview:expendBtn];
    }
    
     
    [self setUpFrame];

    return _introView;
}


- (void)setUpFrame{
 NSString *text = self.bookInfo.introinfo.book.intro;
    self.introLable.attributedText = [LFUtility resetContentWithText:text];
    CGFloat marginX = 10;
    CGFloat marginW = self.view.width - 2*marginX;
   ;
 
    CGFloat H = [self.introLable.attributedText boundingRectWithSize:CGSizeMake(marginW, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin context:nil].size.height;

    if (self.expendBtn.selected == NO) {
        H = 70;
    }
    self.introLable.frame = CGRectMake(marginX, marginX, marginW, H);

    self.expendBtn.frame = CGRectMake(self.view.width-10-marginX, CGRectGetMaxY(self.introLable.frame)-10, 10, 10);
    
    _introView.frame = CGRectMake(0, 0, self.view.width, CGRectGetMaxY(self.introLable.frame)+marginX);
}
- (void)expendBtnClick:(UIButton *)sender{

    sender.selected = !sender.selected;
    if (sender.selected == YES) {
        self.introLable.numberOfLines = 0;
        [self setUpFrame];
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
        [self.tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
    }else{
    
        self.introLable.numberOfLines = 3;
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
        [self.tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
        [self setUpFrame];
    }
    
}
- (LFRelationShipView *)sameCatoryView{

    if (_sameCatoryView == nil) {
        CGFloat marginX = 10;
        CGFloat height = 150;
        _sameCatoryView = [[LFRelationShipView alloc] initWithFrame:CGRectMake(marginX, marginX, LFScreenW - 2*marginX, height)];
    }
    return _sameCatoryView;
}

- (LFRelationShipView *)sameReaderView{

    if (_sameReaderView == nil) {
        CGFloat marginX = 10;
        CGFloat height = 150;
        _sameReaderView = [[LFRelationShipView alloc] initWithFrame:CGRectMake(marginX, marginX, LFScreenW - 2*marginX, height)];
        
    }
    return _sameReaderView;
}
- (UITableView *)tableView{

    if (_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.width, self.view.height - 64-44)];
        _tableView.backgroundColor = [UIColor clearColor];
        _tableView.delegate = self;
        _tableView.dataSource = self;
       
    }
    return _tableView;
}
- (UIView *)headerView{

    if (_headerView == nil) {
        _headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.width, 110)];
        _headerView.backgroundColor = LFRedColor;
        self.iconView = [[UIImageView alloc] init];
        [_headerView addSubview:_iconView];

        self.nameLable = [LFUtility creatLableWithFrame:CGRectZero font:15 color:[UIColor whiteColor] title:@""];
        [_headerView addSubview:_nameLable];
        
        SYStarRatingView *startView = [[SYStarRatingView alloc] initWithFrame:CGRectMake(50, 50, 100, 20)];
        self.starView = startView;
        self.starView.foregroundViewColor = [UIColor orangeColor];
        self.starView.userInteractionEnabled = NO;
        [_headerView addSubview:self.starView];
        
        self.scoreLable = [LFUtility creatLableWithFrame:CGRectZero font:13 color:[UIColor whiteColor] title:@""];
        [_headerView addSubview:_scoreLable];
        
        
        self.catoryLable = [LFUtility creatLableWithFrame:CGRectZero font:13 color:[UIColor whiteColor] title:@""];
        [_headerView addSubview:_catoryLable];
        
        self.lineView = [[UIView alloc] initWithFrame:CGRectZero];
        [self.lineView setBackgroundColor:[UIColor whiteColor]];
        [_headerView addSubview:_lineView];
        
        self.autherLable = [LFUtility creatLableWithFrame:CGRectZero font:13 color:[UIColor whiteColor] title:@""];
        [_headerView addSubview:_autherLable];
        
        self.priceLable = [LFUtility creatLableWithFrame:CGRectZero font:14 color:[UIColor whiteColor] title:@""];
        [_headerView addSubview:_priceLable];
        
        self.vipLable = [LFUtility creatLableWithFrame:CGRectZero font:13 color:[UIColor colorWithRed:0.6549 green:0.3608 blue:0.0588 alpha:1.0] title:@""];
        [_headerView addSubview:_vipLable];
        
    }
    [self addData];
    
    CGFloat marginX = 10;
    CGFloat iconW = 80;
    CGFloat iconH = 100;
    self.iconView.frame = CGRectMake(marginX, marginX/2, iconW, iconH);
    CGFloat nameLableX = CGRectGetMaxX(_iconView.frame)+marginX;
    CGFloat nameLableW = self.view.width - nameLableX-marginX;
    CGFloat nameLableH = 20;

    self.nameLable.frame = CGRectMake(nameLableX, _iconView.y,nameLableW  , nameLableH);
    self.starView.frame = CGRectMake(nameLableX, CGRectGetMaxY(_nameLable.frame), 100, 20);
    self.scoreLable.frame = CGRectMake(CGRectGetMaxX(self.starView.frame)+marginX, _starView.y, self.view.width, nameLableH);
    CGFloat W = [self.catoryLable.text boundingRectWithSize:CGSizeMake(CGFLOAT_MAX, nameLableH) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:self.catoryLable.font} context:nil].size.width;
    self.catoryLable.frame = CGRectMake(nameLableX, CGRectGetMaxY(_scoreLable.frame), W, nameLableH);
    self.lineView.frame = CGRectMake(CGRectGetMaxX(_catoryLable.frame)+marginX, _catoryLable.y, 1, _catoryLable.height);
    self.autherLable.frame = CGRectMake(CGRectGetMaxX(_lineView.frame)+marginX, _lineView.y, self.view.width, _catoryLable.height);
    self.priceLable.frame = CGRectMake(nameLableX, CGRectGetMaxY(_catoryLable.frame), nameLableW, nameLableH);
    self.vipLable.frame = CGRectMake(nameLableX, CGRectGetMaxY(_priceLable.frame), nameLableW, nameLableH);
    return _headerView;
}
- (void)addData{

    LFBookDetailInfo *bookinfo = self.bookInfo;
    NSString *bid = [NSString stringWithFormat:@"%zd",_bookList.bid];
    NSString *str = [bid substringFromIndex:bid.length - 3];
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://wfqqreader.3g.qq.com/cover/%@/%@/t5_%@.jpg",str,bid,bid]];
    NSData *data = [NSData dataWithContentsOfURL:url];
    if (!data) {
        url = [NSURL URLWithString:[NSString stringWithFormat:@"http://wfqqreader.3g.qq.com/cover/%@/%@/m_%@.jpg",str,bid,bid]];
    }
    [self.iconView sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"4"]];
    self.nameLable.text = bookinfo.introinfo.book.title;
    [self.starView setScore:bookinfo.introinfo.scoreInfo.score/5.0 withAnimation:YES];
    self.scoreLable.text = [NSString stringWithFormat:@"%ld分",bookinfo.introinfo.scoreInfo.score];
    self.catoryLable.text = bookinfo.introinfo.book.categoryname;
    self.autherLable.text = bookinfo.introinfo.book.author;
    self.priceLable.text = [NSString stringWithFormat:@"%ld  %@",bookinfo.introinfo.book.totalwords,bookinfo.introinfo.prices.first];
    self.vipLable.text = @"购买VIP,享8.8折优惠";
    
    
}

- (void)tabbarClick:(UIButton *)sender{

    NSInteger index = sender.tag;
    switch (index) {
        case 101:{
            LFLOG(@"下载");
        }
            break;
        case 102:{
            LFLOG(@"免费试读");
        }
            break;
        case 103:{
            LFLOG(@"加入书架");

        }
            break;
            
        default:
            break;
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
