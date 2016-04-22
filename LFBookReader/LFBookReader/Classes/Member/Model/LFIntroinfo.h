//
//  LFIntroinfo.h
//  LFBookReader
//
//  Created by apple on 16/4/20.
//  Copyright © 2016年 xyb100. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LFBook.h"
#import "LFPrice.h"
#import "LFSoreInfo.h"
@interface LFIntroinfo : NSObject
@property (nonatomic,copy) NSString *authoricon;
@property (nonatomic,assign)NSInteger isVip;
@property (nonatomic,assign)NSInteger fansNum;
@property (nonatomic,assign)NSInteger packageid;
@property (nonatomic,copy) NSString *feeType;
@property (nonatomic,assign)NSInteger rightType;
@property (nonatomic,strong) LFBook *book;
@property (nonatomic,strong) LFPrice *prices;
@property (nonatomic,strong) LFSoreInfo *scoreInfo;


@end
