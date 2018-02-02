//
//  mydingdanpingjiaViewController.m
//  UniversalApp
//
//  Created by  apple on 2017/12/13.
// //  Created by  apple on 2017/11/30.
//  Copyright © 2017年 程序员. All rights reserved.
//

#import "mydingdanpingjiaViewController.h"
#import "XHStarView.h"
#include "PlaceholderTextView.h"

@interface mydingdanpingjiaViewController ()
@property (nonatomic, strong) XHStarView *starView1;

@end

@implementation mydingdanpingjiaViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    _fabiaopingjiaBtn.layer.borderColor = [[UIColor hx_colorWithHexRGBAString:@"f56e74"] CGColor];
    //设置边框宽度
    _fabiaopingjiaBtn.layer.borderWidth = 0.50f;
    //给按钮设置角的弧度
    _fabiaopingjiaBtn.layer.cornerRadius = 4.0f;
    //设置背景颜色
    _fabiaopingjiaBtn.layer.masksToBounds = YES;
    
    self.starView1 = [[XHStarView alloc]initWithFrame:CGRectMake(kScreenWidth-160, 7.5, 160, 30)];
    [self.starView1 alterproperty:^(NSInteger star) {
        //        label.text = [NSString stringWithFormat:@"%ld/100",star];
        //        self.score = star;
    }];
    [self.starView1 startStar:self.score];
    [self.Views1 addSubview:self.starView1];
    
    
    PlaceholderTextView *contentContactInformationTextView = [[PlaceholderTextView alloc]initWithFrame:CGRectMake(15, 0, kScreenWidth-30, 100)];
    contentContactInformationTextView.backgroundColor = [UIColor hx_colorWithHexRGBAString:@"f8f8f8"];
    contentContactInformationTextView.placeholderLabel.font = [UIFont systemFontOfSize:13];
    contentContactInformationTextView.placeholder = @"请输入评价内容，不超过200字";
    contentContactInformationTextView.font = [UIFont systemFontOfSize:13];
    contentContactInformationTextView.maxLength = 200;
    [self.Views2 addSubview:contentContactInformationTextView];
    
    [contentContactInformationTextView didChangeText:^(PlaceholderTextView *textView) {
        NSLog(@"%@",textView.text);
    }];
    
}

- (IBAction)babiaopingjiasBtn {
    DLog(@"发表评价");
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
