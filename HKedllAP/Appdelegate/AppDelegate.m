//
//  AppDelegate.m
//  GangQinEJia
//
//  Created by ly on 15/11/18.
//  Copyright © 2015年 kedll. All rights reserved.
//

#import "AppDelegate.h"
#import "HKCrashCatch.h"
@interface AppDelegate () 

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [[HKLocationManager shareLocation] getLocationCoordinate:^(CLLocationCoordinate2D locationCorrrdinate) {
        
    }];
    
    
    UIWindow* win=[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];//
    self.window = win;
    [self.window makeKeyAndVisible];
   [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
    UIApplication *app=[UIApplication sharedApplication];
    [app setIdleTimerDisabled:YES];//控制是否取消应用程序空闲时间 不让锁屏，使得屏幕处于长亮状态
    if (IOS_VERSION_8_OR_ABOVE){
        UIUserNotificationType types = UIUserNotificationTypeBadge | UIUserNotificationTypeSound | UIUserNotificationTypeAlert;
        UIUserNotificationSettings *mySettings = [UIUserNotificationSettings settingsForTypes:types categories:nil];
        [app registerUserNotificationSettings:mySettings];
        [app registerForRemoteNotifications];
    }else{
        [app registerForRemoteNotificationTypes:(UIRemoteNotificationTypeBadge | UIRemoteNotificationTypeSound | UIRemoteNotificationTypeAlert)];
    }

    self.mainCtrl=[[HKAppMVC alloc] init:win RRN:[launchOptions objectForKey:UIApplicationLaunchOptionsRemoteNotificationKey] opt:0];
    //注册消息处理函数的处理方法
    NSSetUncaughtExceptionHandler(&uncaughtExceptionHandler);
    return YES;
}

- (void)application:(UIApplication*)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData*)deviceToken
{
    if(self.mainCtrl)[self.mainCtrl RegisterForRemoteNotifications:deviceToken];
}

- (void)application:(UIApplication*)application didFailToRegisterForRemoteNotificationsWithError:(NSError*)error
{
    if(self.mainCtrl)[self.mainCtrl FailToRegisterNotifications:application Error:error];
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo
{
    if(self.mainCtrl)[self.mainCtrl ReceiveRemoteNotification:application userInfo:userInfo];
}


- (void)applicationWillResignActive:(UIApplication *)application {


}

- (void)applicationDidEnterBackground:(UIApplication *)application {


}

- (void)applicationWillEnterForeground:(UIApplication *)application {

}

- (void)applicationDidBecomeActive:(UIApplication *)application {

}

- (void)applicationWillTerminate:(UIApplication *)application {

}
- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
//    if ([[url scheme] isEqualToString:weixinKey])
//    {
//        return [WXApi handleOpenURL:url delegate:shareManager];
//    }
//    else if ([[url scheme] isEqualToString:[NSString stringWithFormat:@"tencent%@",QQ_AppID]])
//    {
//        return [TencentOAuth HandleOpenURL:url]|| [QQApiInterface handleOpenURL:url delegate:[HKShareQQResult instance]];
//    }
//    else if ([[url scheme] isEqualToString:[NSString stringWithFormat:@"wb%@",sina_appKey]])
//    {
//        return [WeiboSDK handleOpenURL:url delegate:shareManager];
//    }
    return YES;
}
- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url
{
    
    return YES;
}


@end
