//
//  LFCommentDetailController.m
//  LFBookReader
//
//  Created by apple on 16/4/22.
//  Copyright © 2016年 xyb100. All rights reserved.
//

#import "LFCommentDetailController.h"
#import "LFCommentCell.h"
#import "LFReplyViewCell.h"

@interface LFCommentDetailController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView *tableView;

@end

@implementation LFCommentDetailController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.tableView];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{

    return 2;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    if (indexPath.section == 0) {
        static NSString *identidier1 = @"commentList";
        LFCommentCell *cell = [tableView dequeueReusableCellWithIdentifier:identidier1];
        if (cell == nil) {
            cell = [[LFCommentCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identidier1];
        }
        cell.selectionStyle  = UITableViewCellSelectionStyleNone;
        
        cell.commentList = self.commentList;
        cell.hidden = YES;
        
        return cell;

    }else{
        static NSString *identidier1 = @"reply";
        LFReplyViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identidier1];
        if (cell == nil) {
            cell = [[LFReplyViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identidier1];
        }
        cell.selectionStyle  = UITableViewCellSelectionStyleNone;
        

        return cell;

    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    if (indexPath.section == 0) {
        return [self computeHeightWithIndex:0];
    }
    return 44;
}
- (CGFloat)computeHeightWithIndex:(NSInteger)index{
    if (index == 0) {
        
        LFCommentList *list = self.commentList;
        CGFloat marginX = 10;
        CGFloat iconWH = 40;
        CGFloat textLableH = 20;
        if (list.title.length == 0) {
            textLableH = 0;
        }
        CGFloat platFormH = 20;
        CGFloat ContentH = [list.content boundingRectWithSize:CGSizeMake(LFScreenW - 2*marginX, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14]} context:nil].size.height;
        
        return iconWH+textLableH+ContentH+platFormH+5*marginX;
    }else{
    
        return 44;
    }
    
   
    
}
#pragma mark 懒加载
- (UITableView *)tableView{
    
    if (_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.width, self.view.height - 64)];
        _tableView.backgroundColor = [UIColor clearColor];
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
