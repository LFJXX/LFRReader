//
//  LFBookeView.h
//  LFBookReader
//
//  Created by apple on 16/3/31.
//  Copyright © 2016年 xyb100. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LFBookList.h"
@interface LFBookeView : UIView
@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@property (weak, nonatomic) IBOutlet UILabel *nameLable;

@property (nonatomic,strong) LFBookList *bookList;
+ (LFBookeView *)bookView;
@end
