//
//  LFUser.h
//  LFBookReader
//
//  Created by apple on 16/4/20.
//  Copyright © 2016年 xyb100. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LFUser : NSObject
/**
 *  头像
 */
@property (nonatomic,copy) NSString *icon;
/**
 *  昵称
 */
@property (nonatomic,copy) NSString *nickname;
/**
 *  <#Description#>
 */
@property (nonatomic,copy) NSString *fanslevelname;
/**
 *  等级
 */
@property (nonatomic,assign) NSInteger userlevel;

@property (nonatomic,assign) NSInteger istopuser;
@property (nonatomic,assign) NSInteger miyuezhuan;
@property (nonatomic,assign) NSInteger isauthor;
@property (nonatomic,assign) NSInteger admin;
@property (nonatomic,assign) NSInteger fanslevel;
@property (nonatomic,assign) NSInteger uid;

@end
