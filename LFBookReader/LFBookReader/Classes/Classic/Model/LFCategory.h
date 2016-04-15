//
//  LFCategory.h
//  LFBookReader
//
//  Created by apple on 16/4/7.
//  Copyright © 2016年 xyb100. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LFCategory : NSObject
@property (nonatomic,copy) NSString *categoryName;
@property (nonatomic,copy) NSString *level3categoryName;
@property (nonatomic,copy) NSString *bookCount;
@property (nonatomic,copy) NSString *img;
@property (nonatomic,assign) NSInteger actionId;
@property (nonatomic,assign) BOOL recommend;
@end
