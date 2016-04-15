//
//  LFCommendViewController.m
//  LFBookReader
//
//  Created by apple on 16/4/11.
//  Copyright © 2016年 xyb100. All rights reserved.
//

#import "LFCommendViewController.h"
#import "LFBookViewCell.h"
#import "LFMember.h"

@interface LFCommendViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView *tableView;
@end

@implementation LFCommendViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.tableView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return self.commendArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    LFBookViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"book"];
    if (cell == nil) {
        cell = [[LFBookViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"book"];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
     LFMember *member = self.commendArray[indexPath.row];
    cell.bookInfo = member.info;
    cell.competitionBtn.hidden = YES;
    
    return cell;

}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    LFBookDetailView *bookView = [LFBookDetailView show];
    LFMember *member = self.commendArray[indexPath.row];
    LFBookInfo *info = member.info;
    LFBookList *booklist = [[LFBookList alloc] init];
    booklist.author = info.author;
    booklist.title = info.title;
    booklist.bid = info.bid;
    booklist.intro = info.desc;
    booklist.showPrice = @"100";
    bookView.booklist = booklist;
    

  
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    return 120;
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
@end
