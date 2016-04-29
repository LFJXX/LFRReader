//
//  LFComposeCommentController.m
//  LFBookReader
//
//  Created by apple on 16/4/27.
//  Copyright © 2016年 xyb100. All rights reserved.
//

#import "LFComposeCommentController.h"
#import "LFComposeView.h"
#import "LFTextView.h"
@interface LFComposeCommentController ()<UITableViewDelegate,UITableViewDataSource,StarRatingViewDelegate>
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) UIView *soreView;
@property (nonatomic,strong) SYStarRatingView *startView;
@property (nonatomic,strong) UILabel *soreLable;
@property (nonatomic,strong) LFTextView *titleLable;
@property (nonatomic,strong) LFComposeView *composeView;

@end

@implementation LFComposeCommentController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.tableView];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"发送" style:UIBarButtonItemStyleDone target:self action:@selector(sendMessage:)];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{

    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return 3;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    static NSString *idenfiter = @"compose";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:idenfiter];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:idenfiter];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    if (indexPath.row == 0) {
        [cell.contentView addSubview:self.soreView];
    }else if (indexPath.row == 1){
        [cell.contentView addSubview:self.titleLable];
    
    }else{
    
        [cell.contentView addSubview:self.composeView];
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    if (indexPath.row == 1) {
        return 60;
    }else if(indexPath.row == 2){
    
        return 150;
    }else{
    
        return 100;
    }
}
- (void)starRatingView:(SYStarRatingView *)view score:(float)score{

    LFLOG(@"++++%f",score);

    self.soreLable.text = [NSString stringWithFormat:@"%0.2f分",score*5];
}

- (void)sendMessage:(id)sender{

    LFLOG(@"发送");
    [self.navigationController popViewControllerAnimated:YES];
}
#pragma mark 懒加载
- (UITableView *)tableView{

    if (_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.width, LFScreenH - 64)];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}

- (LFComposeView *)composeView{

    if (_composeView == nil) {
        _composeView = [[LFComposeView alloc] initWithFrame:CGRectMake(0, 0, self.view.width, 150)];
    }
    return _composeView;
}
- (LFTextView *)titleLable{

    if (_titleLable == nil) {
        _titleLable = [[LFTextView alloc] initWithFrame:CGRectMake(10, 0, self.view.width-20, 60)];
        _titleLable.placeHolder = @"标题 (选填)";
    }
    return _titleLable;
}

-(UIView *)soreView{

    if (_soreView == nil) {
        _soreView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.width, 100)];
        self.startView  = [[SYStarRatingView alloc] initWithFrame:CGRectMake((self.view.width - 150)/2, 20, 150, 30) numberOfStar:5];
        [self.startView setScore:0 withAnimation:YES];
        self.startView.foregroundViewColor = [UIColor orangeColor];
        self.startView.delegate = self;
        [_soreView addSubview:self.startView];
        
        self.soreLable = [LFUtility creatLableWithFrame:CGRectMake(0, CGRectGetMaxY(self.startView.frame)+10, self.view.width, 30) font:16 color:[UIColor grayColor] title:@"点亮星星打分"];
        self.soreLable.textAlignment = NSTextAlignmentCenter;
        [_soreView addSubview:self.soreLable];
    }
    return _soreView;
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
