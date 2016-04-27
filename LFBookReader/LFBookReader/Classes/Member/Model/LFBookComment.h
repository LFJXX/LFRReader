//
//  LFBookComment.h
//  LFBookReader
//
//  Created by apple on 16/4/25.
//  Copyright © 2016年 xyb100. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LFCommentList.h"
#import "LFBook.h"
@interface LFBookComment : NSObject
@property (nonatomic,copy) NSString *sid;
@property (nonatomic,assign) BOOL isLogin;


@property (nonatomic,strong) NSArray *commentlist;
@property (nonatomic,assign) BOOL isVip;
@property (nonatomic,assign) NSInteger guestcheckcode;

@property (nonatomic,assign) NSInteger guin;
@property (nonatomic,assign) NSInteger prefer;
@property (nonatomic,assign) NSInteger qq;
@property (nonatomic,copy) NSString *code;
@property (nonatomic,copy) NSString *version;
@property (nonatomic,copy) NSString *channel;
@property (nonatomic,strong) LFBook *book;
@end
