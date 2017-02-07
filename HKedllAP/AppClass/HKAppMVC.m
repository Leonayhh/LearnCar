//
//  AppMVC.m
//  GangQinEJia
//
//  Created by ly on 15/11/18.
//  Copyright © 2015年 kedll. All rights reserved.
//

#import "HKAppMVC.h"

@interface HKAppMVC ()

@end

@implementation HKAppMVC

@synthesize appwin;

     

- (id)init:(UIWindow*)win RRN:(NSDictionary*)RRN opt:(int)opt
{
    self = [super init];
    if (self) {
        appPower=theAppPower;
        appwin=win;
        appwin.backgroundColor=[UIColor clearColor];
        [NSThread sleepForTimeInterval:2.0];//设置启动页面时间
        appwin.rootViewController=self;
        appBackPower=[HKAppBackPower instance];
        appPower.IO_RemoteNotification=RRN;        
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *Version = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
    [self startLoadOtherCtrl];
//    if (/*[Version isEqualToString: [[NSUserDefaults standardUserDefaults] objectForKey:@"Version"]]*/ 1) {
////       [self startLoadRootCtrl];
//        
//        
//    } else {
//         [[NSUserDefaults standardUserDefaults] setObject:Version forKey:@"Version"];
//        //启动页
//       
//    }
}


#pragma mark-加载其他页(登录,城市选择)
-(void)startLoadOtherCtrl{
    //goto login
    LoginCtrl *loginCtrl=[[LoginCtrl alloc] initWithNibName:@"LoginCtrl" bundle:nil];
    UINavigationController *loginNav=[[HKBaseNavigationController alloc] initWithRootViewController:loginCtrl];
    loginCtrl.loginDelegate = self;
    appwin.rootViewController = loginNav;
}


#pragma mark- 开始加载主控制器
- (void)startLoadRootCtrl{
    self.tabbatVC = [[MainTabbarCtrl alloc] init];
    self.tabbatVC.delegate = self;
    appwin.rootViewController = self.tabbatVC;
   }
#pragma mark-远程推送相关
-(void)ReceiveRemoteNotification:(UIApplication *)application userInfo:(NSDictionary *)userInfo
{
    if (userInfo) {
        theAppPower.IO_RemoteNotification=userInfo;
        
        //进入APP不同状态处理
        if(application.applicationState==UIApplicationStateActive){//正在前台运行(弹框)
            [self NotificationHDL];
            
        }else if(application.applicationState==UIApplicationStateInactive){//从后台到前台（直接打开）
           [self RemoteNotificationsOpt:userInfo backGround:10];
        }
    }
}
//＊＊拼接字符串得到新的 deviceTokenStr 保存到本地，并发送到服务器
-(void)RegisterForRemoteNotifications:(NSData*)deviceToken{
    NSString *deviceTokenStr =[[deviceToken description] stringByReplacingOccurrencesOfString: @"<" withString: @""];
    deviceTokenStr=[deviceTokenStr stringByReplacingOccurrencesOfString: @">" withString: @""];
    deviceTokenStr=[deviceTokenStr stringByReplacingOccurrencesOfString: @" " withString: @""];
    
    NSMutableDictionary *AppConfigDic=[FileManager LoadLocData:DB_AppConfig];
    [AppConfigDic setObject:deviceTokenStr forKey:@"dtoken"];
    [FileManager SaveLocData:DB_AppConfig dic:AppConfigDic];
    [theAppPower SendDevice:deviceTokenStr];
    NSLog(@"dtoken:%@",deviceTokenStr);
}
//＊＊将得到的错误信息放在本地，并上传服务器 IOSSimulator 这个参数
-(void)FailToRegisterNotifications:(UIApplication*)application Error:(NSError*)error{
    NSLog(@"Failed to get devicetoken:%@", error);
    NSMutableDictionary *AppConfigDic=[FileManager LoadLocData:DB_AppConfig];
    [AppConfigDic setObject:@"IOSSimulator" forKey:@"dtoken"];
    [FileManager SaveLocData:DB_AppConfig dic:AppConfigDic];
    [theAppPower SendDevice:@"IOSSimulator"];
}
#pragma 远程消息弹框
- (void)NotificationHDL
{
    ((UIApplication*)[XYUtils GetSharedObj:0]).applicationIconBadgeNumber = 0;
    NSDictionary *dic=theAppPower.IO_RemoteNotification;
    NSDictionary *apsInfo = nil;
    NSString *mes=@"";
    if (dic==nil)  {
        
    } else {
       apsInfo = [dic objectForKey:@"aps"];
//        mes=[apsInfo objectForKey:@"alert"];
    }
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"推送消息" message:mes delegate:self cancelButtonTitle:@"查 看" otherButtonTitles:@"忽 略", nil];
    alert.tag=1992;
    [alert show];
}
- (void)alertView:(UIAlertView *)alertView willDismissWithButtonIndex:(NSInteger)buttonIndex;
{
    NSString* alertBtn=[alertView buttonTitleAtIndex:buttonIndex];
    if ([alertBtn isEqualToString:@"查 看"]&&alertView.tag==1992)
    {
        NSDictionary *dic=theAppPower.IO_RemoteNotification;
        if (dic==nil) return;
        NSDictionary *apsInfo = [dic objectForKey:@"aps"];
        NSString *mesCmd=[apsInfo objectForKey:@"cmd"];
        [self RemoteNotificationsOpt:apsInfo backGround:9];
    }
    theAppPower.IO_RemoteNotification=nil;
}

#pragma 收到推送处理
-(void)RemoteNotificationsOpt:(NSDictionary *)userInfo backGround:(NSInteger)isBackground{
    if (isBackground == 10) {
        
        
    } else {
        
        
    }
}

#pragma mark 跳到主控制器
- (void)goToMainCtrl {
    [self startLoadRootCtrl];
}

#pragma mark loginCtrldelegate 
-(void)loginToRoot {
    appwin = [UIApplication sharedApplication].keyWindow;
    [self startLoadRootCtrl];
}

#pragma mark UITabBarControllerDelegate
- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController {
    if (self.tabbatVC.topView) {
        [self.tabbatVC.topView removeFromSuperview];
        [self.tabbatVC.orderView removeFromSuperview];
        self.tabbatVC.myTabbar.placeOrderBtn.selected = NO;
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}






@end
