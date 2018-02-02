//
//  MainTabBarController.m
//  MiAiApp
//
//  Created by  apple on 2017/5/18.
// //  Created by  apple on 2017/11/30.
//  Copyright © 2017年 程序员. All rights reserved.
//

#import "MainTabBarController.h"

#import "RootNavigationController.h"
#import "PersonListViewController.h"
#import "HomeViewController.h"
#import "MsgViewController.h"
#import "MinesViewController.h"
#import "ToolDemoViewController.h"
#import "DraggingCardViewController.h"
#import "UITabBar+CustomBadge.h"
#import "MyOrderViewController.h"
#import "MyWalletViewController.h"

#import "XYTabBar.h"

@interface MainTabBarController ()<UITabBarControllerDelegate>

@property (nonatomic,strong) NSMutableArray * VCS;//tabbar root VC

@end

@implementation MainTabBarController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.delegate = self;
    //初始化tabbar
    [self setUpTabBar];
    //添加子控制器
    [self setUpAllChildViewController];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}


#pragma mark ————— 初始化TabBar —————
-(void)setUpTabBar{
    //设置背景色 去掉分割线
    [self setValue:[XYTabBar new] forKey:@"tabBar"];
    [self.tabBar setBackgroundColor:[UIColor whiteColor]];
    [self.tabBar setBackgroundImage:[UIImage new]];
    //通过这两个参数来调整badge位置
    //    [self.tabBar setTabIconWidth:29];
    //    [self.tabBar setBadgeTop:9];
}

#pragma mark - ——————— 初始化VC ————————
-(void)setUpAllChildViewController{
    _VCS = @[].mutableCopy;
    HomeViewController *homeVC = [[HomeViewController alloc]init];
//    WaterFallListViewController *homeVC = [WaterFallListViewController new];
//    PersonListViewController *homeVC = [[PersonListViewController alloc]init];
    [self setupChildViewController:homeVC title:@"首页" imageName:@"ygdr_sy_dbl_tb5" seleceImageName:@"ygdr_sy_dbl_tb1"];
    
//    MakeFriendsViewController *makeFriendVC = [[MakeFriendsViewController alloc]init];
//    ToolDemoViewController *makeFriendVC = [[ToolDemoViewController alloc]init];
    MyOrderViewController *makeFriendVC = [[MyOrderViewController alloc]init];
    
    [self setupChildViewController:makeFriendVC title:@"订单" imageName:@"ygdr_sy_dbl_tb6" seleceImageName:@"ygdr_sy_dbl_tb2"];
    
//    MsgViewController *msgVC = [[MsgViewController alloc]init];
//    DraggingCardViewController *msgVC = [DraggingCardViewController new];
    MyWalletViewController *msgVC = [MyWalletViewController new];
    
    
    [self setupChildViewController:msgVC title:@"钱包" imageName:@"ygdr_sy_dbl_tb7" seleceImageName:@"ygdr_sy_dbl_tb3"];
    
    
    MinesViewController *mineVC = [[MinesViewController alloc]init];
    [self setupChildViewController:mineVC title:@"我的" imageName:@"ygdr_sy_dbl_tb8" seleceImageName:@"ygdr_sy_dbl_tb4"];
    
    self.viewControllers = _VCS;
}

-(void)setupChildViewController:(UIViewController*)controller title:(NSString *)title imageName:(NSString *)imageName seleceImageName:(NSString *)selectImageName{
    controller.title = title;
    controller.tabBarItem.title = title;//跟上面一样效果
    controller.tabBarItem.image = [[UIImage imageNamed:imageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    controller.tabBarItem.selectedImage = [[UIImage imageNamed:selectImageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    //未选中字体颜色
    [controller.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:KBlackColor,NSFontAttributeName:SYSTEMFONT(10.0f)} forState:UIControlStateNormal];
    
    //选中字体颜色
    [controller.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor hx_colorWithHexRGBAString:kBlueColor],NSFontAttributeName:SYSTEMFONT(10.0f)} forState:UIControlStateSelected];
    //包装导航控制器
    RootNavigationController *nav = [[RootNavigationController alloc]initWithRootViewController:controller];
    
//    [self addChildViewController:nav];
    [_VCS addObject:nav];
    
}


-(void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController{
    //    NSLog(@"选中 %ld",tabBarController.selectedIndex);
    
}

-(void)setRedDotWithIndex:(NSInteger)index isShow:(BOOL)isShow{
    if (isShow) {
        [self.tabBar setBadgeStyle:kCustomBadgeStyleRedDot value:0 atIndex:index];
    }else{
        [self.tabBar setBadgeStyle:kCustomBadgeStyleNone value:0 atIndex:index];
    }
    
}

- (BOOL)shouldAutorotate {
    return [self.selectedViewController shouldAutorotate];
}
- (UIInterfaceOrientationMask)supportedInterfaceOrientations{
    return [self.selectedViewController supportedInterfaceOrientations];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
