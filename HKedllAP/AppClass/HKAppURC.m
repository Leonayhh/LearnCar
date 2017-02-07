#import "HKAppURC.h"
//====================================================================
//=====应用HTTP解析中心=================================================
//====================================================================
#define root_result             @"/root/result"
@implementation HKAppURC

-(NSMutableDictionary *)Parser:(NSString*)api data:(NSData*)data{
    NSMutableDictionary *RecivDD=[NSMutableDictionary dictionary];
    NSArray *RList=[NSMutableArray array];
    [RecivDD setObject:RList forKey:@"RList"];

    NSMutableArray * tmparr=[[NSMutableArray alloc] init];
    XmlCenter      * xmler=[[XmlCenter alloc] init];
    [xmler start:nil data:data];
    [xmler GBPS:root_result data:tmparr];
    //标志解析
    if (tmparr.count>0) {
        NSDictionary *tmpdic=(NSDictionary*)[tmparr objectAtIndex:0];
        for (NSString *key in tmpdic) {
            if(![key isEqualToString:@"list"])[RecivDD setObject:[tmpdic objectForKey:key] forKey:key];
        }
    }else {[RecivDD setObject:@"440" forKey:@"code"];[RecivDD setObject:@"网络异常" forKey:@"msg"];}

    //正文解析
    NSString *code=[RecivDD objectForKey:@"code"];
    
    
    
    if (code&&[code isEqualToString:@"200"]) {

        if ([api isEqualToString:api_Version]||[api isEqualToString:api_AreaData]||[api isEqualToString:api_AMAPI_KeepHeart]){
            if (tmparr.count>0) {
                NSDictionary *tmpdic=[tmparr objectAtIndex:0];
                NSMutableArray *tmplist=[tmpdic objectForKey:@"list"];
                if (tmplist.count>0) {
                    NSMutableArray*RList =[RecivDD objectForKey:@"RList"];[RList removeAllObjects];
                    for (NSDictionary *subitem in tmplist) [RList addObject:subitem];
                }
            }
        }
        
        if ([api isEqualToString:api_ListCenter]){
            if (tmparr.count>0) {
                NSDictionary *tmpdic=[tmparr objectAtIndex:0];
                NSMutableArray *tmplist=[tmpdic objectForKey:@"list"];
                if (tmplist.count>0) {
                    NSMutableArray*List =[RecivDD objectForKey:@"RList"];
                    NSDictionary *tmpdic__=[tmplist objectAtIndex:0];
                    NSMutableArray *tmplist__=[tmpdic__ objectForKey:@"list"];
                    NSString *SumPage=@"0";if([tmpdic__ objectForKey:@"SumPage"])SumPage=[tmpdic__ objectForKey:@"SumPage"];
                    NSString *SumRecord=@"0";if([tmpdic__ objectForKey:@"SumRecord"])SumRecord=[tmpdic__ objectForKey:@"SumRecord"];
                    NSString *rid=@"0";if([tmpdic__ objectForKey:@"id"])rid=[tmpdic__ objectForKey:@"id"];[RecivDD setObject:rid forKey:@"id"];
                    NSString *bid=@"0";if([tmpdic__ objectForKey:@"sid"])bid=[tmpdic__ objectForKey:@"sid"];[RecivDD setObject:bid forKey:@"sid"];
                    [RecivDD setObject:SumPage forKey:@"SumPage"];
                    [RecivDD setObject:SumRecord forKey:@"SumRecord"];
                    [RecivDD setObject:[NSNumber numberWithUnsignedLong:tmplist__.count] forKey:@"newcount"];
                    for (NSDictionary *subitem in tmplist__) [List addObject:subitem];
                }
            }
        }
        
        if ([api isEqualToString:api_PostCGMsg]||[api isEqualToString:api_ComHtmlPage]||[api isEqualToString:api_AMAPI_signin]){
            if (tmparr.count>0) {
                NSDictionary *tmpdic=[tmparr objectAtIndex:0];
                NSMutableArray *list=[tmpdic objectForKey:@"list"];
                NSMutableDictionary*RRDic=[RecivDD objectForKey:@"RRDic"];
                for (NSDictionary *subitem in list) {
                    NSMutableArray *slist=[subitem objectForKey:@"list"];
                    NSString *stitle=[subitem objectForKey:@"tn"];
                    NSString *value=[subitem objectForKey:@"value"];
                    if (slist.count>0) [RRDic setObject:slist forKey:stitle];
                    else [RRDic setObject:value forKey:stitle];
                }
            }
        }
        
        if([api isEqualToString:api_AMAPI_userinfo]||[api isEqualToString:api_CAPool_ClientLogin]||[api isEqualToString:api_CAPool_ClientRegister]||[api isEqualToString:api_AMAPI_SimplePlanCmd]||[api isEqualToString:api_AFU2012_PostFilesTS]||[api isEqualToString:api_VerificationSMS]||[api isEqualToString:api_type_UpdHeaderImg]||[api isEqualToString:api_IsUSExits]||[api isEqualToString:api_GetTokenBySMS]||[api isEqualToString:api_cmd__UserInfo]){
            if(tmparr.count>0){
                NSDictionary *tmpdic=[tmparr objectAtIndex:0];
                NSMutableArray *list=[tmpdic objectForKey:@"list"];
                for (NSDictionary *subitem in list) {
                    [RecivDD setObject:subitem forKey:[subitem objectForKey:@"tn"]];
                }
            }
        }
       
    }

    return RecivDD;
    //结束
}

@end
//====================================================================
//====================================================THE END=========
//====================================================================
