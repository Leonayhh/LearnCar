//
//  AppPower.h
//  GangQinEJia
//  数据中心
//  Created by ly on 15/11/18.
//  Copyright © 2015年 kedll. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XmlCenter.h"

#define URC [[HKAppURC alloc]init]

@interface HKAppPower : NSObject
{
    NSArray *IO_ConfigXmlData;//config.xml 配置数据
    NSDictionary* IO_RemoteNotification;//远程推送数据
}

@property(nonatomic,strong) NSArray *IO_ConfigXmlData;
@property(nonatomic,strong) NSDictionary*IO_RemoteNotification;
+(HKAppPower *)instance;
//发送设备号到服务器
-(BOOL)SendDevice:(id)del;
//获取本地设备号
-(NSString *)GetDeviceToken;
//获取总配置文件
-(void)getApiVersion;
//通过key读取本地ApiVersion文件
-(NSDictionary *)getApiVersionBykey:(NSString *)key;

@end
