//
//  HKAppBackPower.m
//  GangQinEJia
//
//  Created by ly on 15/12/8.
//  Copyright © 2015年 kedll. All rights reserved.
//
#define LoginObserveURCID @"11221992"
#import "HKAppBackPower.h"

@implementation HKAppBackPower
+(HKAppBackPower *)instance{
    static HKAppBackPower *backPower;
    if(!backPower){
        backPower=[[HKAppBackPower alloc] init];
        
    }
    return backPower;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self startTask];
        [self checkCrashFileCache];
    }
    return self;
}



-(void)startTask{
    //检测token是否过期(即登录是否失效)
    LoginObserveTimer= [NSTimer scheduledTimerWithTimeInterval:20 target:self selector:@selector(onLoginObserveTimerdo:) userInfo:nil repeats:YES];
    updUserInfTimer= [NSTimer scheduledTimerWithTimeInterval:20 target:self selector:@selector(onGetUserinfTimerdo:) userInfo:nil repeats:YES];
    [self stopUpdUserinfo];
}
//检测本地崩溃日志
-(void)checkCrashFileCache{
    NSData *filedata = [NSData dataWithContentsOfFile:[NSString stringWithFormat:@"%@%@",NSHomeDirectory(),HKCrashCatchFilePath]];
    
    if(filedata){
        [self GetLicenseID];
    }
}
/**
 *  token检测心跳
 *
 *  @param sender sender description
 */
-(void)onLoginObserveTimerdo:(id)sender{
    //获取经纬度
    locationManager=[HKLocationManager shareLocation];
    [locationManager getLocationCoordinate:^(CLLocationCoordinate2D locationCorrrdinate) {
        LocDat=[FileManager LoadLocData:DB_UserConfig];
        [LocDat setObject:[NSString stringWithFormat:@"%f",locationCorrrdinate.latitude] forKey:@"lat"];
        [LocDat setObject:[NSString stringWithFormat:@"%f",locationCorrrdinate.longitude] forKey:@"long"];
        [FileManager SaveLocData:DB_UserConfig dic:LocDat];
    }];
    //发送心跳
    [self keepHeart];
}

/**
 *  更新资料
 *
 *  @param sender sender description
 */
-(void)onGetUserinfTimerdo:(id)sender{
    
    [self getUserinf];
    
}

/**
 *  开始拉取个人信息
 */
-(void)startUpdUserinfo{
    
    [updUserInfTimer setFireDate:[NSDate distantPast]];

}

/**
 *  停止拉取个人信息
 */
-(void)stopUpdUserinfo{
    [updUserInfTimer setFireDate:[NSDate distantFuture]];
}                                                                                                                                                                                                                                                                                                                                                                                                                                                                          

#pragma mark-数据区
/**
 *  在线心跳
 *
 *  @param sender sender description
 */
-(void)keepHeart{
    LocDat=[FileManager LoadLocData:DB_UserConfig];
    NSString *userToken = @"";
    if ([[LocDat objectForKey:@"userinf"] isKindOfClass:[NSNull class]]) {
        
    } else {
        userToken = LocDat[@"userinf"][@"token"];
    }
    if(userToken){//登录了(检测token是否失效)
        NSLog(@"FRootCtrl:账号异常检测");
        NSString *token = @"";
        if ([[LocDat objectForKey:@"userinf"] isKindOfClass:[NSNull class]]) {
            
        } else {
            token=LocDat[@"userinf"][@"token"];
        }
       
        NSString *url=[NSString stringWithFormat:@"%@%@",HostAddr,api_AMAPI_KeepHeart];
        NSMutableDictionary *SendDD=[[NSMutableDictionary alloc] init];
        [SendDD setObject:token forKey:@"token"];
        
        NSMutableDictionary *data=[NSMutableDictionary dictionary];
        [data setValue:userToken forKey:@"tok"];
        [data setValue:[theAppPower GetDeviceToken] forKey:@"dwc"];
        [data setValue:LocDat[@"long"] forKey:@"jd"];
        [data setValue:LocDat[@"lat"] forKey:@"wd"];
        [SendDD setObject:[data JSONString] forKey:@"data"];
        
        KDNetGlobal *netGlobal=[KDNetGlobal getInstance];
        KDNetHttpReqCenter *req=[netGlobal getHttpReqCenter];
        [req sendHttpReq:self sendDic:SendDD URL:url responseDWay:1 api:api_AMAPI_KeepHeart nsl:NO stl:NO];
    }
}
/**
 *  获取用户信息
 */
-(void)getUserinf{
    
    LocDat=[FileManager LoadLocData:DB_UserConfig];
    NSString *userToken=LocDat[@"userinf"][@"token"];
    if(userToken){//登录了(检测token是否失效)
        NSLog(@"HKAppBackPower:拉取个人资料");
        NSString *token=LocDat[@"userinf"][@"token"];
        
        NSString *url=[NSString stringWithFormat:@"%@%@",HostAddr,api_AMAPI_SimplePlanCmd];
        NSMutableDictionary *SendDD=[[NSMutableDictionary alloc] init];
        [SendDD setObject:token forKey:@"token"];
        [SendDD setObject:@"UpdClienter" forKey:@"cmd"];
        KDNetGlobal *netGlobal=[KDNetGlobal getInstance];
        KDNetHttpReqCenter *req=[netGlobal getHttpReqCenter];
        [req sendHttpReq:self sendDic:SendDD URL:url responseDWay:1 api:api_AMAPI_SimplePlanCmd nsl:NO stl:NO];
    }
}

//用户上传LicenseID
-(void)GetLicenseID{
    NSString *DeviceToken=[theAppPower GetDeviceToken];
    NSString *AppName=@"crash";
    NSString *url=[NSString stringWithFormat:@"%@%@?DeviceToken=%@&AppName=%@",HostAddr,api_AFU2012_PostFilesTS,DeviceToken,AppName];
    KDNetGlobal *netGlobal=[KDNetGlobal getInstance];
    KDNetHttpReqCenter *req=[netGlobal getHttpReqCenter];
    [req sendHttpReq:self sendDic:nil URL:url responseDWay:1 api:api_type_GetLicenseID nsl:NO stl:NO];
}
//上传文件
-(void)PostFilesTS:(NSString *)LicenseID{
    NSData *filedata = [NSData dataWithContentsOfFile:[NSString stringWithFormat:@"%@%@",NSHomeDirectory(),HKCrashCatchFilePath]];
    NSMutableArray *fileArray=[NSMutableArray array];
    KDNetHttpReqFileModel *fileModel=[[KDNetHttpReqFileModel alloc] init];
    fileModel.fileData=filedata;
    fileModel.name=@"error.log";
    fileModel.fileName=@"error";
    fileModel.mimeType=@"text/html";
    [fileArray addObject:fileModel];
    
    NSString *url=[NSString stringWithFormat:@"%@%@?LicenseID=%@",HostAddr,api_AFU2012_PostFilesTS,LicenseID];
    NSMutableDictionary *SendDD=[[NSMutableDictionary alloc] init];
    
    [SendDD setObject:AppLockID forKey:@"AppLockID"];
    [SendDD setObject:fileArray forKey:@"file_file"];//
    
    KDNetGlobal *netGlobal=[KDNetGlobal getInstance];
    KDNetHttpReqCenter *req=[netGlobal getHttpReqCenter];
    [req sendHttpReq:self sendDic:SendDD URL:url responseDWay:1 api:api_AFU2012_PostFilesTS nsl:NO stl:NO];
}
//上报错误信息
-(void)PostCrashLog:(NSString *)lockid{
    LocDat=[FileManager LoadLocData:DB_UserConfig];
    if (LocDat[@"userinf"] == nil || [LocDat[@"userinf"] isKindOfClass:[NSNull class]]) {
        return;
    }
    NSString *username=[LocDat[@"userinf"] objectForKey:@"nickname"];   // [@"nickname"];
    NSString *userSid=LocDat[@"userinf"][@"sid"];
    NSString *url=[NSString stringWithFormat:@"%@%@",HostAddr,api_CAPool_RptError];
    NSMutableDictionary *SendDD=[[NSMutableDictionary alloc] init];
    [SendDD setValue:[NSString stringWithFormat:@"iphone客户端崩溃日志"] forKey:@"tag"];//标题
    [SendDD setValue:@"1999" forKey:@"code"];//错误代码
    [SendDD setValue:lockid forKey:@"lockid"];//资源id
    [SendDD setValue:[NSString stringWithFormat:@"用户名:%@\n用户ID:%@\n设备型号:%@",username,userSid,[XYStringOperate getDeviceName]] forKey:@"log"];//日志
    KDNetGlobal *netGlobal=[KDNetGlobal getInstance];
    KDNetHttpReqCenter *req=[netGlobal getHttpReqCenter];
    [req sendHttpReq:self sendDic:SendDD URL:url responseDWay:1 api:api_CAPool_RptError nsl:NO stl:NO];
}

#pragma mark-网络回调
-(void)OnHttpErrorBack:(NSMutableDictionary*)api{
    
}

-(void)OnHttpDataBack:(NSString*)api responseDWay:(int)dw data:(NSData*)data userInfo:(id)userInfo{
    NSDictionary *RDic =[URC Parser:api data:data];
    NSString *code=RDic[@"code"];
    if([api isEqualToString:api_AMAPI_SimplePlanCmd])
    {
        if([code isEqualToString:@"200"]){
            //存储用户信息
            LocDat=[FileManager LoadLocData:DB_UserConfig];
            [LocDat setObject:[RDic objectForKey:@"userinf"] forKey:@"userinf"];
            [FileManager SaveLocData:DB_UserConfig dic:LocDat];
            
            if(self.userinfUpdedReturnBlock){
                self.userinfUpdedReturnBlock(YES);
            }
            
        }else{
            
        }
    }else if([api isEqualToString:api_AMAPI_KeepHeart]){
        
        if([code isEqualToString:@"200"]){
            
            
        }else{
            LocDat=[FileManager LoadLocData:DB_UserConfig];
            [LocDat removeObjectForKey:@"userinf"];
            [LocDat removeObjectForKey:@"password"];
            [FileManager SaveLocData:DB_UserConfig dic:LocDat];
            UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"提示" message:@"您的账号已在其他设备登录" delegate:self cancelButtonTitle:@"知道了" otherButtonTitles:nil, nil];
            alert.delegate=self;
            [alert show];
        }
    }
    else if([api isEqualToString:api_type_GetLicenseID]){
        if([code isEqualToString:@"200"]){
            AppLockID=RDic[@"AppLockID"];
            NSString *LicenseID=RDic[@"value"];
            [self PostFilesTS:LicenseID];
            
        }else{
            
        }
    }
    else if([api isEqualToString:api_AFU2012_PostFilesTS]){
        if([code isEqualToString:@"200"]){
            [self PostCrashLog:AppLockID];
        }else{
            
        }
    }else if([api isEqualToString:api_CAPool_RptError]){
        if([code isEqualToString:@"200"]){
            //上传成功删除文件
            NSFileManager* fileManager=[NSFileManager defaultManager];
            NSString *uniquePath=[NSString stringWithFormat:@"%@%@",NSHomeDirectory(),HKCrashCatchFilePath];
            BOOL blHave=[[NSFileManager defaultManager] fileExistsAtPath:uniquePath];
            if (!blHave) {
                return ;
            }else {
                [fileManager removeItemAtPath:uniquePath error:nil];
            }
        }else{
            [self GetLicenseID];
        }
    }
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    
    [appDelegate.mainCtrl startLoadOtherCtrl];
    
}


- (void)dealloc
{
    
}
@end
