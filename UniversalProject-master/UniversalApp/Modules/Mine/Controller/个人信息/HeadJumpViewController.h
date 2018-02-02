//
//  HeadJumpViewController.h
//  YiShopkeeper
//
//  Created by  apple on 2017/11/28.
//  Copyright © 2017年 程序员. All rights reserved.
//

#import "RootViewController.h"
typedef void (^HeadJumpBlock)(UIImage *);
typedef void (^headJumpBlock)(NSArray*);

@interface HeadJumpViewController : RootViewController <UIActionSheetDelegate>
@property (nonatomic ,strong) NSString *geren;
@property (nonatomic ,strong) HeadJumpBlock block;
@property (nonatomic ,strong) headJumpBlock blocks;

@property (nonatomic ,strong) UIImage *Images;
@property (nonatomic ,strong) NSMutableArray *imageAryid;
@property (nonatomic ,strong) NSArray * imageAryS;
@end
