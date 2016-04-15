//
//  LFArticleViewController.m
//  LFBookReader
//
//  Created by apple on 16/4/5.
//  Copyright © 2016年 xyb100. All rights reserved.
//

#import "LFArticleViewController.h"
#import "LFArticleCell.h"
#import "LFArticleDetailViewController.h"

@interface LFArticleViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) DCPicScrollView *picView ;
@property (nonatomic,strong) UITableView *tableView;
@end

@implementation LFArticleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"经典文章推荐";
    self.view.backgroundColor = [UIColor whiteColor];
    [self creatUI];
    [self.view addSubview:self.tableView];
}

- (void)creatUI{

    NSArray *imageNameArr = @[@"1",@"2",@"3",@"4"];
    NSArray *imageTitleArr =@[@"这是一个人家的电动机啦但是打底裤莱德斯基乐山大佛撒旦佛挡杀佛了的萨芬喷雾喷哦哦我人品屋企人发放弃而",@"这是一个人家的电动机啦但是打底裤莱德斯基乐山大佛撒旦佛挡杀佛了的萨芬喷雾喷哦哦我人品屋企人发放弃而",@"这是一个人家的电动机啦但是打底裤莱德斯基乐山大佛撒旦佛挡杀佛了的萨芬喷雾喷哦哦我人品屋企人发放弃而",@"这是一个人家的电动机啦但是打底裤莱德斯基乐山大佛撒旦佛挡杀佛了的萨芬喷雾喷哦哦我人品屋企人发放弃而"];
    self.picView = [DCPicScrollView picScrollViewWithFrame:CGRectMake(0, 0, self.view.width, 200) WithImageUrls:imageNameArr];

    //        picView.placeImage = [UIImage imageNamed:@"place.png"];
    self.picView.titleData = imageTitleArr;
    [self.picView setImageViewDidTapAtIndex:^(NSInteger index) {
        
        LFLOG(@"点击了第%zd张图片",index);
    }];
    [self.view addSubview:self.picView];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    LFArticleCell *cell = [tableView dequeueReusableCellWithIdentifier:@"article"];
    if (cell == nil) {
        cell = [[LFArticleCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"article"];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 150;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    LFArticleDetailViewController *detailVc = [[LFArticleDetailViewController alloc] init];
    [self.navigationController pushViewController:detailVc animated:YES];
    
}
- (UITableView *)tableView{

    if (_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.picView.frame), self.view.width, self.view.height - CGRectGetMaxY(self.picView.frame))];
        [_tableView registerNib:[UINib nibWithNibName:@"LFArticleCell" bundle:nil] forCellReuseIdentifier:@"article"];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
