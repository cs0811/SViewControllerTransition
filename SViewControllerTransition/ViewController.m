//
//  ViewController.m
//  SViewControllerTransition
//
//  Created by S on 15/12/18.
//  Copyright © 2015年 S. All rights reserved.
//

#import "ViewController.h"
#import "ToViewController.h"


@interface ViewController () <UIViewControllerTransitioningDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self loadUI];
    
}

- (void)loadUI {
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(100, 100, 100, 100);
    [btn setTitle:@"present" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(present) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}

- (void)present {
    
    ToViewController * to = [[ToViewController alloc]init];
    to.transitioningDelegate = self;
    to.modalPresentationStyle = UIModalPresentationCustom;
    [self presentViewController:to animated:YES completion:^{
        
    }];
}


#pragma mark - UIViewControllerTransitioningDelegate
- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
    return [STransitionManager transitionWithTransitionType:STransitionTypePresent];
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    return [STransitionManager transitionWithTransitionType:STransitionTypeDismiss];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
