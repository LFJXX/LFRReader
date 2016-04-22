//
//  LFBookCommendViewController.m
//  LFBookReader
//
//  Created by apple on 16/4/5.
//  Copyright © 2016年 xyb100. All rights reserved.
//

#import "LFBookCommendViewController.h"
#import "LFBookCommendCell.h"
@interface LFBookCommendViewController ()<UITableViewDelegate,UITableViewDataSource,LFBookDetailViewDelegate>

@property (nonatomic,strong) DCPicScrollView *picView ;
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) NSMutableArray *bookLists;

@end

@implementation LFBookCommendViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"经典小说推荐";
    self.view.backgroundColor = [UIColor whiteColor];
    [self creatUI];
    [self.view addSubview:self.tableView];
    [self loadNewdata];
}

- (void)loadNewdata{
    
    [LFHttpTool GET:[NSString stringWithFormat:@"http://android.reader.qq.com/v5_8/readover?bid=%zd",self.bid] parameters:nil success:^(id response) {
        NSInteger code = [response[@"httpcode"] integerValue];
        if (code == 200) {
//            NSDictionary *dict = [response[@"areas"]  firstObject];
            self.bookLists = [LFBookList mj_objectArrayWithKeyValuesArray:response[@"relRec"][@"bookList"]];
            [self.tableView reloadData];
        }
    } failure:^(NSError *error) {
        
    }];
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
    
    return self.bookLists.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    LFBookCommendCell *cell = [tableView dequeueReusableCellWithIdentifier:@"bookCommend"];
    if (cell == nil) {
        cell = [[LFBookCommendCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"bookCommend"];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.booklist = self.bookLists[indexPath.row];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    LFBookDetailView *bookDetail = [LFBookDetailView show];
    bookDetail.booklist = self.bookLists[indexPath.row];
    bookDetail.delegate = self;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    return 150;
}

- (void)bookDetailViewDelegateBuyBook:(LFBookDetailView *)sender{

    LFLOG(@"立即购买");
}
- (void)bookDetailViewDelegateTryRead:(LFBookDetailView *)sender{

    LFLOG(@"试读");
    E_ScrollViewController *loginvctrl = [[E_ScrollViewController alloc] init];
    [self presentViewController:loginvctrl animated:NO completion:nil];

}
- (void)bookDetailViewDelegateAddLibrary:(LFBookDetailView *)sender{

    LFLOG(@"加入书架");
}
- (UITableView *)tableView{
    
    if (_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.picView.frame), self.view.width, self.view.height - CGRectGetMaxY(self.picView.frame)-64)];
        [_tableView registerNib:[UINib nibWithNibName:@"LFBookCommendCell" bundle:nil] forCellReuseIdentifier:@"bookCommend"];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}

- (NSMutableArray *)bookLists{

    if (_bookLists == nil) {
        _bookLists = [NSMutableArray arrayWithCapacity:0];
    }
    return _bookLists;
}
@end
