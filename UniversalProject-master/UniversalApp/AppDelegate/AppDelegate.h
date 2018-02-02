//
//  AppDelegate.h
//  MiAiApp
//
//  Created by  apple on 2017/11/30.
//  Copyright © 2017年 程序员. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainTabBarController.h"
#import <RongIMLib/RongIMLib.h>
#import <RongIMKit/RongIMKit.h>
#import <BaiduMapAPI_Map/BMKMapComponent.h>

/**
 这里面只做调用，具体实现放到 AppDelegate+AppService 或者Manager里面，防止代码过多不清晰
 */

static NSString *appKey = @"b3bdf3c4ebf1e0fa66d9aacd";
static NSString *channel = @"Publish channel";
static BOOL isProduction = FALSE;

@interface AppDelegate : UIResponder <UIApplicationDelegate ,RCIMConnectionStatusDelegate>
{
    BMKMapManager* _mapManager;

}
@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) MainTabBarController *mainTabBar;

@end

