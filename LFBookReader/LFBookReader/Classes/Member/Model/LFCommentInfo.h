//
//  LFCommentInfo.h
//  LFBookReader
//
//  Created by apple on 16/4/20.
//  Copyright © 2016年 xyb100. All rights reserved.
// 评论

#import <Foundation/Foundation.h>
#import "LFCommentInfo.h"
@interface LFCommentInfo : NSObject
/**
 * 评论数
 */
@property (nonatomic,assign) NSInteger commentcount;

@property (nonatomic,assign) NSInteger expiretime;

/**
 *  周活跃度
 */
@property (nonatomic,assign) NSInteger score;
@property (nonatomic,assign) NSInteger bid;
@property (nonatomic,strong) NSArray *commentlist;

@end
