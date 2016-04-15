//
//  LFBookDetailView.h
//  LFBookReader
//
//  Created by apple on 16/4/5.
//  Copyright © 2016年 xyb100. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LFBookList.h"
@class LFBookDetailView;
@protocol LFBookDetailViewDelegate <NSObject>

- (void)bookDetailViewDelegateTryRead:(LFBookDetailView *)sender;
- (void)bookDetailViewDelegateBuyBook:(LFBookDetailView *)sender;
- (void)bookDetailViewDelegateAddLibrary:(LFBookDetailView *)sender;
@end
@interface LFBookDetailView : UIView
@property (nonatomic,strong) LFBookList *booklist;
@property (nonatomic,weak) id<LFBookDetailViewDelegate> delegate;
+ (LFBookDetailView *)show;
@end
