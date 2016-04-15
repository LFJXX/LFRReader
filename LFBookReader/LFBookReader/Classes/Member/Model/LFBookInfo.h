//
//  LFBookInfo.h
//  LFBookReader
//
//  Created by apple on 16/4/8.
//  Copyright © 2016年 xyb100. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LFBookInfo : NSObject
@property (nonatomic,assign) NSInteger auth;
@property (nonatomic,copy) NSString *author;
@property (nonatomic,assign) NSInteger bid;
@property (nonatomic,assign) NSInteger cardicon;
@property (nonatomic,copy) NSString *catel2name;
@property (nonatomic,copy) NSString *catel3name;
@property (nonatomic,copy) NSString *catetag;
@property (nonatomic,copy) NSString *desc;
@property (nonatomic,copy) NSArray *ex;
@property (nonatomic,copy) NSString *iconColor;
@property (nonatomic,copy) NSString *icondesc;
@property (nonatomic,copy) NSString *score;
@property (nonatomic,copy) NSString *srcinfo;
@property (nonatomic,copy) NSString *tags;
@property (nonatomic,copy) NSString *title;
@property (nonatomic,assign) NSInteger finished;
@property (nonatomic,assign) NSInteger forcePush;
@property (nonatomic,assign) NSInteger lftag;
@property (nonatomic,assign) NSInteger lmendtime;
@property (nonatomic,assign) NSInteger lmstarttime;
@property (nonatomic,assign) NSInteger online;
@property (nonatomic,assign) NSInteger weight;
@property (nonatomic,assign) NSInteger wordcount;

@end
