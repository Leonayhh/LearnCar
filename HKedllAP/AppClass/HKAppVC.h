//
//  HKAppVC.h
//  GangQinEJia
//  项目基类
//  Created by ly on 15/11/19.
//  Copyright © 2015年 kedll. All rights reserved.
//


#import "HKBaseViewController.h"

@interface HKAppVC : HKBaseViewController<KDNetURCProtocol,UITabBarDelegate>
{

}
@property(assign,nonatomic)CGRect mFrame;

@property (nonatomic, assign) BOOL  isNeedNetRequest;

-(BOOL)needCheckLogin;


@end
