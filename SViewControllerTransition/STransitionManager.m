//
//  STransitionManager.m
//  SViewControllerTransition
//
//  Created by S on 15/12/18.
//  Copyright © 2015年 S. All rights reserved.
//

#import "STransitionManager.h"

@interface STransitionManager ()
{
    STransitionType _type;
}
@end

@implementation STransitionManager

#pragma mark - UIViewControllerAnimatedTransitioning
- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return self.animationTime;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    switch (_type) {
        case STransitionTypePresent:
            [self presentAnimation:transitionContext];
            break;
        
        case STransitionTypeDismiss:
            [self dismissAnimation:transitionContext];
            break;
            
        case STransitionTypePush:
            [self pushAnimation:transitionContext];
            break;
            
        case STransitionTypePop:
            [self popAnimation:transitionContext];
            break;
            
        default:
            break;
    }
}

#pragma mark - Present动画
- (void)presentAnimation:(id<UIViewControllerContextTransitioning>)transitionContext{
    
    // 取出目的VC 和 转场视图
    UIViewController * toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView * containerView = [transitionContext containerView];
    
    [containerView addSubview:toVC.view];
    
    
    // 设置toVC在下部
    [toVC.view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.width.height.equalTo(containerView);
        make.top.equalTo(containerView.mas_bottom);
    }];
    [toVC.view layoutIfNeeded];
    
    // 更新约束
    [toVC.view mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.right.width.height.equalTo(containerView);
        make.top.equalTo(containerView);
    }];
    [UIView animateWithDuration:[self transitionDuration:transitionContext] delay:0 usingSpringWithDamping:0.55 initialSpringVelocity:1/0.55 options:0 animations:^{
        
        [toVC.view layoutIfNeeded];
        
    } completion:^(BOOL finished) {
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
        if ([transitionContext transitionWasCancelled]) {
            [toVC.view removeFromSuperview];
        }
    }];
}

#pragma mark - Dismiss动画
- (void)dismissAnimation:(id<UIViewControllerContextTransitioning>)transitionContext{

    // 取出目的VC 和 转场视图
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIView * containerView = [transitionContext containerView];

    [fromVC.view mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.right.width.height.equalTo(containerView);
        make.top.equalTo(containerView.mas_bottom);
    }];

    
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
        [fromVC.view layoutIfNeeded];
        
    } completion:^(BOOL finished) {
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
        if ([transitionContext transitionWasCancelled]) {
            [fromVC.view removeFromSuperview];
        }
    }];
}

#pragma mark - Push动画
- (void)pushAnimation:(id<UIViewControllerContextTransitioning>)transitionContext{
    
    // 取出目的VC 和 转场视图
//    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UINavigationController * toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView * containerView = [transitionContext containerView];
    
//    [containerView addSubview:fromVC.view];
    [containerView addSubview:toVC.view];
    
    
    // 设置toVC在下部
    [toVC.view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.width.height.equalTo(containerView);
        make.top.equalTo(containerView.mas_bottom);
    }];
    [toVC.view layoutIfNeeded];
    
    // 更新约束
    [toVC.view mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.right.width.height.equalTo(containerView);
        make.top.equalTo(containerView);
    }];
    [UIView animateWithDuration:[self transitionDuration:transitionContext] delay:0 usingSpringWithDamping:0.55 initialSpringVelocity:1/0.55 options:0 animations:^{
        
        [toVC.view layoutIfNeeded];
        
    } completion:^(BOOL finished) {
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
        if ([transitionContext transitionWasCancelled]) {
            [toVC.view removeFromSuperview];
        }
    }];
}

#pragma mark - Pop动画
- (void)popAnimation:(id<UIViewControllerContextTransitioning>)transitionContext{
    
    // 取出目的VC 和 转场视图
    UINavigationController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
//    UINavigationController * toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView * containerView = [transitionContext containerView];
//    [containerView addSubview:toVC.view];
//    [containerView bringSubviewToFront:fromVC.view];
    
    [fromVC.view mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.right.width.height.equalTo(containerView);
        make.top.equalTo(containerView.mas_bottom);
    }];
    
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
        [fromVC.view layoutIfNeeded];
        
    } completion:^(BOOL finished) {
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
        if ([transitionContext transitionWasCancelled]) {
            [fromVC.view removeFromSuperview];
        }
    }];
}

#pragma mark - 初始化
+ (instancetype)transitionWithTransitionType:(STransitionType)type {
    return [[self alloc]initWithTransitionType:type];
}

- (instancetype)initWithTransitionType:(STransitionType)type{
    self = [super init];
    if (self) {
        _type = type;
        self.animationTime = 0.5f;
    }
    return self;
}


@end
