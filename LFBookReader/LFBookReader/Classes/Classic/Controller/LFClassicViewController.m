//
//  LFClassicViewController.m
//  LFBookReader
//
//  Created by apple on 16/3/31.
//  Copyright © 2016年 xyb100. All rights reserved.
//

#import "LFClassicViewController.h"
#import "LFClassicCell.h"
#import "LFCategory.h"
#import "LFBookList.h"

@interface LFClassicViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,LFBookDetailViewDelegate>

@property (nonatomic,strong) UISegmentedControl *segmentController;
@property (nonatomic,strong) UICollectionView *collectionView;
@property (nonatomic,strong) NSMutableArray *catoryArray;
@property (nonatomic,strong) NSMutableArray *bookList;

@end

@implementation LFClassicViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadNewData];
    [self.view addSubview:self.segmentController];
    [self.view addSubview:self.collectionView];
}

#pragma mark UICollectionView degegate和dataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    
    return 1;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return self.bookList.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    LFClassicCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"classic" forIndexPath:indexPath];

    LFBookList *bookList = self.bookList[indexPath.item];
    
    cell.booklist = bookList;
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    LFLOG(@"%zd",indexPath.item);
    
    LFBookDetailView *bookDetail = [LFBookDetailView show];
    bookDetail.delegate =self;
    bookDetail.booklist = self.bookList[indexPath.item];
}

- (void)bookDetailViewDelegateBuyBook:(LFBookDetailView *)sender{

}

- (void)bookDetailViewDelegateAddLibrary:(LFBookDetailView *)sender{

}

- (void)bookDetailViewDelegateTryRead:(LFBookDetailView *)sender{

    
}
- (void)loadNewData{

    [LFHttpTool GET:@"http://android.reader.qq.com/v5_8/queryOperation?categoryFlag=1" parameters:nil success:^(id response) {
        LFLOG(@"%@",response);
        NSInteger code = [response[@"httpcode"] integerValue];
        if (code == 200) {
            NSArray *list = response[@"girlCategoryList"];
            self.catoryArray = [LFCategory mj_objectArrayWithKeyValuesArray:list];
            [self changeSegment:self.segmentController];
        }
    } failure:^(NSError *error) {
         LFLOG(@"%@",error);
    }];
}

- (void)changeSegment:(UISegmentedControl *)segment{

    LFCategory *catory = self.catoryArray[segment.selectedSegmentIndex];
    NSString *str = [NSString stringWithFormat:@"http://android.reader.qq.com/v5_8/listDispatch?action=categoryV2&actionTag=-1,-1,6&actionId=%zd&pagestamp=1",catory.actionId];
    [LFHttpTool GET:str parameters:nil success:^(id response) {
        NSInteger code = [response[@"httpcode"] integerValue];
        if (code == 200) {
            NSArray *list = response[@"bookList"];
            self.bookList = [LFBookList mj_objectArrayWithKeyValuesArray:list];
            [self.collectionView reloadData];
        }
    } failure:^(NSError *error) {
        
    }];
}
#pragma mark  懒加载
- (UISegmentedControl *)segmentController{

    CGFloat marginX = 10;
    CGFloat Y = 10;
    CGFloat W = self.view.width - 2*marginX;
    CGFloat H = 35;

    if (_segmentController == nil) {
        _segmentController = [[UISegmentedControl alloc] initWithItems:@[@"古代言情",@"现代言情",@"玄幻言情",@"仙侠奇缘",@"浪漫青春"]];
        _segmentController.frame = CGRectMake(marginX, Y, W, H);
        _segmentController.selectedSegmentIndex = 0;
        _segmentController.backgroundColor = LFlightGrayColor;
        _segmentController.tintColor = LFLightBlueColor;
        [_segmentController setTitleTextAttributes:@{NSForegroundColorAttributeName:LFlightBlackColor} forState:UIControlStateNormal];
        [_segmentController setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]} forState:UIControlStateSelected];
        [_segmentController addTarget:self action:@selector(changeSegment:) forControlEvents:UIControlEventValueChanged];

        
    }
    return _segmentController;
}
- (UICollectionView *)collectionView{
    
    if (_collectionView == nil) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        CGFloat space = 5;
        CGFloat marginX = 10;
        CGFloat Y = CGRectGetMaxY(self.segmentController.frame);
        CGFloat height = self.view.height - Y - 44 - marginX-64;
        CGFloat ItemW = ([UIScreen mainScreen].bounds.size.width-2*marginX - 3*space)/4;
        
        layout.scrollDirection = UICollectionViewScrollDirectionVertical;
        layout.minimumLineSpacing = 2 * space;
        layout.minimumInteritemSpacing = space;
        layout.itemSize = CGSizeMake(ItemW, ItemW*1.5+2*marginX);
        
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(marginX, Y + marginX, self.view.width - 2*marginX, height) collectionViewLayout:layout];
        
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.backgroundColor = [UIColor clearColor];
        [_collectionView  registerNib:[UINib nibWithNibName:@"LFClassicCell" bundle:nil] forCellWithReuseIdentifier:@"classic"];
        
    }
    _collectionView.showsHorizontalScrollIndicator = NO;
    _collectionView.showsVerticalScrollIndicator = NO;
    return _collectionView;
}

- (NSMutableArray *)catoryArray{

    if (_catoryArray == nil) {
        _catoryArray = [NSMutableArray arrayWithCapacity:0];
        
    }
    return _catoryArray;
}

- (NSMutableArray *)bookList{

    if (_bookList == nil) {
        _bookList = [NSMutableArray arrayWithCapacity:0];
    }
    return _bookList;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}




@end
