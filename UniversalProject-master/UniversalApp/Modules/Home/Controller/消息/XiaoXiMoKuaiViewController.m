//
//  XiaoXiMoKuaiViewController.m
//  UniversalApp
//
//  Created by  apple on 2017/12/12.
// //  Created by  apple on 2017/11/30.
//  Copyright © 2017年 程序员. All rights reserved.
//

#import "XiaoXiMoKuaiViewController.h"
#import "gongdanxiaoxixiangqingViewController.h"
#import "howlookmeViewController.h"
#import "xitongxiaoxiSViewController.h"
#import "yonggongxiaoxisViewController.h"
#import "yonggongqiyeliuyansViewController.h"

@interface XiaoXiMoKuaiViewController ()

@end

@implementation XiaoXiMoKuaiViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"消息";
    self.view.backgroundColor = [UIColor hx_colorWithHexRGBAString:kBeijingColor];
    
}

- (IBAction)gongdanxiapxisBtn {
    DLog(@"点击工单消息");
    gongdanxiaoxixiangqingViewController *gongdanxiaoxixiangqingVC = [[gongdanxiaoxixiangqingViewController alloc]init];
    [self.navigationController pushViewController:gongdanxiaoxixiangqingVC animated:YES];
    
}
- (IBAction)yonggongxiaoxisBtn {
    DLog(@"点击用工消息");
    yonggongxiaoxisViewController *yonggongxiaoxisVC = [[yonggongxiaoxisViewController alloc]init];
    [self.navigationController pushViewController:yonggongxiaoxisVC animated:YES];
}
- (IBAction)xitongxiaoxisBtn {
    DLog(@"点击系统消息");
    xitongxiaoxiSViewController *xitongxiaoxiSVC = [[xitongxiaoxiSViewController alloc]init];
    [self.navigationController pushViewController:xitongxiaoxiSVC animated:YES];

}
- (IBAction)qiyeliuyansBtn {
    DLog(@"点击企业留言");
    yonggongqiyeliuyansViewController *yonggongqiyeliuyansVC = [[yonggongqiyeliuyansViewController alloc]init];
    [self.navigationController pushViewController:yonggongqiyeliuyansVC animated:YES];
}
- (IBAction)shuikanlewosBtn {
    DLog(@"点击谁看了我");
    howlookmeViewController *howlookmeVC = [[howlookmeViewController alloc]init];
    [self.navigationController pushViewController:howlookmeVC animated:YES];


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
