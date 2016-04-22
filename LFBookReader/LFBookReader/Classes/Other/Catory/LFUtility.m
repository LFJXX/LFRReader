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
@end
