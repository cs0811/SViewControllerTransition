//
//  STransitionManager.h
//  SViewControllerTransition
//
//  Created by S on 15/12/18.
//  Copyright © 2015年 S. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, STransitionType) {
    STransitionTypePresent = 0  ,//管理present动画
    STransitionTypeDismiss      ,//管理dismiss动画
    STransitionTypePush         ,
    STransitionTypePop          ,
};

@interface STransitionManager : NSObject <UIViewControllerAnimatedTransitioning>

/**
 *  动画时长 (默认0.5s)
 */
@property (nonatomic, assign) NSTimeInterval animationTime;

/**
 *  跳转类型
 *
 *  @param type 跳转类型 (Presnt,Dismiss,Push,Pop)
 *
 *  @return self
 */
+ (instancetype)transitionWithTransitionType:(STransitionType)type;

@end
