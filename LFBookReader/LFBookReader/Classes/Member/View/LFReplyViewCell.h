//
//  LFReplyViewCell.h
//  LFBookReader
//
//  Created by apple on 16/4/22.
//  Copyright © 2016年 xyb100. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LFCommentList.h"
@interface LFReplyViewCell : UITableViewCell
@property (nonatomic,strong) LFCommentList *commentlist;
@property (nonatomic,assign) BOOL hidden;
@end
