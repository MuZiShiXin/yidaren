//
//  GameInfo.h
//  MiAiApp
//
//  Created by  apple on 2017/5/31.
// //  Created by  apple on 2017/11/30.
//  Copyright © 2017年 程序员. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GameInfo : NSObject

@property(nonatomic,assign) long long gold_coin;//金币数
@property(nonatomic,assign) long long flow;//流量币
@property(nonatomic,assign) long long growth_value;//成长值
@property (nonatomic,assign) NSInteger  level;//用户等级
@property(nonatomic,assign) long long cash;//现金

@end
