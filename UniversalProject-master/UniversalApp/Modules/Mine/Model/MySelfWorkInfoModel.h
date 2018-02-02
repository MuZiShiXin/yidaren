//
//  MySelfWorkInfoModel.h
//  UniversalApp
//
//  Created by  apple on 2017/12/22.
//  Copyright © 2017年 徐阳. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MySelfWorkInfoModel : NSObject
@property (nonatomic ,assign) NSUInteger userInfoId;
@property (nonatomic ,strong) NSString   *headPicAdd;
@property (nonatomic ,strong) NSString   *nick;
@property (nonatomic ,assign) NSInteger  todayWorkTime;
@property (nonatomic ,strong) NSString   *workLong;
@property (nonatomic ,assign) NSInteger  successOrderNum;
+ (instancetype)creatRankingTotalModelWith:(NSDictionary *)dict;
@end
