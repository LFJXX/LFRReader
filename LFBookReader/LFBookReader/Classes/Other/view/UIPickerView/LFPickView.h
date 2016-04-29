//
//  LFPickView.h
//  pick
//
//  Created by apple on 16/4/29.
//  Copyright © 2016年 xyb100. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LFPickValue.h"
@class LFPickView;
@protocol LFPickViewDelegate <NSObject>

- (void)pickViewDidSeleted:(LFPickValue *)value;

@end
@interface LFPickView : UIView
@property (nonatomic,strong) NSArray *dataSourse;
@property (nonatomic,weak) id<LFPickViewDelegate>delegate;
- (void)show;
- (void)hide;

@end
