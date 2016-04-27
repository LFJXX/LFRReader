//
//  LFBook.h
//  LFBookReader
//
//  Created by apple on 16/4/20.
//  Copyright © 2016年 xyb100. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LFStatParams.h"
@interface LFBook : NSObject
@property (nonatomic,copy) NSString *filemd5;
@property (nonatomic,assign)NSInteger downloadtype;
@property (nonatomic,assign)NSInteger cpid;
@property (nonatomic,copy) NSString *editorwds;
@property (nonatomic,copy) NSString *publisher;
@property (nonatomic,assign)NSInteger version;
@property (nonatomic,assign)NSInteger id;
@property (nonatomic,assign)NSInteger free;
@property (nonatomic,assign)NSInteger drm;
@property (nonatomic,copy) NSString *downloadurl;
@property (nonatomic,copy) NSString *author;
@property (nonatomic,copy) NSString *title;
@property (nonatomic,copy) NSString *isbn;
@property (nonatomic,copy) NSString *bookfrom;
@property (nonatomic,assign)NSInteger catid;
@property (nonatomic,assign)NSInteger fileformat;
@property (nonatomic,copy) NSString *categoryshortname;
@property (nonatomic,assign)NSInteger form;
@property (nonatomic,assign)NSInteger payed;
@property (nonatomic,assign)NSInteger ltimedisprice;
@property (nonatomic,assign)NSInteger finished;
@property (nonatomic,assign)NSInteger bookprice;
@property (nonatomic,copy) NSString *ltimedisperiod;
@property (nonatomic,copy) NSString *dismsg;
@property (nonatomic,copy) NSString *format;
@property (nonatomic,copy) NSString *intro;
@property (nonatomic,assign)NSInteger discount;
@property (nonatomic,copy) NSString *publishtime;
@property (nonatomic,copy) NSString *ltimedismsg;
@property (nonatomic,copy) NSString *copyrightinfo;
@property (nonatomic,copy) NSString *translator;
@property (nonatomic,copy) NSString *categoryname;

@property (nonatomic,assign)NSInteger totalwords;
@property (nonatomic,assign)NSInteger publishPrice;
@property (nonatomic,strong) LFStatParams *stat_params;

@property (nonatomic,assign)NSInteger commentcount;
@property (nonatomic,strong) NSArray *topuser;
@property (nonatomic,assign)NSInteger score;
@property (nonatomic,assign)NSInteger scorerank;
@property (nonatomic,assign)NSInteger bid;
@end
