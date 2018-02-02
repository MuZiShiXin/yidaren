//
//  darendingdanxiangqingModel.m
//  UniversalApp
//
//  Created by  apple on 2017/12/21.
//  Copyright © 2017年 徐阳. All rights reserved.
//

#import "darendingdanxiangqingModel.h"

@implementation darendingdanxiangqingModel

- (instancetype)initWithDict:(NSDictionary *)dict {
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+ (instancetype)creatRankingTotalModelWith:(NSDictionary *)dict {
    darendingdanxiangqingModel *model = [[self alloc] initWithDict:dict];
    return model;
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    
}

@end
