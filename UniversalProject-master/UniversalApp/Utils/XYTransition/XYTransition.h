//
//  XYTransition.h
//  UniversalApp
//
//  Created by  apple on 2017/6/30.
// //  Created by  apple on 2017/11/30.
//  Copyright © 2017年 程序员. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XYTransition : NSObject<UIViewControllerAnimatedTransitioning>

@property(nonatomic,assign) BOOL isPush;//是否是push，反之则是pop

@property (nonatomic, assign) NSTimeInterval animationDuration;//动画时长

@end
