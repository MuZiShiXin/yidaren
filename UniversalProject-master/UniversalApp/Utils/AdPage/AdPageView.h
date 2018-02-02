//
//  AdPageView.h
//  MiAiApp
//
//  Created by  apple on 2017/5/22.
// //  Created by  apple on 2017/11/30.
//  Copyright © 2017年 程序员. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 启动广告页面
 */

static NSString *const adImageName = @"adImageName";
static NSString *const adUrl = @"adUrl";

typedef void(^TapBlock)();

@interface AdPageView : UIView

- (instancetype)initWithFrame:(CGRect)frame withTapBlock:(TapBlock)tapBlock;

/** 显示广告页面方法*/
- (void)show;

/** 图片路径*/
@property (nonatomic, copy) NSString *filePath;

@end
