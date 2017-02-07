//
//  HKCrashCatch.m
//  HKedllAP
//  崩溃日志收集
//  Created by ly on 16/5/10.
//  Copyright © 2016年 kedll. All rights reserved.
//

#import "HKCrashCatch.h"

@implementation HKCrashCatch




void uncaughtExceptionHandler(NSException *exception)

{
    // 异常的堆栈信息
    NSArray *stackArray = [exception callStackSymbols];
    // 出现异常的原因
    NSString *reason = [exception reason];
    // 异常名称
    NSString *name = [exception name];
    
    NSString *exceptionInfo = [NSString stringWithFormat:@"Exception reason：%@\nException name：%@\nException stack：%@",name, reason, stackArray];
    
    NSLog(@"%@", exceptionInfo);
    
    NSMutableArray *tmpArr = [NSMutableArray arrayWithArray:stackArray];
    [tmpArr insertObject:reason atIndex:0];
    
    
    NSString *deviceName=[XYStringOperate getDeviceName];
    NSString *systemVersion=[NSString stringWithFormat:@"%f",[[[UIDevice currentDevice] systemVersion] floatValue]];
    NSString *detoken=[theAppPower GetDeviceToken];
    NSDictionary *proinf = [[NSBundle mainBundle] infoDictionary];
    NSString *CFBundleShortVersionString=[proinf valueForKey:@"CFBundleShortVersionString"];
    NSString *CFBundleVersion=[proinf valueForKey:@"CFBundleVersion"];
    NSString *CFBundleName=[proinf valueForKey:@"CFBundleName"];
    NSString *crashTime=[NSDate  stringYearMonthDayWithDate:[NSDate date] format:@"yyyy-MM-dd HH:mm:ss"];
    
    NSMutableDictionary *dic=[NSMutableDictionary dictionary];
    [dic setValue:deviceName forKey:@"deviceName"];
    [dic setValue:systemVersion forKey:@"systemVersion"];
    [dic setValue:detoken forKey:@"detoken"];
    [dic setValue:CFBundleShortVersionString forKey:@"CFBundleShortVersionString"];
    [dic setValue:CFBundleVersion forKey:@"CFBundleVersion"];
    [dic setValue:CFBundleName forKey:@"CFBundleName"];
    [dic setValue:crashTime forKey:@"crashTime"];
    [dic setValue:exceptionInfo forKey:@"exceptionInfo"];
    
    
    
    NSString *crashInfo=[NSString stringWithFormat:@"|deviceName|:%@\n|systemVersion|:%@\n|detoken|:%@\n|CFBundleShortVersionString|:%@\n|CFBundleVersion|:%@\n|CFBundleName|:%@\n|crashTime|:%@\n|crashTime|:%@\n",deviceName,systemVersion,detoken,CFBundleShortVersionString,CFBundleVersion,CFBundleName,crashTime,exceptionInfo ];
    
    //保存到本地
    [crashInfo writeToFile:[NSString stringWithFormat:@"%@%@",NSHomeDirectory(),HKCrashCatchFilePath]  atomically:YES encoding:NSUTF8StringEncoding error:nil];
    
}

@end
