//
//  LFBookDetailInfo.h
//  LFBookReader
//
//  Created by apple on 16/4/20.
//  Copyright © 2016年 xyb100. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LFCommentInfo.h"
#import "LFIntroinfo.h"
#import "LFExpireBooks.h"
#import "LFChapInfo.h"
@interface LFBookDetailInfo : NSObject
@property (nonatomic,strong) LFCommentInfo *commentinfo;
@property (nonatomic,strong) LFChapInfo *chapinfo;
@property (nonatomic,strong) LFIntroinfo *introinfo;
@property (nonatomic,strong) LFExpireBooks *expRec;
@property (nonatomic,strong) LFExpireBooks *columbooks;
@property (nonatomic,strong) LFExpireBooks *authorRec;
@end
