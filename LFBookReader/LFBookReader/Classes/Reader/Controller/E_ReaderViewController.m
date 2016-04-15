//
//  E_ReaderViewController.m
//  E_Reader
//
//  Created by 阿虎 on 14-8-8.
//  Copyright (c) 2014年 tiger. All rights reserved.
//

#import "E_ReaderViewController.h"
#import "E_ReaderView.h"
#import "E_CommonManager.h"
#import "LFNotationViewController.h"

#define MAX_FONT_SIZE 27
#define MIN_FONT_SIZE 17

@interface E_ReaderViewController ()<E_ReaderViewDelegate>
{
    E_ReaderView *_readerView;
}

@end

@implementation E_ReaderViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    _readerView = [[E_ReaderView alloc] initWithFrame:CGRectMake(offSet_x, offSet_y, self.view.frame.size.width - 2 * offSet_x, self.view.frame.size.height - offSet_y - 20)];
    _readerView.keyWord = _keyWord;
    _readerView.magnifiterImage = _themeBgImage;
    _readerView.delegate = self;
    [self.view addSubview:_readerView];
    
}

#pragma mark - ReaderViewDelegate
- (void)shutOffGesture:(BOOL)yesOrNo{
    
    if ([_delegate respondsToSelector:@selector(shutOffPageViewControllerGesture:)]) {
        
       
        [_delegate shutOffPageViewControllerGesture:yesOrNo];
    }
}

- (void)ciBa:(NSString *)ciBaString{
    if ([_delegate respondsToSelector:@selector(ciBaWithString:)]) {
        
        [_delegate ciBaWithString:ciBaString];
    }
    
}

- (void)shareDidDidSeletedReaderView:(E_ReaderView *)ReaderView{

}

- (void)notationDidSeletedString:(NSString *)text ReaderView:(E_ReaderView *)ReaderView{

    LFNotationViewController *notationVc = [[LFNotationViewController alloc] init];
    notationVc.Content = text;
    LFNavigationController *nav = [[LFNavigationController alloc] initWithRootViewController:notationVc];
    [self presentViewController:nav animated:YES completion:nil];
    
}
- (void)hideSettingToolBar{
    if ([_delegate respondsToSelector:@selector(hideTheSettingBar)]) {
        
        [_delegate hideTheSettingBar];
    }
}

- (void)setFont:(NSUInteger )font_
{
    _readerView.font = font_;
}

- (void)setText:(NSString *)text
{
    _text = text;
    _readerView.text = text;
   
    [_readerView render];
}

- (NSUInteger )font
{
    return _readerView.font;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (CGSize)readerTextSize
{
    return _readerView.bounds.size;
}
@end
