//
//  LFBookViewCell.h
//  LFBookReader
//
//  Created by apple on 16/4/1.
//  Copyright © 2016年 xyb100. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LFBookInfo.h"

@interface LFBookViewCell : UITableViewCell
@property (nonatomic,strong) LFBookList *booklist;
@property (weak, nonatomic) IBOutlet UIButton *competitionBtn;
@property (nonatomic,strong) LFBookInfo *bookInfo;
@end
