//
//  LFMemberViewController.m
//  LFBookReader
//
//  Created by apple on 16/3/31.
//  Copyright © 2016年 xyb100. All rights reserved.
//

#import "LFMemberViewController.h"
#import "LFBookReviewCell.h"
#import "LFMember.h"
#import "LFCommendViewController.h"
#import "LFBookDetailInfoViewController.h"
@interface LFMemberViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) UIView *commendView;
@property (nonatomic,strong) NSMutableArray *commendArray;
@property (nonatomic,strong) NSMutableArray *catoryList;
@end

@implementation LFMemberViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.tableView];
    [self loadNewdata];
    [self loadCatorydata];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{

    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    if (section == 0) {
        return 1;
    }else{
    
        return self.catoryList.count;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{


    if (indexPath.section == 0) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        [cell.contentView addSubview:self.commendView];
        return cell;
    }else{
        LFBookReviewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"bookReview"];
        if (cell == nil) {
            cell = [[LFBookReviewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"bookReview"];
        }
        cell.booklist = self.catoryList[indexPath.row];
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;

        
    }

}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    LFBookList *booklist = self.catoryList[indexPath.row];
    LFBookDetailInfoViewController *detailVC = [[LFBookDetailInfoViewController alloc] init];
    detailVC.bookList = booklist;
    [self.navigationController pushViewController:detailVC animated:YES];
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    if (indexPath.section == 0) {
        return 150;
    }else{
    
        return 120;
    }
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{

    if (section == 0) {
        return @"  委员荐书";
    }else{
        return @"  委员书评";
    }

}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    UILabel *lable = [[UILabel alloc] init];
    if (section == 0) {
        lable.text = @"   委员荐书";
    }else{
        lable.text = @"   委员书评";
    }
    lable.textColor = LFlightBlackColor;
    lable.font = [UIFont systemFontOfSize:15];
    return lable;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{

    return 30;
}
#pragma mark action

- (void)memberCommendDidClick:(UIGestureRecognizer *)tap{

    LFBookeView *view = (LFBookeView *)tap.view;
    NSInteger index = view.tag;
    [self bookDatailWithIndex:index];
}

- (void)bookDatailWithIndex:(NSInteger)index{

    LFLOG(@"查看第%zd本书的详情信息",index);
}

- (void)checkMoreBook:(UIButton *)sender{

    LFLOG(@"查看更多");
    LFCommendViewController *commendVc = [[LFCommendViewController alloc] init];
    commendVc.commendArray = self.commendArray;
    [self.navigationController pushViewController:commendVc animated:YES];
    
}

- (void)loadNewdata{
    
    [LFHttpTool GET:@"http://android.reader.qq.com/v5_8/nativepage/infostream/list?periods=2016041109&realdata=1&sex=1" parameters:nil success:^(id response) {
        NSInteger code = [response[@"httpcode"] integerValue];
        if (code == 200) {
            NSDictionary *dict = [response[@"areas"]  firstObject];
            self.commendArray = [LFMember mj_objectArrayWithKeyValuesArray:dict[@"infos"]];
            for (LFBookeView *bookView in self.commendView.subviews) {
                if ([bookView isKindOfClass:[LFBookeView class]]) {
                    
                    NSInteger  index = bookView.tag;
                    LFMember *member = self.commendArray[index];
                    
                    NSString *bid = [NSString stringWithFormat:@"%zd",member.info.bid];
                    NSString *str = [bid substringFromIndex:bid.length - 3];
                    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://wfqqreader.3g.qq.com/cover/%@/%@/t5_%@.jpg",str,bid,bid]];
                    
                    bookView.nameLable.text = member.info.title;
                    [bookView.iconView sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"4"]];
                }
            }
        }
    } failure:^(NSError *error) {
        
    }];
}
- (void)loadCatorydata{
    
    [LFHttpTool GET:@"http://android.reader.qq.com/v5_8/listDispatch?action=categoryV2&actionTag=-1,-1,6&actionId=20028&pagestamp=1" parameters:nil success:^(id response) {
        NSInteger code = [response[@"httpcode"] integerValue];
        if (code == 200) {
            
            self.catoryList = [LFBookList mj_objectArrayWithKeyValuesArray:response[@"bookList"]];
            [self.tableView reloadData];
        }
    } failure:^(NSError *error) {
        
    }];
}
#pragma mark 懒加载

- (UITableView *)tableView{
    
    if (_tableView == nil) {
        _tableView = [[UITableView alloc] init];
        _tableView.frame = CGRectMake(0, 0, self.view.width, self.view.height - 64);
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerNib:[UINib nibWithNibName:@"LFBookReviewCell" bundle:nil] forCellReuseIdentifier:@"bookReview"];
        
        
    }
    return _tableView;
}

- (UIView *)commendView{

    if (_commendView == nil) {
        CGFloat marginX = 10;
        CGFloat height = 150;
        _commendView = [[UIView alloc] initWithFrame:CGRectMake(marginX, 0, self.view.width - 2*marginX, height)];
        
        CGFloat Y = 0;
        CGFloat W = (self.view.width - 2*marginX)/3;
        CGFloat H = height - 20;
        for (int i = 0; i < 3; i++) {
            CGFloat X = W*i;
            LFBookeView *view = [LFBookeView bookView];
            view.tag = i;
            view.nameLable.backgroundColor = [UIColor clearColor];
            view.frame = CGRectMake(X, Y, W, H);
            view.tag = i;
            view.userInteractionEnabled = YES;
            UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(memberCommendDidClick:)];
            [view addGestureRecognizer:tap];
            [_commendView addSubview:view];
        }
        
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(self.view.width - 2*marginX - 100, height - 20, 100, 20);
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [btn.titleLabel setFont:[UIFont systemFontOfSize:13]];
        [btn setTitle:@"查看更多" forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(checkMoreBook:) forControlEvents:UIControlEventTouchUpInside];
        [_commendView addSubview:btn];
    }
    return _commendView;
}

- (NSMutableArray *)commendArray{

    if (_commendArray == nil) {
        _commendArray = [NSMutableArray arrayWithCapacity:0];
    }
    return _commendArray;
}

- (NSMutableArray *)catoryList{

    if (_catoryList == nil) {
        _catoryList = [NSMutableArray arrayWithCapacity:0];
    }
    return _catoryList;
}

@end
