//
//  HomeModel.m
//  UniversalApp
//
//  Created by  apple on 2017/12/19.
//  Copyright © 2017年 徐阳. All rights reserved.
//

#import "HomeModel.h"

@implementation HomeModel

- (instancetype)initWithDict:(NSDictionary *)dict {
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+ (instancetype)creatRankingTotalModelWith:(NSDictionary *)dict {
    HomeModel *model = [[self alloc] initWithDict:dict];
    return model;
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    
}
@end
