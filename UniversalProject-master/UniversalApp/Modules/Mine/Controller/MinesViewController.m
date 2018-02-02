//
//  MinesViewController.m
//  UniversalApp
//
//  Created by  apple on 2017/12/13.
//  Copyright © 2017年 徐阳. All rights reserved.
//

#import "MinesViewController.h"
#import "gerenxinxiViewController.h"
#import "XiaoXiMoKuaiViewController.h"
#import "MyWalletViewController.h"
#import "MyOrderViewController.h"
#import "AccountSecurityViewController.h"
#import "AboutUsViewController.h"
#import "MySelfWorkInfoModel.h"
#import "ChatListViewController.h"
#import <RongIMKit/RCConversationViewController.h>
#import <UShareUI/UShareUI.h>
@interface MinesViewController ()
@property (strong, nonatomic) IBOutlet UIButton *touxiangImageViewButton;
@property (strong, nonatomic) IBOutlet UILabel *mingziLabel;
@property (strong, nonatomic) IBOutlet UILabel *leijitianshu;
@property (strong, nonatomic) IBOutlet UILabel *gongzuoguoLabel;
@property (strong, nonatomic) IBOutlet UILabel *benrigongzuoTimeLabel;
@property (strong, nonatomic) IBOutlet UIButton *kaigongzhuangtaiButton;
@property (strong, nonatomic) IBOutlet UIImageView *HeadImageView;



@end

@implementation MinesViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self httpRequest];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.isHidenNaviBar = YES;
    self.StatusBarStyle = UIStatusBarStyleLightContent;
    self.isShowLiftBack = NO;//每个根视图需要设置该属性为NO，否则会出现导航栏异常
    //给按钮设置角的弧度
    
    _HeadImageView.layer.cornerRadius = _HeadImageView.frame.size.height/2;
    //设置背景颜色
    _HeadImageView.layer.masksToBounds = YES;
    _kaigongzhuangtaiButton.selected = YES;
}

- (void)httpRequest
{
    NSString *urlStr = [NSString stringWithFormat:@"%@/Expert/MySelfInfo/findMySelfWorkInfo",kPRTURL];
    
    NSDictionary *parameters = [NSDictionary dictionaryWithObjectsAndKeys:@(userManager.curUserInfo.userInfoId),@"userInfoId", nil];
    
    [BaseHttpTool POST:urlStr params:parameters success:^(id  _Nullable responseObj) {
        NSInteger result = [[responseObj valueForKey:@"result"] intValue];
        NSDictionary *resultDic = [responseObj objectForKeyWithNullDetection:@"data"];
        if (result == 1) {
            MySelfWorkInfoModel *mode = [MySelfWorkInfoModel creatRankingTotalModelWith:resultDic];
            [self shuaxingView:mode];
        }
    } failure:^(NSError * _Nullable error) {
        NSLog(@"loginError:%@",error);
        
    }];
}



- (void)shuaxingView:(MySelfWorkInfoModel *)model
{
//    [_touxiangImageViewButton setBackgroundImageWithURL:[NSURL URLWithString:model.headPicAdd] forState:UIControlStateNormal placeholder:[UIImage imageNamed:@"yg_sy_nr_tp1"]];
    [_HeadImageView sd_setImageWithURL:[NSURL URLWithString:model.headPicAdd] placeholderImage:[UIImage imageNamed:@"yg_sy_nr_tp3"]];
    [_mingziLabel setText:model.nick];
    [_benrigongzuoTimeLabel setText:[NSString stringWithFormat:@"%ld小时",model.todayWorkTime]];
    [_leijitianshu setText:model.workLong];
    [_gongzuoguoLabel setText:[NSString stringWithFormat:@"%ld家",model.successOrderNum]];
}





- (IBAction)touxiangdianjiButton {
    DLog(@"头像点击");
    gerenxinxiViewController *gerenxinxiVC = [[gerenxinxiViewController alloc]init];
    [self.navigationController pushViewController:gerenxinxiVC animated:YES];
}


- (IBAction)shifoukaigongzhuangtaiButton {
    DLog(@"开关状态");
    if (_kaigongzhuangtaiButton.selected) {
        [_kaigongzhuangtaiButton setImage:[UIImage imageNamed:@"yg_xx_nr_tb2"] forState:UIControlStateNormal];
        [self.view showRightWithTitle:@"关闭成功" autoCloseTime:2];
        _kaigongzhuangtaiButton.selected = NO;
    }else
    {
        [_kaigongzhuangtaiButton setImage:[UIImage imageNamed:@"yg_xx_nr_tb1"] forState:UIControlStateNormal];
        [self.view showRightWithTitle:@"开启成功" autoCloseTime:2];
        _kaigongzhuangtaiButton.selected = YES;
    }
}



- (IBAction)wodexiaoxiButton {
    DLog(@"我的消息");
    XiaoXiMoKuaiViewController *XiaoXiMoKuaiVC = [[XiaoXiMoKuaiViewController alloc]init];
    [self.navigationController pushViewController:XiaoXiMoKuaiVC animated:YES];
}

- (IBAction)wodezhanghuButton {
    DLog(@"我的账户");
    MyWalletViewController *MyWalletVC = [[MyWalletViewController alloc]init];
    [self.navigationController pushViewController:MyWalletVC animated:YES];
}

- (IBAction)wodegongdanButton {
    DLog(@"我的订单");
    MyOrderViewController *MyOrderVC = [[MyOrderViewController alloc]init];
    [self.navigationController pushViewController:MyOrderVC animated:YES];
}

- (IBAction)zhanghuanquanButton {
    DLog(@"账户安全");
    AccountSecurityViewController *AccountSecurityVC = [[AccountSecurityViewController alloc]init];
    [self.navigationController pushViewController:AccountSecurityVC animated:YES];
}

- (IBAction)guanyuwomenButton {
    DLog(@"关于我们");
    AboutUsViewController *AboutUsVC = [[AboutUsViewController alloc]init];
    [self.navigationController pushViewController:AboutUsVC animated:YES];
}

- (IBAction)lianxikefuButton {
    DLog(@"联系客服");
    NSString*token=@"Cy0jErlwtmgJ8rB3ZO1g7QQo6oi3mCmwtYGl2yIkpUNxCwMQPb8N4ZD36D0QEI0BE4offeXIacurRyug31N0OQ==";
    [[RCIM sharedRCIM] connectWithToken:token success:^(NSString *userId) {
        //设置用户信息提供者,页面展现的用户头像及昵称都会从此代理取
        [[RCIM sharedRCIM] setUserInfoDataSource:self];
        NSLog(@"Login successfully with userId: %@.", userId);
        dispatch_async(dispatch_get_main_queue(), ^{
            ChatListViewController *chatListViewController = [[ChatListViewController alloc]init];
            [self.navigationController pushViewController:chatListViewController animated:YES];
        });
        
    } error:^(RCConnectErrorCode status) {
        NSLog(@"login error status: %ld.", (long)status);
    } tokenIncorrect:^{
        NSLog(@"token 无效 ，请确保生成token 使用的appkey 和初始化时的appkey 一致");
    }];
}

/**
 *此方法中要提供给融云用户的信息，建议缓存到本地，然后改方法每次从您的缓存返回
 */
- (void)getUserInfoWithUserId:(NSString *)userId completion:(void(^)(RCUserInfo* userInfo))completion
{
    //此处为了演示写了一个用户信息
    if ([@"1" isEqual:userId]) {
        RCUserInfo *user = [[RCUserInfo alloc]init];
        user.userId = @"1";
        user.name = @"测试1";
        user.portraitUri = @"https://ss0.baidu.com/73t1bjeh1BF3odCf/it/u=1756054607,4047938258&fm=96&s=94D712D20AA1875519EB37BE0300C008";
        
        return completion(user);
    }else if([@"2" isEqual:userId]) {
        RCUserInfo *user = [[RCUserInfo alloc]init];
        user.userId = @"2";
        user.name = @"测试2";
        user.portraitUri = @"https://ss0.baidu.com/73t1bjeh1BF3odCf/it/u=1756054607,4047938258&fm=96&s=94D712D20AA1875519EB37BE0300C008";
        return completion(user);
    }
}




- (IBAction)fenxiangButton {
    DLog(@"分享");
    [UMSocialUIManager setPreDefinePlatforms:@[@(UMSocialPlatformType_Sina),@(UMSocialPlatformType_QQ),@(UMSocialPlatformType_Qzone),@(UMSocialPlatformType_WechatSession),@(UMSocialPlatformType_Sms),@(UMSocialPlatformType_Email)]];
    [UMSocialUIManager showShareMenuViewInWindowWithPlatformSelectionBlock:^(UMSocialPlatformType platformType, NSDictionary *userInfo) {
        // 根据获取的platformType确定所选平台进行下一步操作
        if (platformType == UMSocialPlatformType_WechatSession ||platformType == UMSocialPlatformType_WechatTimeLine) {
            [self shareToWeiXin:platformType];
        }else if (platformType == UMSocialPlatformType_Sina)
        {
            
        }else if (platformType == UMSocialPlatformType_Sms)
        {
            
        }else if (platformType == UMSocialPlatformType_Email)
        {
            
        }else if (platformType == UMSocialPlatformType_Qzone)
        {
            
        }else if (platformType == UMSocialPlatformType_QQ)
        {
            
        }else
        {
            
        }
        
    }];
    
    
    
}


- (void)shareToWeiXin:(UMSocialPlatformType) platformType
{
    //网页分享
    //创建分享消息对象
    UMSocialMessageObject *messageObject = [UMSocialMessageObject messageObject];
    //创建网页内容对象(带了图片)
    UMShareWebpageObject *shareObject = [UMShareWebpageObject shareObjectWithTitle:@"大倩倩的分享" descr:@"关于明天四点下班的通知" thumImage:[UIImage imageNamed:@"WebOfBanner_InvitationCode"]];
    //设置你要分享出去的网页地址
    shareObject.webpageUrl = @"http://www.baidu.com";
    //分享消息对象设置分享内容对象
    messageObject.shareObject = shareObject;
    //调用分享接口
    [[UMSocialManager defaultManager] shareToPlatform:platformType messageObject:messageObject currentViewController:self completion:^(id data, NSError *error)
     {
         if (error)
         {
             UMSocialLogInfo(@"************Share fail with error %@*********",error);
         }
         else
         {
             if ([data isKindOfClass:[UMSocialShareResponse class]])
             {
                 UMSocialShareResponse *resp = data;
                 //分享结果消息
                 UMSocialLogInfo(@"response message is %@",resp.message);
                 //第三方原始返回的数据
                 UMSocialLogInfo(@"response originalResponse data is %@",resp.originalResponse);
                 
             }
             else
             {
                 UMSocialLogInfo(@"response data is %@",data);
             }
         }
     }];
}

- (IBAction)tuichudengluButton {
    DLog(@"退出登录");
    [self AlertWithTitle:nil message:@"确定要退出吗？" andOthers:@[@"取消",@"确定"] animated:YES action:^(NSInteger index) {
        NSLog(@"%ld",index);
        if (index == 1) {
            [userManager logout:nil];
        }
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
