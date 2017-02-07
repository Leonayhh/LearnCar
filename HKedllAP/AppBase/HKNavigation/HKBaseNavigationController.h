//
//  HKBaseNavigationController.h
//  GangQinEJia
//  基类UINavigationController
//  Created by ly on 15/11/18.
//  Copyright © 2015年 kedll. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import "UINavigationBar+HKExtended.h"
//#import "UINavigationController+Customizer.h"
//#import "UITabbarController+Customizer.h"

@interface HKBaseNavigationController : UINavigationController<UIGestureRecognizerDelegate>


@property (nonatomic, assign) BOOL isPanBack;


@end
