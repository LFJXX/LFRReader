//
//  LFHttpTool.m
//  LFBookReader
//
//  Created by apple on 16/4/7.
//  Copyright © 2016年 xyb100. All rights reserved.
//

#import "LFHttpTool.h"

@implementation LFHttpTool
+ (void)GET:(NSString *)URLString parameters:(id)parameters success:(void (^)(id response))success failure:(void (^)(NSError *error))failure
{
    AFHTTPSessionManager *session = [AFHTTPSessionManager manager];
    [session GET:URLString parameters:parameters progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success) {
            success(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure) {
            failure(error);
        }
    }];
    
    
}


#pragma mark post 方法
+ (void)POST:(NSString *)URLString parameters:(id)parameters success:(void (^)(id response))success failure:(void (^)(NSError * error))failure{
    
   AFHTTPSessionManager *session = [AFHTTPSessionManager manager];
    [session POST:URLString parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success) {
            success(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure) {
            failure(error);
        }
    }];

}
@end
