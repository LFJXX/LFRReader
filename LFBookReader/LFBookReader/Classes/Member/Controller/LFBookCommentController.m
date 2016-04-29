//
//  LFBookCommentController.m
//  LFBookReader
//
//  Created by apple on 16/4/25.
//  Copyright © 2016年 xyb100. All rights reserved.
//

#import "LFBookCommentController.h"
#import "LFCommentList.h"
#import "LFCommentCell.h"
#import "LFBookComment.h"
#import "LFBookCommentCell.h"
#import "LFComposeCommentController.h"
@interface LFBookCommentController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) NSMutableArray *commentlists;
@property (nonatomic,strong) LFBookComment *bookComment;

@end

@implementation LFBookCommentController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"书评区";
    [self.view addSubview:self.tableView];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"发表" style:UIBarButtonItemStyleDone target:self action:@selector(composeComment)];
    [self loadNewData];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{

    if (self.bookComment == nil) {
        return 0;
    }
    return 2;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    if (section == 0) {
        return 1;
    }else{
    
        return self.commentlists.count;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    if (indexPath.section == 0) {
        static NSString *idtenfiter = @"bookcell";
        LFBookCommentCell *cell = [tableView dequeueReusableCellWithIdentifier:idtenfiter];
        if (cell == nil) {
            cell = [[LFBookCommentCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:idtenfiter];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.bookComment = self.bookComment;
        return cell;
    }else{
        static NSString *idtenfiter = @"bookComment";
        LFCommentCell  *cell = [tableView dequeueReusableCellWithIdentifier:idtenfiter];
        if (cell == nil) {
            cell = [[LFCommentCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:idtenfiter];
           
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.hidden = YES;
        cell.commentList = self.commentlists[indexPath.row];
        return cell;
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return [self computeHeightWithIndex:indexPath.row section:indexPath.section];
    
}
- (CGFloat)computeHeightWithIndex:(NSInteger)index section:(NSInteger)section{
    if (section == 0) {
        
        return 90;
    }else{
        
        LFCommentList *list = self.commentlists[index];
        CGFloat marginX = 10;
        CGFloat iconWH = 40;
        CGFloat textLableH = 30;
        if (list.title.length == 0) {
            textLableH = 0;
        }
        CGFloat platFormH = 20;
        CGFloat ContentH = [list.content boundingRectWithSize:CGSizeMake(LFScreenW - 2*marginX, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14]} context:nil].size.height;
      
        return iconWH+textLableH+ContentH+platFormH+4*marginX;

    }

}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{

    if (section == 0) {
        return 0;
    }else{
        return 10;
    }
}

- (void)composeComment{

    LFLOG(@"发表评论");
    LFComposeCommentController *composeVc  = [[LFComposeCommentController alloc] init];
    [self.navigationController pushViewController:composeVc animated:YES];
}

- (void)loadNewData{
    
    
    NSString *url = [NSString stringWithFormat:@"http://ios.reader.qq.com/v5_6/nativepage/comment/index?bid=%ld&ctype=0",self.bid];
    [LFHttpTool GET:url parameters:nil success:^(id response) {
        NSInteger code = [response[@"httpcode"] integerValue];
        if (code == 0) {
            self.bookComment = [LFBookComment mj_objectWithKeyValues:response];
            self.commentlists = [LFCommentList mj_objectArrayWithKeyValuesArray:response[@"commentlist"]] ;
            
            [self.tableView reloadData];
        }
    } failure:^(NSError *error) {
        
    }];
}
#pragma mark 懒加载
- (UITableView *)tableView{
    
    if (_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.width, self.view.height - 64)];
        _tableView.backgroundColor = [UIColor clearColor];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerNib:[UINib nibWithNibName:@"LFBookCommentCell" bundle:nil] forCellReuseIdentifier:@"bookcell"];
        
    }
    return _tableView;
}

- (NSMutableArray *)commentlists{

    if (_commentlists == nil) {
        _commentlists = [NSMutableArray arrayWithCapacity:0];
    }
    return _commentlists;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
