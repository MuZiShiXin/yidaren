//
//  RegistrationViewController.h
//  YiShopkeeper
//
//  Created by  apple on 2017/11/21.
//  Copyright © 2017年 程序员. All rights reserved.
//

#import "RootViewController.h"
typedef void (^RegistrationBlock)(NSString *,NSString *);
@interface RegistrationViewController : RootViewController<UITextFieldDelegate>
@property (nonatomic ,strong) RegistrationBlock block;


@end
