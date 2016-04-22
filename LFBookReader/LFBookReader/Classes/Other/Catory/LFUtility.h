//
//  LFUtility.h
//  LFBookReader
//
//  Created by apple on 16/4/20.
//  Copyright © 2016年 xyb100. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LFUtility : NSObject
+ (UILabel *)creatLableWithFrame:(CGRect)frame font:(CGFloat)font color:(UIColor *)color title:(NSString *)title;
/**
 *  时间转字符串
 */
+ (NSString*)stringFromData:(NSDate*)data;
/**
 *  字符串转时间
 */

+ (NSDate*)dateFromString:(NSString*)str;

/**
 *  时间戳转时间
 */
+ (NSDate *)dateWithTimeStr:(NSString *)timeStr;
/**
 *  设置lable行间距
 */
+ (NSMutableAttributedString *)resetContentWithText:(NSString *)text;
@end
