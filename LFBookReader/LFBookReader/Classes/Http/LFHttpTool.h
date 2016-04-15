//
//  LFHttpTool.h
//  LFBookReader
//
//  Created by apple on 16/4/7.
//  Copyright © 2016年 xyb100. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LFHttpTool : NSObject

+ (void)GET:(NSString *)URLString parameters:(id)parameters success:(void (^)(id response))success failure:(void (^)(NSError *error))failure;
+ (void)POST:(NSString *)URLString parameters:(id)parameters success:(void (^)(id response))success failure:(void (^)(NSError *error))failure;
@end
