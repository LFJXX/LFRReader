//
//  LFBookDetailViewController.m
//  LFBookReader
//
//  Created by apple on 16/4/14.
//  Copyright © 2016年 xyb100. All rights reserved.
//

#import "LFBookDetailInfoViewController.h"

@interface LFBookDetailInfoViewController ()


@end

@implementation LFBookDetailInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self loadNewData];
}

- (void)loadNewData{

    LFStatParams *stat = _bookList.stat_params;
    [LFHttpTool GET:[NSString stringWithFormat:@"http://android.reader.qq.com/v5_8/nativepage/book/detail?bid=726399&pagestamp=1&alg=%@&data_type=%zd&origin=%@",stat.alg,stat.data_type,stat.origin] parameters:nil success:^(id response) {
        NSInteger code = [response[@"httpcode"] integerValue];
        if (code == 200) {
            
         
        }
    } failure:^(NSError *error) {
        
    }];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
