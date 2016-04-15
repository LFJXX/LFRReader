//
//  LFHandPick.h
//  LFBookReader
//
//  Created by apple on 16/4/8.
//  Copyright © 2016年 xyb100. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LFExtinfo.h"
@interface LFHandPick : NSObject
@property (nonatomic,copy) NSString *ad;
@property (nonatomic,copy) NSString *catinfos;
@property (nonatomic,copy) NSString *cmd;
@property (nonatomic,copy) NSString *cmdparams;
@property (nonatomic,copy) NSString *icon;
@property (nonatomic,copy) NSString *title;
@property (nonatomic,strong) LFExtinfo *extinfo;
@end
