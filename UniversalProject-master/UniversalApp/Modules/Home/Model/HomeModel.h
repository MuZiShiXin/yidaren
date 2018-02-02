//
//  HomeModel.h
//  UniversalApp
//
//  Created by  apple on 2017/12/19.
//  Copyright © 2017年 徐阳. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HomeModel : NSObject
@property (assign ,nonatomic) NSInteger  userInfoId;
@property (assign ,nonatomic) NSInteger  recruitInfoId;
@property (strong ,nonatomic) NSString   *headPicAdd;
@property (strong ,nonatomic) NSString   *workTotal;
@property (assign ,nonatomic) NSInteger  sussOrderNumber;
@property (assign ,nonatomic) NSUInteger evaluateCore;
@property (strong ,nonatomic) NSString   *startTm;
@property (assign ,nonatomic) NSInteger  woekDuration;
@property (strong ,nonatomic) NSString   *workType;
@property (assign ,nonatomic) NSInteger  recruitNum;
@property (assign ,nonatomic) NSInteger  lastPeoNum;
@property (assign ,nonatomic) CGFloat    pay;
@property (strong ,nonatomic) NSString   *payUnit;
@property (assign ,nonatomic) NSInteger  workNum;
@property (assign ,nonatomic) CGFloat    x;
@property (assign ,nonatomic) CGFloat    y;
@property (assign ,nonatomic) CGFloat    distance;
@property (assign ,nonatomic) double     evaluateCorexx;
@property (strong ,nonatomic) NSString   *minuteAdd;



+ (instancetype)creatRankingTotalModelWith:(NSDictionary *)dict;

@end
