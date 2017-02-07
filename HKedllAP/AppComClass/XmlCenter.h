//
//  FileManager.h
//  Xml解析工具类
//  Created by kedll on 2015年11月18日.
//  Copyright (c) 2014年 ly. All rights reserved.
//
@interface XmlCenter : NSObject<NSXMLParserDelegate>
{
    NSXMLParser          *m_XMLParser;
    NSString             *TmpPath;
    NSMutableArray       *Rdata;
    NSMutableString      *CurrentElement;
    NSMutableString      *TmpValue;
	NSMutableDictionary  *DicForParse;
    int                   Classid;
    BOOL                  m_BadData;
}
-(BOOL)start:(NSString*)file data:(NSData*)data;
-(void)end;
-(BOOL)GBPS:(NSString*)path data:(NSMutableArray*)data;
-(NSMutableArray*)getArrByClassID:(int)cid root:(NSMutableArray*)root;
+(id)ReqVNode:(NSArray*)arr path:(NSString*)path idxslf:(BOOL)idxslf;
+(id)ReqHNode:(NSArray*)arr key:(NSString*)key idxslf:(BOOL)idxslf;
@end
//====================================================================
//=============================================Create by aidfen=======
//====================================================================