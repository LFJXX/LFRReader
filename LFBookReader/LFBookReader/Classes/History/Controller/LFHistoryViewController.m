//
//  LFHistoryViewController.m
//  LFBookReader
//
//  Created by apple on 16/3/31.
//  Copyright © 2016年 xyb100. All rights reserved.
//

#import "LFHistoryViewController.h"
#import "LFRecommendsCell.h"
#import "LFBookeView.h"
#import "LFBookViewCell.h"
#import "LFArticleViewController.h"
#import "LFBookCommendViewController.h"
#import "LFRank.h"
#import "LFHandPick.h"
#import "LFBookDetailInfoViewController.h"
#define LFRGBColor  [UIColor colorWithRed:arc4random_uniform(255)/255.0 green:arc4random_uniform(255)/255.0 blue:arc4random_uniform(255)/255.0 alpha:1]

@interface LFHistoryViewController ()<UITableViewDelegate,UITableViewDataSource,UICollectionViewDelegate,UICollectionViewDataSource>
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) NSArray *sectionArray;
@property (nonatomic,strong) UICollectionView *collectionView;
@property (nonatomic,strong) UIView  *HistoryBookView;
@property (nonatomic,strong) LFBookeView *firstBookView;
@property (nonatomic,strong) LFBookeView *secondBookView;
@property (nonatomic,strong) NSMutableArray *rankArray;
@property (nonatomic,strong) NSMutableArray *commendArray;
@property (nonatomic,strong) NSMutableArray *readArray;
@property (nonatomic,strong) NSMutableArray *advanceBookArray;

@end

@implementation LFHistoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.tableView];
    NSArray *array = @[@"文史新书",@"专题推荐",@"阅读排行"];
    self.sectionArray = array;
    [self loadNewdata];
   
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{

    return 3;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    if (section == 0){
    
        return  self.advanceBookArray.count > 0 ?1:0;
    }else if (section == 1){
        
        return  self.commendArray.count > 0 ?1:0;
        
    }else {
        
        return self.readArray.count;
    }
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    if (indexPath.section != 2) {
        
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"recommends"];
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"recommends"];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        if (indexPath.section == 0) {
            [cell.contentView addSubview:self.HistoryBookView];
            self.firstBookView.bookList = self.advanceBookArray[0];
            self.secondBookView.bookList = self.advanceBookArray[1];
        }
        if (indexPath.section == 1) {
            [cell.contentView addSubview:self.collectionView];
        }
        return cell;
    }else{
    
        LFBookViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"book"];
        if (cell == nil) {
            cell = [[LFBookViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"book"];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        LFBookList *bookList = self.readArray[indexPath.row];
        cell.booklist = bookList;
        [cell.competitionBtn setTitle:[NSString stringWithFormat:@"%zd",(indexPath.row + 1)] forState:UIControlStateNormal];

        [cell.competitionBtn setBackgroundColor:LFRGBColor];
        return cell;

    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    if (indexPath.section == 2) {
        
        LFBookDetailInfoViewController *detailVc = [[LFBookDetailInfoViewController alloc] init];
        detailVc.bookList = self.readArray[indexPath.row];
        [self.navigationController pushViewController:detailVc animated:YES];
    }
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{

    NSString *str = self.sectionArray[section];
    
    return str;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{

    UILabel *lable = [[UILabel alloc] init];
    lable.text = [NSString stringWithFormat:@"    %@",self.sectionArray[section]];
    lable.textColor = LFlightBlackColor;
    lable.font = [UIFont systemFontOfSize:15];
    return lable;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{

    return 30;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    if (indexPath.section == 0) {
        return 150;
    }else if (indexPath.section == 1) {
        
        return 100;
    }else{
    
        return 100;
    }
}

#pragma mark UICollectionView degegate和dataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    
    return 1;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return self.commendArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    LFRecommendsCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"recommends" forIndexPath:indexPath];
    
    cell.booklist = self.commendArray[indexPath.item];
//    cell.iconView.image = [UIImage imageNamed:@"1"];

    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{

    LFLOG(@"%zd",indexPath.item);
    if (indexPath.item %2 == 0) {
        LFArticleViewController *articleVc = [[LFArticleViewController alloc] init];
        [self.navigationController pushViewController:articleVc animated:YES];
    }else{
        
        LFBookCommendViewController *bookVc = [[LFBookCommendViewController alloc] init];
        LFBookList *bookList = self.commendArray[indexPath.item];
        bookVc.bid = bookList.bid;
        [self.navigationController pushViewController:bookVc animated:YES];
    }
}

#pragma mark action
- (void)loadNewdata{

    [LFHttpTool GET:@"http://android.reader.qq.com/v5_8/queryOperation?adids=102756&pagestamp=1&rankFlag=1&origin=102424" parameters:nil success:^(id response) {
        NSInteger code = [response[@"httpcode"] integerValue];
        if (code == 200) {
            self.rankArray = [LFRank mj_objectArrayWithKeyValuesArray:response[@"rank"]];
            [self loadRankCompositer];
        }
    } failure:^(NSError *error) {
        
    }];
}

- (void)loadRankCompositer{
    for (int i = 0; i<3; i++) {
        LFRank *rank = self.rankArray[i];
        NSString *urlString = [NSString stringWithFormat:@"http://android.reader.qq.com/v5_8/listDispatch?actionTag=%@&actionId=%zd&action=rank&pagestamp=1",rank.actionTag,rank.actionId];
        
        [LFHttpTool GET:urlString parameters:nil success:^(id response) {
            NSInteger code = [response[@"httpcode"] integerValue];
            if (code == 200) {
                switch (i) {
                    case 0:
                    {
                       self.advanceBookArray = [LFBookList mj_objectArrayWithKeyValuesArray:response[@"bookList"]];
                    }
                        break;
                    case 1:
                    {
                        self.commendArray = [LFBookList mj_objectArrayWithKeyValuesArray:response[@"bookList"]];
                    }
                        break;
                    case 2:
                    {
                        self.readArray = [LFBookList mj_objectArrayWithKeyValuesArray:response[@"bookList"]];
                        
                    }
                        break;
                        
                    default:
                        break;
                }
               [self.tableView reloadData];
                [self.collectionView reloadData];
                
            }
        } failure:^(NSError *error) {
            
        }];
    }
    

}


#pragma mark  懒加载
- (UITableView *)tableView{

    if (_tableView == nil) {
        _tableView = [[UITableView alloc] init];
        _tableView.frame = CGRectMake(0, 0, self.view.width, self.view.height - 64);
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerNib:[UINib nibWithNibName:@"LFBookViewCell" bundle:nil] forCellReuseIdentifier:@"book"];
     
 
    }
    return _tableView;
}

- (UICollectionView *)collectionView{

    if (_collectionView == nil) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        CGFloat marginX = 15;
        CGFloat height = 80;
        layout.minimumLineSpacing = marginX;
        layout.minimumInteritemSpacing = marginX;
        layout.itemSize = CGSizeMake(150, height);

        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(marginX, marginX/2, self.view.width - 2*marginX, height) collectionViewLayout:layout];

        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.backgroundColor = [UIColor clearColor];
        _collectionView.showsHorizontalScrollIndicator = NO;
        [_collectionView  registerNib:[UINib nibWithNibName:@"LFRecommendsCell" bundle:nil] forCellWithReuseIdentifier:@"recommends"];

    }
    return _collectionView;
}

- (UIView *)HistoryBookView{

    if (_HistoryBookView == nil) {
        CGFloat marginX = 20;
        CGFloat marginY = 5;
        CGFloat height = 130;
        CGFloat W = self.view.width - 2*marginX;
        _HistoryBookView = [[UIView alloc] initWithFrame:CGRectMake(marginX, marginY, self.view.width - 2*marginX , height)];
        self.firstBookView = [LFBookeView bookView];
        self.firstBookView.frame = CGRectMake(0, 0, W/2, height);
        [_HistoryBookView addSubview:self.firstBookView];
        
        self.secondBookView = [LFBookeView bookView];
        self.secondBookView.frame = CGRectMake(CGRectGetMaxX(self.firstBookView.frame), 0, W/2, height);
        [_HistoryBookView addSubview:self.secondBookView];
        
    }
    return _HistoryBookView;
}

- (NSMutableArray *)rankArray{

    if (_rankArray == nil) {
        _rankArray = [NSMutableArray arrayWithCapacity:0];
    }
    return _rankArray;
}

- (NSMutableArray *)commendArray{

    if (_commendArray == nil) {
        _commendArray = [NSMutableArray arrayWithCapacity:0];
    }
    return _commendArray;
}

- (NSMutableArray *)readArray{

    if (_readArray == nil) {
        _readArray = [NSMutableArray arrayWithCapacity:0];
    }
    return _readArray;
}

- (NSMutableArray *)advanceBookArray{

    if (_advanceBookArray == nil) {
        _advanceBookArray = [NSMutableArray arrayWithCapacity:0];
    }
    return _advanceBookArray;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

@end
