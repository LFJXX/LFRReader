//
//  LFCommentCell.h
//  LFBookReader
//
//  Created by apple on 16/4/21.
//  Copyright © 2016年 xyb100. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LFBookDetailInfo.h"
#import "LFCommentList.h"
@interface LFCommentCell : UITableViewCell
@property (nonatomic,strong) LFBookDetailInfo *bookDetailInfo;
@property (nonatomic,strong) LFCommentList *commentList;
@property (nonatomic,assign) BOOL hidden;
@end
