//
//  LFContentListController.m
//  LFBookReader
//
//  Created by apple on 16/4/28.
//  Copyright © 2016年 xyb100. All rights reserved.
//

#import "LFContentListController.h"
#import "LFButton.h"
#import "LFChapter.h"
@interface LFContentListController ()<UITableViewDelegate,UITableViewDataSource,UIPickerViewDelegate,UIPickerViewDataSource>
@property (nonatomic,strong)UITableView *tableView;
@property (nonatomic,strong) UIView *headerView;
@property (nonatomic,strong) UILabel *listCountLable;
@property (nonatomic,strong) LFButton *listCountBtn;
@property (nonatomic,strong) NSMutableArray *lists;
@property (nonatomic,strong) NSMutableArray *chapterList;
@property (nonatomic,strong) UIPickerView *pickView;
@end

@implementation LFContentListController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.tableView];
    [self loadNewData];
}
- (void)loadNewData{
  
    NSString *url = [NSString stringWithFormat:@"http://ios.reader.qq.com/v5_6/chapter?bid=%ld&pageNo=1",self.bid];
    [LFHttpTool GET:url parameters:nil success:^(id response) {
        NSInteger code = [response[@"httpcode"] integerValue];
        if (code == 0) {
            self.lists = [LFChapter mj_objectArrayWithKeyValuesArray:response[@"chapter"]];
            self.chapterList = response[@"page"];
            [self.tableView reloadData];
        }
    } failure:^(NSError *error) {
        
    }];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return self.lists.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    static NSString *list = @"list";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:list];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:list];
        cell.textLabel.textColor = [UIColor grayColor];
        cell.detailTextLabel.textColor = [UIColor orangeColor];
        cell.textLabel.font = [UIFont systemFontOfSize:15];
        cell.detailTextLabel.font = [UIFont systemFontOfSize:14];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    LFChapter *chapter = self.lists[indexPath.row];
    cell.textLabel.text= chapter.title;
    cell.detailTextLabel.text = @"免费";
    
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{

    return 40;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{

    return self.headerView;
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{

    return self.chapterList.count;
}




- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{

    return self.chapterList[row];
}
#pragma mark 懒加载
- (UITableView *)tableView{

    if (_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.width, self.view.height - 64)];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}

- (UIView *)headerView{

    if (_headerView == nil) {
        _headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.width, 40)];
        _headerView.backgroundColor = [UIColor whiteColor];
        self.listCountLable = [LFUtility creatLableWithFrame:CGRectMake(5, 0, self.view.width/2, _headerView.height) font:16 color:[UIColor blackColor] title:@"共1668章"];
        [_headerView addSubview:self.listCountLable];
        
        self.listCountBtn = [LFButton buttonWithType:UIButtonTypeCustom];
        self.listCountBtn.frame = CGRectMake(self.view.width - 120, 5, 100, 30);
        self.listCountBtn.titleLabel.font = [UIFont systemFontOfSize:16];
        [self.listCountBtn setBackgroundColor:LFLightBlueColor];
        [self.listCountBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [self.listCountBtn setTitle:@"1-100章" forState:UIControlStateNormal];
        [self.listCountBtn setImage:[UIImage imageNamed:@"down"] forState:UIControlStateNormal];
         [self.listCountBtn setImage:[UIImage imageNamed:@"up"] forState:UIControlStateSelected];
        [self.listCountBtn addTarget:self action:@selector(listCountBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [_headerView addSubview:self.listCountBtn];
        
    }
    return _headerView;
}
- (NSMutableArray *)lists{

    if (_lists == nil) {
        _lists = [NSMutableArray arrayWithCapacity:0];
    }
    return _lists;
}

- (NSMutableArray *)chapterList{

    if (_chapterList == nil) {
        _chapterList = [NSMutableArray arrayWithCapacity:0];
    }
    return _chapterList;
}

- (UIPickerView *)pickView{

    if (_pickView == nil) {
        _pickView = [[UIPickerView alloc] initWithFrame:CGRectMake(0, self.view.height - 150, self.view.width, 150)];
        _pickView.backgroundColor = [UIColor whiteColor];
        _pickView.delegate = self;
        _pickView.dataSource = self;
    }
    return _pickView;
}
- (void)listCountBtnClick:(UIButton *)sender{

    sender.selected = !sender.selected;
    [self.view addSubview:self.pickView];
    
    
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
