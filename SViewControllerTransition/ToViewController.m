//
//  ToViewController.m
//  SViewControllerTransition
//
//  Created by S on 15/12/18.
//  Copyright © 2015年 S. All rights reserved.
//

#import "ToViewController.h"
#import "ViewController.h"
#import "OtherVC.h"

@interface ToViewController ()<UIViewControllerTransitioningDelegate>

@end

@implementation ToViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self loadUI];
}

- (void)loadUI {
    self.view.backgroundColor = [UIColor grayColor];
    
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(100, 100, 100, 100);
    [btn setTitle:@"present" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(Present) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    UIButton * popBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    popBtn.frame = CGRectMake(100, 200, 100, 100);
    [popBtn setTitle:@"dismiss" forState:UIControlStateNormal];
    [popBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [popBtn addTarget:self action:@selector(Dismiss) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:popBtn];
    
}

- (void)Present {
    
    OtherVC * other = [OtherVC new];
    
    other.transitioningDelegate = self;
    other.modalPresentationStyle = UIModalPresentationCustom;
    [self presentViewController:other animated:YES completion:^{
        
    }];
}

- (void)Dismiss {
    [self dismissViewControllerAnimated:YES completion:^{
        
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
