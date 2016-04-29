//
//  LFPickView.m
//  pick
//
//  Created by apple on 16/4/29.
//  Copyright © 2016年 xyb100. All rights reserved.
//

#import "LFPickView.h"

@interface LFPickView ()<UIPickerViewDataSource,UIPickerViewDelegate>
@property (weak, nonatomic) IBOutlet UIView *backView;
@property (weak, nonatomic) IBOutlet UIView *contentView;
@property (weak, nonatomic) IBOutlet UIPickerView *pickView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *contentHeight;

@end

@implementation LFPickView

- (instancetype)init{

    if (self = [super init]) {
        self = [[NSBundle mainBundle] loadNibNamed:@"LFPickView" owner:nil options:nil].firstObject;
        self.frame = [UIScreen mainScreen].bounds;
        self.backgroundColor = [UIColor clearColor];
        self.pickView.delegate = self;
        self.pickView.dataSource = self;
        self.translatesAutoresizingMaskIntoConstraints = YES;
    }
    return self;
}
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{

    return 1;
}
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{

    return self.dataSourse.count;
}
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    
    LFPickValue *value = [self.dataSourse objectAtIndex:row];
    return value.title;

}

- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component{

    return 40;
}
- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view{
    UILabel* pickerLabel = (UILabel*)view;
    if (!pickerLabel){
        pickerLabel = [[UILabel alloc] init];
        pickerLabel.minimumScaleFactor = 8.0;
        pickerLabel.adjustsFontSizeToFitWidth = YES;
        [pickerLabel setTextAlignment:NSTextAlignmentCenter];
        [pickerLabel setBackgroundColor:LFLightBlueColor];
        [pickerLabel setFont:[UIFont boldSystemFontOfSize:18]];
        
    }

    pickerLabel.text = [self pickerView:pickerView titleForRow:row forComponent:component];
    return pickerLabel;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{

    
}

#pragma  mark - function

- (void)show{
    UIWindow *win = [[UIApplication sharedApplication] keyWindow];
    UIView *topView = [win.subviews firstObject];
    [topView addSubview:self];
    
    [UIView animateWithDuration:0.3 animations:^{
        self.alpha = 1;
        self.contentHeight.constant = 250;
        [self layoutIfNeeded];
    }];
}

- (void)hide{
    [UIView animateWithDuration:0.3 animations:^{
        self.alpha = 0;
//        self.contentHeight.constant = 0;
        [self layoutIfNeeded];
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}

- (IBAction)cancleClick:(UIButton *)sender {
     [self hide];
    
}
- (IBAction)configClick:(UIButton *)sender {
   LFPickValue *value = [self.dataSourse objectAtIndex:[self.pickView selectedRowInComponent:0]];
  
    if ([self.delegate respondsToSelector:@selector(pickViewDidSeleted:)]) {
        [self.delegate pickViewDidSeleted:value];
    }
    [self hide];
}



@end
