//
//  LFMember.h
//  LFBookReader
//
//  Created by apple on 16/4/8.
//  Copyright © 2016年 xyb100. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LFCmd.h"
#import "LFBookInfo.h"

@interface LFMember : NSObject

@property (nonatomic,copy) NSString *id;
@property (nonatomic,assign) NSInteger moudle;
@property (nonatomic,copy) NSString *qurl;
@property (nonatomic,assign) NSInteger style;
@property (nonatomic,strong) LFCmd *cmd;
@property (nonatomic,strong) LFBookInfo *info;

@end
