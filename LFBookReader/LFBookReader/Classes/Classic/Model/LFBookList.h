//
//  LFBookList.h
//  LFBookReader
//
//  Created by apple on 16/4/7.
//  Copyright © 2016年 xyb100. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LFStatParams.h"
#import "LFExt.h"

@interface LFBookList : NSObject
@property (nonatomic,copy) NSString  *author;
@property (nonatomic,assign) NSInteger bid;
@property (nonatomic,copy) NSString *categoryName;
@property (nonatomic,assign) NSInteger discount;
@property (nonatomic,assign) BOOL finished;
@property (nonatomic,copy) NSString *intro;
@property (nonatomic,assign) NSInteger lastChapter;
@property (nonatomic,copy) NSString *num;
@property (nonatomic,assign) NSInteger price;
@property (nonatomic,copy) NSString *showPrice;
@property (nonatomic,copy) NSString *title;
@property (nonatomic,assign) NSInteger totalWords;
@property (nonatomic,assign) NSInteger unitprice;
@property (nonatomic,assign) NSInteger updateTime;

@property (nonatomic,strong) LFStatParams *stat_params;

@property (nonnull,strong) LFExt *ext;


@end
