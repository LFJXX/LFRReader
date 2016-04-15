//
//  LFPrefleViewController.m
//  LFBookReader
//
//  Created by apple on 16/3/31.
//  Copyright © 2016年 xyb100. All rights reserved.
//

#import "LFPrefleViewController.h"
#import "LFClassicCell.h"

@interface LFPrefleViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property (nonatomic,strong) UIView *headerView;
@property (nonatomic,strong) UICollectionView *collectionView;
@end

@implementation LFPrefleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.headerView];
    [self.view addSubview:self.collectionView];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"note" style:UIBarButtonItemStyleDone target:self action:@selector(noteClick)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"设置" style:UIBarButtonItemStyleDone target:self action:@selector(settingClcik)];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark UICollectionView degegate和dataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    
    return 1;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return 8;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    LFClassicCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"classic" forIndexPath:indexPath];
    
    
    
    return cell;
}
#pragma mark action
- (void)changeHeaderImage:(UIGestureRecognizer *)tap{

}

- (void)noteClick{
    
}

- (void)settingClcik{
    
}
#pragma mark 懒加载
- (UIView *)headerView{

    if (_headerView == nil) {
        _headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.width, 150)];
        _headerView.backgroundColor = LFLightBlueColor;
        CGFloat WH = 60;
        CGFloat Y = 10;
        CGFloat X = (self.view.width - WH)/2;
        UIImageView *iconView = [[UIImageView alloc] initWithFrame:CGRectMake(X, Y, WH, WH)];
        iconView.image = [UIImage imageNamed:@"1"];
        iconView.layer.cornerRadius = WH/2;
        iconView.layer.masksToBounds = YES;
        iconView.userInteractionEnabled = YES;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(changeHeaderImage:)];
        [iconView addGestureRecognizer:tap];
        [_headerView addSubview:iconView];
        
        UILabel *lable = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(iconView.frame), LFScreenW, 20)];
        lable.text = @"面包小木木";
        lable.textAlignment = NSTextAlignmentCenter;
        lable.textColor = [UIColor whiteColor];
        lable.font = [UIFont systemFontOfSize:15];
        [_headerView addSubview:lable];
        
        
    }
    return _headerView;
}
- (UICollectionView *)collectionView{
    
    if (_collectionView == nil) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        CGFloat space = 5;
        CGFloat marginX = 10;
        CGFloat Y = CGRectGetMaxY(self.headerView.frame)+marginX;
        CGFloat height = self.view.height - Y - 44 - marginX;
        CGFloat ItemW = ([UIScreen mainScreen].bounds.size.width-2*marginX - 3*space)/4;
        
        layout.scrollDirection = UICollectionViewScrollDirectionVertical;
        layout.minimumLineSpacing = 4 * space;
        layout.minimumInteritemSpacing = space;
        layout.itemSize = CGSizeMake(ItemW, ItemW*1.5+2*marginX);
        
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(marginX, Y + marginX, self.view.width - 2*marginX, height) collectionViewLayout:layout];
        
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.backgroundColor = [UIColor clearColor];
        _collectionView.showsHorizontalScrollIndicator = NO;
        [_collectionView  registerNib:[UINib nibWithNibName:@"LFClassicCell" bundle:nil] forCellWithReuseIdentifier:@"classic"];
        
    }
    return _collectionView;
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
