//
//  LFUtility.m
//  LFBookReader
//
//  Created by apple on 16/4/20.
//  Copyright © 2016年 xyb100. All rights reserved.
//

#import "LFUtility.h"

@implementation LFUtility
+ (UILabel *)creatLableWithFrame:(CGRect)frame font:(CGFloat)font color:(UIColor *)color title:(NSString *)title{
    
    UILabel *lable = [[UILabel alloc] initWithFrame:frame];
    lable.text = title;
//    lable.textAlignment = NSTextAlignmentLeft;
    lable.textColor = color;
    lable.font = [UIFont systemFontOfSize:font];
    
    return lable;
    
}
#pragma mark - 时间转字符串

+ (NSString*)stringFromData:(NSDate*)data
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"YYYY-MM-dd"];
    
    NSTimeZone* timeZone = [NSTimeZone timeZoneWithName:@"Asia/Beijing"];
    [formatter setTimeZone:timeZone];
    NSString *str = [formatter stringFromDate:data];
    return str;
    
    
}
#pragma mark - 字符串转时间
+ (NSDate*)dateFromString:(NSString*)str
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat : @"YYYY-MM-dd"];
    NSTimeZone* timeZone = [NSTimeZone timeZoneWithName:@"Asia/Shanghai"];
    [formatter setTimeZone:timeZone];
    NSDate* date = [formatter dateFromString:str];
    return date;
}

#pragma mark -- 时间戳转换为时间
+ (NSDate *)dateWithTimeStr:(NSString *)timeStr{
    
    NSDate *confromTimesp;
    if (timeStr.length > 10) {
        int  b = [[timeStr substringWithRange:NSMakeRange(0,10)] intValue];
        confromTimesp= [NSDate dateWithTimeIntervalSince1970:b];
    }else{
        confromTimesp= [NSDate dateWithTimeIntervalSince1970:0];
        
    }
    return confromTimesp;
}
+ (NSMutableAttributedString *)resetContentWithText:(NSString *)text{
    
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:text];
    [attributedString addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:14] range:NSMakeRange(0, attributedString.length)];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.alignment = NSTextAlignmentLeft;
    paragraphStyle.maximumLineHeight = 30;  //最大的行高
    paragraphStyle.lineSpacing = 5;  //行自定义行高度
    [paragraphStyle setFirstLineHeadIndent:0];//首行缩进 根据用户昵称宽度在加5个像素
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, text.length)];
    return attributedString;
    
}
@end
