//
//  HeaderModel.m
//  MiAiApp
//
//  Created by  apple on 2017/5/23.
// //  Created by  apple on 2017/11/30.
//  Copyright © 2017年 程序员. All rights reserved.
//

#import "HeaderModel.h"

@implementation HeaderModel

-(instancetype)init{
    self = [super init];
    if (self) {
//        self.userid = userManager.curUserInfo.userid;
        self.imei = [OpenUDID value].length>32 ? [[OpenUDID value] substringToIndex:32] :[OpenUDID value];
        self.os_type = 2;
        self.version = kApplication.appVersion;
        self.channel = @"App Store";
        self.clientId = self.imei;//[OpenUDID value].length>32 ? [[OpenUDID value] substringToIndex:32] :[OpenUDID value];
        self.versioncode = KVersionCode;
        self.mobile_model = [UIDevice currentDevice].machineModelName;
        self.mobile_brand = [UIDevice currentDevice].machineModel;
    }
    return self;
}
@end
