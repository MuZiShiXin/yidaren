//  账户安全
//  AccountSecurityViewController.m
//  YiShopkeeper
//
//  Created by  apple on 2017/11/27.
//  Copyright © 2017年 程序员. All rights reserved.
//

#import "AccountSecurityViewController.h"
#import "ModifyYourPhoneNumberViewController.h"
#import "ChangeMyPasswordViewController.h"
@interface AccountSecurityViewController ()

@end

@implementation AccountSecurityViewController

- (BOOL)isHideBackButton
{
    return NO;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"账户安全";
    self.view.backgroundColor = [UIColor hx_colorWithHexRGBAString:kBeijingColor];
    NSString *qiansanwei = [userManager.curUserInfo.userName substringToIndex:3];
    NSString *housiwei = [userManager.curUserInfo.userName substringFromIndex:7];
    self.shoujihao.text = [NSString stringWithFormat:@"%@****%@",qiansanwei,housiwei];
}

#pragma mark 修改手机号
- (IBAction)xiugaishoujihao {
    NSLog(@"修改手机号");
    ModifyYourPhoneNumberViewController *ModifyYourPhoneNumberVC = [[ModifyYourPhoneNumberViewController alloc]init];
    [self.navigationController pushViewController:ModifyYourPhoneNumberVC animated:YES];
}
#pragma mark 修改密码
- (IBAction)xiugaimima {
    NSLog(@"修改密码");
    ChangeMyPasswordViewController *ChangeMyPasswordVC = [[ChangeMyPasswordViewController alloc]init];
    [self.navigationController pushViewController:ChangeMyPasswordVC animated:YES];
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
