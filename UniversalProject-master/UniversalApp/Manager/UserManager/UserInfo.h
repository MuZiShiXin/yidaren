//
//  UserInfo.h
//  MiAiApp
//
//  Created by  apple on 2017/5/23.
// //  Created by  apple on 2017/11/30.
//  Copyright © 2017年 程序员. All rights reserved.
//

#import <Foundation/Foundation.h>
@class GameInfo;

typedef NS_ENUM(NSInteger,UserGender){
    UserGenderUnKnow = 0,
    UserGenderMale, //男
    UserGenderFemale //女
};

@interface UserInfo : NSObject

//@property(nonatomic,assign)long long userid;//用户ID
//@property (nonatomic,copy) NSString * idcard;//展示用的用户ID
//@property (nonatomic,copy) NSString * photo;//头像
//@property (nonatomic,copy) NSString * nickname;//昵称
//@property (nonatomic, assign) UserGender sex;//性别
//@property (nonatomic,copy) NSString * imId;//IM账号
//@property (nonatomic,copy) NSString * imPass;//IM密码
//@property (nonatomic,assign) NSInteger  degreeId;//用户等级
//@property (nonatomic,copy) NSString * signature;//个性签名
//@property (nonatomic,copy) NSString * token;//用户登录后分配的登录Token
//@property (nonatomic, strong) GameInfo *info;//游戏数据

@property (assign, nonatomic) NSInteger userInfoId;
@property (strong, nonatomic) NSString *headPicAdd;
@property (strong, nonatomic) NSString *nick;
@property (strong, nonatomic) NSString *socialCredit;
@property (strong, nonatomic) NSString *picAdd;
@property (strong, nonatomic) NSString *firmIntro;
@property (strong, nonatomic) NSString *gender;
@property (strong, nonatomic) NSString *idNum;
@property (strong, nonatomic) NSString *idPicAdd;
@property (strong, nonatomic) NSString *workType;
@property (strong, nonatomic) NSString *skill;
@property (strong, nonatomic) NSString *skillPicAdd;
@property (strong, nonatomic) NSString *userName;
@property (strong, nonatomic) NSString *userPassword;
@property (assign, nonatomic) double   accountBalance;
@property (assign, nonatomic) NSInteger sussOrderNumber;
@property (strong, nonatomic) NSString *evaluateCore;
@property (strong, nonatomic) NSString *userType;
@property (strong, nonatomic) NSString *checkState;
@property (strong, nonatomic) NSString *clientType;
@property (strong, nonatomic) NSString *clientVersion;
@property (assign, nonatomic) NSInteger workYear;
@property (assign, nonatomic) NSInteger wanShanXinXi;
@property (assign, nonatomic) NSInteger zhuXiao;
@property (assign, nonatomic) NSDictionary *params;



@end
