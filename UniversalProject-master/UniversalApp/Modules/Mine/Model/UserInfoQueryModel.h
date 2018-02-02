//
//  UserInfoQueryModel.h
//  YiShopkeeper
//
//  Created by  apple on 2017/12/24.
//  Copyright © 2017年 程序员. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserInfoQueryModel : NSObject
@property (nonatomic ,assign) NSInteger userInfoId;// 用户Id
@property (nonatomic ,strong) NSString  *headPicAdd;//头像
@property (nonatomic ,strong) NSString  *nick;//昵称
@property (nonatomic ,strong) NSString  *gender;//性别（男女）
@property (nonatomic ,strong) NSString  *workType;//工种
@property (nonatomic ,strong) NSString  *picAdd;//照片
@property (nonatomic ,strong) NSString  *idNum;//身份证号
@property (nonatomic ,strong) NSString  *idPicAdd;//身份证照片
@property (nonatomic ,strong) NSString  *idPicInfo;//身份证信息
@property (nonatomic ,strong) NSArray   *skillPics;//技能照片
@property (nonatomic ,strong) NSString  *socialCredit;//社会信
@property (nonatomic ,strong) NSString  *skill;
+ (instancetype)creatRankingTotalModelWith:(NSDictionary *)dict;

@end
