//
//  yiquxiaoModel.h
//  UniversalApp
//
//  Created by  apple on 2017/12/21.
//  Copyright © 2017年 徐阳. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface yiquxiaoModel : NSObject
@property (assign ,nonatomic) NSInteger myOrderId;//订单id
@property (strong ,nonatomic) NSString *headPicAdd; //头像
@property (strong ,nonatomic) NSString *workTotal;  //工作标题
@property (strong ,nonatomic) NSString *issueTm;   //发布时间
@property (assign ,nonatomic) double   pay;        //薪资
@property (strong ,nonatomic) NSString *payUnit;  //薪资单位
@property (strong ,nonatomic) NSString *startTm;  //开始时间
@property (strong ,nonatomic) NSString *minuteAdd; //地点
@property (strong ,nonatomic) NSString *orderState; //状态
@property (assign ,nonatomic) NSInteger woekDuration;//工作时长
@property (strong ,nonatomic) NSString *workType; //工种

+ (instancetype)creatRankingTotalModelWith:(NSDictionary *)dict;
@end
