//
//  LFCommentList.h
//  LFBookReader
//
//  Created by apple on 16/4/20.
//  Copyright © 2016年 xyb100. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LFUser.h"
#import "LFSoreInfo.h"
@interface LFCommentList : NSObject
/**
 *  关联id
 */
@property (nonatomic,copy) NSString *commentid;
/**
 *  内容
 */
@property (nonatomic,copy) NSString *content;
/**
 *  标题
 */
@property (nonatomic,copy) NSString *title;
/**
 *  客户端类型
 */
@property (nonatomic,copy) NSString *platformname;

/**
 *  <#Description#>
 */
@property (nonatomic,assign) NSInteger platform;

/**
 *  <#Description#>
 */
@property (nonatomic,assign) NSInteger reward;
@property (nonatomic,assign) NSInteger status;
/**
 *  发表时间
 */
@property (nonatomic,assign) NSInteger lastreplytime;
@property (nonatomic,assign) NSInteger mark;
@property (nonatomic,assign) NSInteger disagree;
@property (nonatomic,assign) NSInteger type;
/**
 *  回复数
 */
@property (nonatomic,assign) NSInteger replycount;
@property (nonatomic,assign) NSInteger chapterid;
@property (nonatomic,assign) NSInteger agreestatus;
@property (nonatomic,assign) NSInteger createtime;
@property (nonatomic,assign) NSInteger red;
@property (nonatomic,assign) NSInteger better;
@property (nonatomic,assign) NSInteger subtype;
@property (nonatomic,assign) NSInteger authortag;
@property (nonatomic,assign) NSInteger bid;
/**
 *  赞
 */
@property (nonatomic,assign) NSInteger agree;
@property (nonatomic,assign) NSInteger top;
/**
 *  作者
 */
@property (nonatomic,strong) LFUser *user;
@property (nonatomic,strong) LFSoreInfo *scoreInfo;

@end
