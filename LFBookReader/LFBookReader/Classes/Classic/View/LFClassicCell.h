//
//  LFClassicCell.h
//  LFBookReader
//
//  Created by apple on 16/4/1.
//  Copyright © 2016年 xyb100. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LFBookList.h"
@interface LFClassicCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@property (weak, nonatomic) IBOutlet UILabel *nameLable;
@property (weak, nonatomic) IBOutlet UIButton *deletedBtn;
@property (nonatomic,strong) LFBookList *booklist;

@end
