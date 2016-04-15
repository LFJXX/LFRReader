//
//  LFRecommendsCell.h
//  LFBookReader
//
//  Created by apple on 16/3/31.
//  Copyright © 2016年 xyb100. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LFBookList.h"
@interface LFRecommendsCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@property (nonatomic,strong) LFBookList *booklist;
@end
