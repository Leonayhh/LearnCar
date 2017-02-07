//
//  HKAppBackPower.h
//  GangQinEJia
//  后台数据中心
//  Created by ly on 15/12/8.
//  Copyright © 2015年 kedll. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HKLocationManager.h"
#import "HKCrashCatch.h"
typedef void (^UserinfUpdedReturnBlock)(BOOL success);

@interface HKAppBackPower : NSObject
{   NSMutableDictionary *LocDat;
    HKLocationManager *locationManager;
    NSTimer *LoginObserveTimer;//登录监听计时器
    
    NSTimer *updUserInfTimer;//登录监听计时器
    NSString *AppLockID;
}

@property (nonatomic, copy) UserinfUpdedReturnBlock userinfUpdedReturnBlock;

+(HKAppBackPower *)instance;
-(void)startUpdUserinfo;
-(void)stopUpdUserinfo;
@end
