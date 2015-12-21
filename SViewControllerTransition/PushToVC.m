//
//  PushToVC.m
//  SViewControllerTransition
//
//  Created by S on 15/12/21.
//  Copyright © 2015年 S. All rights reserved.
//

#import "PushToVC.h"
#import "PushOtherVC.h"

@interface PushToVC ()<UINavigationControllerDelegate>

@end

@implementation PushToVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self loadUI];
}

- (void)loadUI {
    self.view.backgroundColor = [UIColor grayColor];
    
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(100, 100, 100, 100);
    [btn setTitle:@"push" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(push) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
}

- (void)push {
    
    PushOtherVC * other = [PushOtherVC new];
//    self.navigationController.delegate = self;
    [self.navigationController pushViewController:other animated:YES];
}

//- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC {
//    switch (operation) {
//        case UINavigationControllerOperationPush:
//            return [STransitionManager transitionWithTransitionType:STransitionTypePush];
//            break;
//            
//        case UINavigationControllerOperationPop:
//            return [STransitionManager transitionWithTransitionType:STransitionTypePop];
//            break;
//            
//        default:
//            break;
//    }
//    return nil;
//}


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
