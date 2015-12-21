//
//  PushViewController.m
//  SViewControllerTransition
//
//  Created by S on 15/12/21.
//  Copyright © 2015年 S. All rights reserved.
//

#import "PushViewController.h"
#import "PushToVC.h"

@interface PushViewController ()<UINavigationControllerDelegate>

@end

@implementation PushViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self loadUI];
}

- (void)loadUI {
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(100, 100, 100, 100);
    [btn setTitle:@"push" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(push) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}

- (void)push {
    
    PushToVC * to = [PushToVC new];
    self.navigationController.delegate = self;
    [self.navigationController pushViewController:to animated:YES];
}

- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC {
    switch (operation) {
        case UINavigationControllerOperationPush:
            return [STransitionManager transitionWithTransitionType:STransitionTypePush];
            break;
            
        case UINavigationControllerOperationPop:
            return [STransitionManager transitionWithTransitionType:STransitionTypePop];
            break;
            
        default:
            break;
    }
    return nil;
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
