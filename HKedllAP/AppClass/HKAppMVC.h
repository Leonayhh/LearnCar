//
//  AppMVC.h
//  GangQinEJia
//
//  Created by ly on 15/11/18.
//  Copyright © 2015年 kedll. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HKAppPower.h"
#import "HKBaseNavigationController.h"
#import "HKAppBackPower.h"
#import "HKAppVC.h"
#import "WJCTabbar.h"
#import "MainTabbarCtrl.h"
#import "RecordInstace.h"
#import "LoginCtrl.h"

#define theAppPower [HKAppPower instance]
#define theAppBackPower [HKAppBackPower instance]
@interface HKAppMVC : HKAppVC<UITabBarControllerDelegate,LoginCtrlDelegate,UINavigationControllerDelegate>
{
   HKAppPower *appPower;
   HKAppBackPower *appBackPower;
   NSMutableDictionary *LocDat;
}

@property(nonatomic,strong)UIWindow *appwin;

@property(nonatomic,strong)MainTabbarCtrl *tabbatVC;

@property(nonatomic,assign)BOOL isfirst;

- (id)init:(UIWindow*)win RRN:(NSDictionary*)RRN opt:(int)opt;

-(void)startLoadOtherCtrl;

- (void)startLoadRootCtrl;


-(void)ReceiveRemoteNotification:(UIApplication *)application userInfo:(NSDictionary *)userInfo;
-(void)RegisterForRemoteNotifications:(NSData*)deviceToken;
-(void)FailToRegisterNotifications:(UIApplication*)application Error:(NSError*)error;
-(void)RemoteNotificationsOpt:(NSDictionary *)userInfo;
@end
