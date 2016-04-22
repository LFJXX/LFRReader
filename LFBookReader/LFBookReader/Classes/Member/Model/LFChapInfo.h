//
//  LFChapInfo.h
//  LFBookReader
//
//  Created by apple on 16/4/20.
//  Copyright © 2016年 xyb100. All rights reserved.
// 小说详情

#import <Foundation/Foundation.h>

@interface LFChapInfo : NSObject
/**
 *  最近更新时间
 */
@property (nonatomic,copy) NSString *lastChapterUpdateTime;
/**
 *  小说开始时间
 */
@property (nonatomic,assign) NSInteger lastChapterUploadTime;
/**
 *  是否完结
 */
@property (nonatomic,assign) NSInteger finished;
/**
 *  连载第几章
 */
@property (nonatomic,assign) NSInteger chapsize;
/**
 *
 */
@property (nonatomic,assign) NSInteger chapshowtag;
/**
 *  最新章节的名字
 */
@property (nonatomic,copy) NSString *lastcname;
@end
