//
//  ShareManager.h
//  MiAiApp
//
//  Created by  apple on 2017/6/1.
// //  Created by  apple on 2017/11/30.
//  Copyright © 2017年 程序员. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 分享 相关服务
 */
@interface ShareManager : NSObject

//单例
SINGLETON_FOR_HEADER(ShareManager)


/**
 展示分享页面
 */
-(void)showShareView;
@end
