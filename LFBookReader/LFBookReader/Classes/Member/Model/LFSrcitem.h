//
//  LFSrcitem.h
//  LFBookReader
//
//  Created by apple on 16/4/8.
//  Copyright © 2016年 xyb100. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LFExtInfo.h"

@interface LFSrcitem : NSObject
@property (nonatomic,copy) NSString *alg_info;
@property (nonatomic,copy) NSString *comment;
@property (nonatomic,strong) LFExtInfo *ext_info;
@property (nonatomic,copy) NSString *item_id;
@property (nonatomic,copy) NSString *show_time;
@property (nonatomic,assign) NSInteger type;
@property (nonatomic,assign) NSInteger weight;
@end
