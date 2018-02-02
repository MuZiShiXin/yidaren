//
//  quxiaogongzuoViewController.m
//  UniversalApp
//
//  Created by  apple on 2017/12/13.
// //  Created by  apple on 2017/11/30.
//  Copyright © 2017年 程序员. All rights reserved.
//

#import "quxiaogongzuoViewController.h"
#import "PlaceholderTextView.h"
@interface quxiaogongzuoViewController ()

@end

@implementation quxiaogongzuoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    PlaceholderTextView *contentContactInformationTextView = [[PlaceholderTextView alloc]initWithFrame:CGRectMake(15, 0, kScreenWidth-30, 230)];
    contentContactInformationTextView.backgroundColor = [UIColor hx_colorWithHexRGBAString:@"f8f8f8"];
    contentContactInformationTextView.placeholderLabel.font = [UIFont systemFontOfSize:13];
    contentContactInformationTextView.placeholder = @"输入内容...";
    contentContactInformationTextView.font = [UIFont systemFontOfSize:13];
    contentContactInformationTextView.maxLength = 200;
    [self.view addSubview:contentContactInformationTextView];
    
    [contentContactInformationTextView didChangeText:^(PlaceholderTextView *textView) {
        NSLog(@"%@",textView.text);
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
