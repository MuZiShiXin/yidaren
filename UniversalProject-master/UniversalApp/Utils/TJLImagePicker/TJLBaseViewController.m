//
//  TJLBaseViewController.m
//  Pods
//
//  Created by TongJialin on 16/7/31.
//
//

#import "TJLBaseViewController.h"

@interface TJLBaseViewController ()

@end

@implementation TJLBaseViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    [self setNavigationBarStatus];
    
//    UIBarButtonItem *backbutton = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:self action:nil];
//    self.navigationItem.backBarButtonItem = backbutton;
}

- (void)setNavigationBarStatus {
    UINavigationBar *ngBar = [UINavigationBar appearance];
    
    [ngBar setBarTintColor:CNavBgColor];
    [ngBar setTintColor:CNavBgFontColor];
    [ngBar setTitleTextAttributes:@{NSForegroundColorAttributeName :CNavBgFontColor, NSFontAttributeName : [UIFont systemFontOfSize:18]}];
    
    [ngBar setBackgroundImage:[UIImage imageWithColor:CNavBgColor] forBarPosition:UIBarPositionAny barMetrics:UIBarMetricsDefault];
    [ngBar setShadowImage:[UIImage new]];//去掉阴影线
    
    ngBar.topItem.title = @"";
//    [ngBar setShadowImage:[OMAUtil imageWithColor:OMACOLOR_THEME_ORANGE]];
}

- (void)setupTitle:(NSString *)title {
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 140, 44.0)];
    label.font = [UIFont boldSystemFontOfSize:18];
    label.textColor = CNavBgFontColor;
    label.backgroundColor = [UIColor clearColor];
    label.textAlignment = NSTextAlignmentCenter;
    label.text = title;
    
    self.navigationItem.titleView = label;
}




@end
