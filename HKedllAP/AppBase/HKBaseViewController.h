//
//  HKBaseViewController.h
//  GangQinEJia
//  基类UIViewController
//  Created by ly on 15/11/18.
//  Copyright © 2015年 kedll. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HKBaseNavigationController.h"
#import "HKCtrlProtocol.h"

@interface HKBaseViewController : UIViewController<HKCtrlProtocol>

@property(nonatomic,strong)id thedelegate;

@property(nonatomic,strong)id CreateCMD;

@property (nonatomic, assign) CGRect CFrame;

@property(nonatomic,strong)UINavigationBar *navigationBar;
- (void)performBlock:(void(^)())block afterDelay:(NSTimeInterval)delay;

@end
