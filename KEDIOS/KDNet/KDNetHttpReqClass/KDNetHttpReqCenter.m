                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                //
//  KDNetHttpReqCenter.m
//  KedllDemo
//
//  Created by ly on 15/11/15.
//  Copyright © 2015年 kedll. All rights reserved.
//

#import "KDNetHttpReqCenter.h"

@implementation KDNetHttpReqCenter
@synthesize IO_Delegate;
@synthesize IO_RequestGroups;
@synthesize IO_DataSendSum;
@synthesize IO_DataReciveSum;
@synthesize IO_IsNetIdle;
@synthesize m_NowReqNetDNA;
- (id)init
{
    self = [super init];
    if (self)
    {
        IO_RequestGroups=[[NSMutableArray alloc] init];
        IO_IsNetIdle=TRUE;
    }
    return self;
}

-(void)DelRequestByAppID:(NSString*)dapi  dlgt:(id)dlgt
{
    if (dapi==nil&&dlgt==nil){
        [IO_RequestGroups removeAllObjects];
    }
    else{
        for (int i=0; i<[IO_RequestGroups count]; i++) {
            NSMutableDictionary*item=[IO_RequestGroups objectAtIndex:i];
            id _delegate=[item objectForKey:@"delegate"];
            NSString *api=[item objectForKey:@"api"];
            NSString *NetDNA=[item objectForKey:@"NetDNA"];
            if ([api isEqualToString:dapi]||_delegate==dlgt){
                NSLog(@"删除请求包NetDNA:%@",NetDNA);
                if(![m_NowReqNetDNA isEqualToString:NetDNA]) [IO_RequestGroups removeObject:item];
                else [item setObject:@"------" forKey:@"NetDNA"];
            }
        }
    }
}

/*
 delegate:  代理
 sendDic:   发送数据包
 URL:   请求地址
 responseDWay:    数据类型（1:xml,2:json,3:bit）
 api:   解析指导
 nsl:   阻塞式请求
 stl:   save to local
 注:如需上传图片文件。在sendDic 设置一个key为"file_file" value为图片data数组 的元素
 例：[SendDD setObject:@[data] forKey:@"file_file"];//data:图片二进制数据
 */
-(void)sendHttpReq:(id)delegate sendDic:(NSMutableDictionary *)SD  URL:(NSString*)Url  responseDWay:(int)dw api:(NSString*)api nsl:(BOOL)nsl stl:(BOOL)stl{
    NSString *NetDNA=[NSString stringWithFormat:@"[%d-%@-%d-%d]", ((int)(delegate)), [KDNetUtil md5:Url],dw,((int)SD)];
    NSMutableDictionary * ReqData=[[NSMutableDictionary alloc] init];
    [ReqData setObject:api forKey:@"api"];
    [ReqData setObject:[NSString stringWithFormat:@"%d",dw] forKey:@"DWay"];
    if(SD)[ReqData setObject:SD forKey:@"SendDD"];
    if(Url)[ReqData setObject:Url forKey:@"Url"];
    if(delegate)[ReqData setObject:delegate forKey:@"delegate"];
    [ReqData setObject:[NSString stringWithFormat:@"%d",nsl] forKey:@"isNecessary"];
    [ReqData setObject:[NSString stringWithFormat:@"%d",stl] forKey:@"SaveToLocal"];
    [ReqData setObject:NetDNA forKey:@"NetDNA"];
    
    BOOL find=FALSE;
    for (NSDictionary*item in IO_RequestGroups)
    {
        find=[NetDNA isEqualToString:[item objectForKey:@"NetDNA"]];
        if (find){find=TRUE;break; }
    }
    if (!find){
        [IO_RequestGroups addObject:ReqData];[self SendRequest];
    }else NSLog(@"重复请求:%@！",NetDNA);
}

-(void)SendRequest
{
    if ([IO_RequestGroups count]>0&&IO_IsNetIdle)
    {
        IO_IsNetIdle=FALSE;
        if ([IO_RequestGroups count]>0) {
            NSDictionary *item=[IO_RequestGroups objectAtIndex:0];
            NSMutableDictionary *SendDD=nil;
            if([item objectForKey:@"SendDD"]){
                SendDD=[NSMutableDictionary dictionaryWithDictionary:[item objectForKey:@"SendDD"]];
            }
//            NSString *Url=[[item objectForKey:@"Url"] stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLFragmentAllowedCharacterSet]];
            NSString *Url=[item objectForKey:@"Url"];
            NSString *reqType=@"GET";
            
            if(SendDD==nil){//GET
                reqType=@"GET";
            }else{//POST
                reqType=@"POST";
            }
            
            int DWay=[[item objectForKey:@"DWay"] intValue];
            AFHTTPRequestOperationManager *manager=[AFHTTPRequestOperationManager manager];
            if (Lib_DataWay_XML==DWay) {
                manager.responseSerializer=[AFXMLParserResponseSerializer serializer];
            }else if (Lib_DataWay_JSON==DWay){
                manager.responseSerializer = [AFHTTPResponseSerializer serializer];
            }
            
            if([reqType isEqualToString:@"GET"]){//GET 请求
                [manager GET:Url parameters:nil success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
                    [self ParserResult:operation isok:YES];
                } failure:^(AFHTTPRequestOperation * _Nullable operation, NSError * _Nonnull error) {
                    [self ParserResult:operation isok:NO];
                }];
            }else if ([reqType isEqualToString:@"POST"]){//POST 请求
                
                NSArray *dataArray;//文件数组
                for (id item in SendDD){
                    if ([item rangeOfString:@"file_file"].location != NSNotFound) {
                        dataArray=SendDD[@"file_file"];
                        [SendDD removeObjectForKey:@"file_file"];
                        break;
                    }
                }
                if(dataArray.count){
                    [manager POST:Url parameters:SendDD constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
                        
                        for (int i=0; i<dataArray.count;i++) {
                            KDNetHttpReqFileModel *dataModel=dataArray[i];
                            
                            [formData appendPartWithFileData:dataModel.fileData name:dataModel.name fileName:dataModel.fileName mimeType:dataModel.mimeType];
                        }
                        
                    } success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
                        
                        [self ParserResult:operation isok:YES];
                        
                    } failure:^(AFHTTPRequestOperation * _Nullable operation, NSError * _Nonnull error) {
                        [self ParserResult:operation isok:NO];
                        
                    }];
                    
                }else{
                    [manager POST:Url parameters:SendDD success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
                        [self ParserResult:operation isok:YES];
                    } failure:^(AFHTTPRequestOperation * _Nullable operation, NSError * _Nonnull error) {
                        [self ParserResult:operation isok:NO];
                    }];
                }
            }
            self.m_NowReqNetDNA=[item objectForKey:@"NetDNA"];
        }
    }
}




-(void)ParserResult:(AFHTTPRequestOperation *)rq isok:(BOOL)isok
{
    IO_IsNetIdle=TRUE;
    if([IO_RequestGroups count]==0) {NSLog(@"请求包已过期A.");return;}
    NSMutableDictionary *reqItem=[IO_RequestGroups objectAtIndex:0];
    NSString *NetDNA=[reqItem objectForKey:@"NetDNA"];
    id delegate=[reqItem objectForKey:@"delegate"];
    NSString *Url=[reqItem objectForKey:@"Url"];
    NSString *LocalFN=[NSString stringWithFormat:@"%@%@",[KDNetUtil md5:Url], @"_.bak"];
    BOOL isNecessary=FALSE;
    BOOL SaveToLocal=FALSE;
    int trycount=0;
    if([reqItem objectForKey:@"isNecessary"]) isNecessary=[[reqItem objectForKey:@"isNecessary"] boolValue];
    if([reqItem objectForKey:@"trycount"]) trycount=[[reqItem objectForKey:@"trycount"] intValue];
    if([reqItem objectForKey:@"SaveToLocal"]) SaveToLocal=[[reqItem objectForKey:@"SaveToLocal"] boolValue];
    if (delegate==NULL||delegate==nil) delegate=IO_Delegate;
    
    if (isok) {//成功返回
        NSLog(@"返回成功[%d][%d][%@][%@]",isok,SaveToLocal,rq.responseString,rq.response.URL.absoluteString);
        if([m_NowReqNetDNA isEqualToString:NetDNA]){
            if(SaveToLocal){
                BOOL isSuc;
                [KDNetUtil SDTLF:[rq responseData] path:lcps_rqtxml fname:LocalFN iSuc:&isSuc];
            }
            NSData *data=[rq responseData];
            IO_DataReciveSum+=data.length;
            [IO_RequestGroups removeObjectAtIndex:0];[self SetNData:data reqItem:reqItem];
        }else NSLog(@"请求包已过期B.");
        [self SendRequest];
    }else{//返回失败
        if(SaveToLocal){
            BOOL isSuc;
            NSString *savefp=[KDNetUtil SDTLF:nil path:lcps_rqtxml fname:LocalFN iSuc:&isSuc];
            NSData *data = [NSData dataWithContentsOfFile:savefp];
            if(data==nil){
                NSError*error=[rq error];
                [reqItem setObject:[NSString stringWithFormat:@"%d",trycount+1] forKey:@"trycount"];
                NSLog(@"已尝试［%d］次 isNecessary:%d  SaveToLocal:%d  error:%@",trycount,isNecessary,SaveToLocal,error);
                if(trycount>=(2-1)){
                    if ([delegate respondsToSelector:@selector(OnHttpErrorBack:)]){
                        [delegate OnHttpErrorBack:reqItem];
                    }
                    if(!isNecessary){[IO_RequestGroups removeObjectAtIndex:0];NSLog(@"请求包自动删除.");}
                }
            }else{
                ;
                NSLog(@"返回成功(缓存)[%d][%d][%@][%@]",isok,SaveToLocal,[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding],Url);
                [self SetNData:data reqItem:reqItem];[IO_RequestGroups removeObjectAtIndex:0];
            }
            
        }else{
            NSError*error=[rq error];
            [reqItem setObject:[NSString stringWithFormat:@"%d",trycount+1] forKey:@"trycount"];
            NSLog(@"已尝试［%d］次 isNecessary:%d  SaveToLocal:%d  error:%@",trycount,isNecessary,SaveToLocal,error);
            if(trycount>=(2-1)){
                if ([delegate respondsToSelector:@selector(OnHttpErrorBack:)]){
                    [delegate OnHttpErrorBack:reqItem];
                }
                if(!isNecessary){[IO_RequestGroups removeObjectAtIndex:0];NSLog(@"请求包自动删除.");}
            }
        }
        [self performSelector:@selector(SendRequest) withObject:nil afterDelay:4];
    }
}

-(void)SetNData:(NSData*)data reqItem:(NSDictionary *)reqItem{
    NSString *api=[reqItem objectForKey:@"api"];
    int DWay=[[reqItem objectForKey:@"DWay"] intValue];
    id delegate=[reqItem objectForKey:@"delegate"];
    if (Lib_DataWay_XML==DWay) {
        if ([delegate respondsToSelector:@selector(OnHttpDataBack:responseDWay:data:userInfo:)]) [delegate OnHttpDataBack:api responseDWay:DWay data:data userInfo:self.userInfo];
    }else if (Lib_DataWay_JSON==DWay){
        if ([delegate respondsToSelector:@selector(OnHttpDataBack:responseDWay:data:userInfo:)]) [delegate OnHttpDataBack:api responseDWay:DWay data:data userInfo:self.userInfo];
    }else{
        NSLog(@"** HTTP ParserResult **.");
    }
}



@end
//====================================================================
//====================================================THE END=========
//====================================================================
