//
//  AppPower.m
//  GangQinEJia
//
//  Created by ly on 15/11/18.
//  Copyright © 2015年 kedll. All rights reserved.
//

#import "HKAppPower.h"


@implementation HKAppPower

@synthesize IO_ConfigXmlData,IO_RemoteNotification;

+(HKAppPower *)instance{
    static HKAppPower *power;
    if(power){
        return power;
    }else{
        power=[[HKAppPower alloc] init];
    }
    return power;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self getconfigXmlData];
        [self getApiVersion];
    }
    return self;
}
#pragma mark-获取本地config.xml的数据
-(void)getconfigXmlData{
    NSMutableArray *xmlArray=[NSMutableArray array];
    XmlCenter *xmler=[[XmlCenter alloc] init];
    if([xmler start:[NSString stringWithFormat:@"%@/%@/%@",[[NSBundle mainBundle] bundlePath],DB_ResName,@"Config.xml"] data:nil]){[xmler GBPS:@"/ROOT" data:xmlArray];[xmler end];}
    IO_ConfigXmlData=[NSArray arrayWithArray:xmlArray];
}
#pragma mark-获取设备号
-(NSString *)GetDeviceToken{
    NSString *dtoken=@"";
    NSMutableDictionary *AppConfigDic = [FileManager LoadLocData:DB_AppConfig];
    dtoken=AppConfigDic[@"dtoken"];
    if(!dtoken){
        dtoken=@"IOSSimulator";
    }
    return dtoken;
}
#pragma mark-获取总配置文件
-(void)getApiVersion{
    NSString *url =[NSString stringWithFormat:@"%@%@",HostAddr,api_Version];
    KDNetGlobal *netGlobal=[KDNetGlobal getInstance];
    KDNetHttpReqCenter *req=[netGlobal getHttpReqCenter];
    [req sendHttpReq:self sendDic:nil URL:url responseDWay:1 api:api_Version nsl:NO stl:YES];
}

#pragma mark-获取AreaData
-(void)getAreaData{
    NSString *xml=[self getApiVersionBykey:@"AreaLib"][@"value"];
    NSString *url =[NSString stringWithFormat:@"%@%@",HostAddr,xml];
    KDNetGlobal *netGlobal=[KDNetGlobal getInstance];
    KDNetHttpReqCenter *req=[netGlobal getHttpReqCenter];
    [req sendHttpReq:self sendDic:nil URL:url responseDWay:1 api:api_AreaData nsl:NO stl:YES];
}

#pragma mark-通过key读取本地ApiVersion文件
-(NSDictionary *)getApiVersionBykey:(NSString *)key{
    NSMutableDictionary *AppConfigDic = [FileManager LoadLocData:DB_AppConfig];
    NSDictionary *ApiVersion=AppConfigDic[@"ApiVersion"];
    for (NSDictionary *dic in ApiVersion[@"RList"]) {
        if([dic[@"title"] isEqualToString:key]){
            return dic;
        }
    }
    return nil;
}
#pragma mark-发送设备号到服务器
-(BOOL)SendDevice:(id)del {
    NSDictionary *AppConfig=[FileManager LoadLocData:DB_AppConfig];
    NSString *dtokenStr=AppConfig[@"dtoken"];
    if(!dtokenStr){
        dtokenStr=@"IOSSimulator";
    }
    UIDevice* sysinf=[UIDevice currentDevice];
    NSString *dtype=sysinf.model;
    NSDictionary *proinf = [[NSBundle mainBundle] infoDictionary];
    NSString *vtype=[proinf valueForKey:@"CFBundleVersion"];
    NSString *ptype=[proinf valueForKey:@"CFBundleName"];
    NSString *otype=sysinf.systemVersion;
    NSString *latitude=@"0";
    NSString *longitude=@"0";
    NSString *dtoken=dtokenStr;
    NSString *url =[NSString stringWithFormat:@"%@%@",HostAddr,api_DevicPost];
 
    NSMutableDictionary * SendDD=[[NSMutableDictionary alloc] init];
    [SendDD setObject:dtype forKey:@"dtype"];
    [SendDD setObject:otype forKey:@"otype"];
    [SendDD setObject:ptype forKey:@"ptype"];
    [SendDD setObject:dtoken forKey:@"dtoken"];
    [SendDD setObject:vtype forKey:@"vtype"];
    [SendDD setObject:latitude forKey:@"longitude"];
    [SendDD setObject:longitude forKey:@"latitude"];
    [SendDD setObject:@"" forKey:@"rfid"];
    
    KDNetGlobal *netGlobal=[KDNetGlobal getInstance];
    KDNetHttpReqCenter *req=[netGlobal getHttpReqCenter];
    [req sendHttpReq:self sendDic:SendDD URL:url responseDWay:1 api:api_DevicPost nsl:YES stl:NO];
    
    return TRUE;
}
#pragma mark-网络回调
-(void)OnHttpDataBack:(NSString*)api responseDWay:(int)dw data:(NSData*)data userInfo:(id)userInfo{
    NSDictionary *RDic =[URC Parser:api data:data];
    NSString *code=RDic[@"code"];
    if([api isEqualToString:api_DevicPost])
    {
        if([code isEqualToString:@"200"]){
            if([code isEqualToString:@"200"]){
            
            }else{
                
            }
        }
    }else  if([api isEqualToString:api_Version]) {
        if([code isEqualToString:@"200"]){
                NSMutableDictionary *AppConfigDic = [FileManager LoadLocData:DB_AppConfig];
                [AppConfigDic setObject:RDic forKey:@"ApiVersion"];
                [FileManager SaveLocData:DB_AppConfig dic:AppConfigDic];
                [self getAreaData];
            }else{
                
        }
    }else if([api isEqualToString:api_AreaData]) {
        if([code isEqualToString:@"200"]){
            if([code isEqualToString:@"200"]){
                
                if(RDic){
                    NSMutableDictionary *AreaConfigDic = [FileManager LoadLocData:DB_AreaConfig];
                    [AreaConfigDic setObject:RDic forKey:@"AreaConfigDic"];
                    [FileManager SaveLocData:DB_AreaConfig dic:AreaConfigDic];
                }
            }else{
                
            }
        }
    }
}

@end
