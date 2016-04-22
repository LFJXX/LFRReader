//
//  LFExpireBooks.h
//  LFBookReader
//
//  Created by apple on 16/4/20.
//  Copyright © 2016年 xyb100. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LFBookList.h"
@interface LFExpireBooks : NSObject
@property (nonatomic,strong) NSArray *bookList;
@property (nonatomic,assign) NSInteger expiretime;
@end
