//
//  FileManager.h
//
//  Xml解析工具类
//  Created by kedll on 2015年11月18日.
//  Copyright (c) 2014年 ly. All rights reserved.
//

#import "XmlCenter.h"
#import "Util.h"
//====================================================================
//=====XmlCenter==============================create by aidfen =======
//====================================================================
@implementation XmlCenter
- (id)init
{
	self = [super init];
    if (self){m_BadData=NO;m_XMLParser=nil;TmpPath=nil;}
    return self;
}
//判断当前的的沙和路径下是否有此文件
-(BOOL)start:(NSString*)file data:(NSData*)data
{
    if(file!=nil&&data==nil)data = [NSData dataWithContentsOfFile: file];
    if(data!=nil){
        m_XMLParser = [[NSXMLParser alloc] initWithData: data];
        [m_XMLParser setDelegate:self];
        return TRUE;
    }else return FALSE;
}

-(void)end{m_XMLParser=nil;}

-(BOOL)GBPS:(NSString*)path data:(NSMutableArray*)data
{
    BOOL result=FALSE;
    if (m_XMLParser!=nil&&path!=nil) {
        TmpPath=path;
        Rdata=data;
        Classid=0;
        m_BadData=NO;
        CurrentElement = [[NSMutableString alloc] initWithString:@"R:"];
        result=[m_XMLParser parse];
        CurrentElement=nil;
    }
    return result;
    

}

-(NSMutableArray*)getArrByClassID:(int)cid root:(NSMutableArray*)root
{
    cid--;
    NSMutableDictionary*lastobj=[root lastObject];
    NSMutableArray *list=[lastobj objectForKey:@"list"];
    if (list!=nil){if (cid>=1) return [self getArrByClassID:cid root:list];else return list;}else return root;
}

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qualifiedName attributes:(NSDictionary *)attributeDict{
	if (CurrentElement!=nil&&!m_BadData) {
		[CurrentElement appendString:[NSString stringWithFormat:@"/%@",elementName]];
        m_BadData=[[CurrentElement lowercaseString] rangeOfString:@"r:/root"].location == NSNotFound;
        if ([CurrentElement rangeOfString:TmpPath].location != NSNotFound){
            DicForParse=[[NSMutableDictionary alloc] initWithDictionary:attributeDict];
            NSMutableArray *list=[[NSMutableArray alloc] init]; [DicForParse setObject:list forKey:@"list"];
            if(Classid==0) [Rdata addObject:DicForParse]; 
            else {NSMutableArray *pobj=[self getArrByClassID:Classid root:Rdata];[pobj addObject:DicForParse];}
            TmpValue=[[NSMutableString alloc] initWithString:@""]; [DicForParse setObject:TmpValue forKey:@"value"];
            [DicForParse setObject:elementName forKey:@"tn"];
            DicForParse=nil;
            Classid++;
        }
	}
}

-(void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string{
	if (CurrentElement!=nil&&!m_BadData) {
        NSString *body = [string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
        if ([CurrentElement rangeOfString:TmpPath].location != NSNotFound&&body.length>0)
        {[TmpValue  appendString:[NSString stringWithFormat:@"%@",body]];}
	}
}

-(void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
	if (CurrentElement!=nil&&!m_BadData) {
        if ([CurrentElement rangeOfString:TmpPath].location != NSNotFound) Classid--;
        [CurrentElement appendString:@"/"];
        [self MReplace:CurrentElement fdstr:[NSString stringWithFormat:@"/%@/",elementName] rpstr:@""];
	}
}

+(id)ReqVNode:(NSArray*)arr path:(NSString*)path idxslf:(BOOL)idxslf{
    NSArray *PArr=[path componentsSeparatedByString:@"/"];
    id rst=nil;
    for (NSString *key in PArr) {
        if(rst)arr=idxslf?[rst objectForKey:@"list"]:rst;
        rst=[self ReqHNode:arr key:key idxslf:idxslf];
        if(rst==nil) break;
    }
    return rst;
}

+(id)ReqHNode:(NSArray*)arr key:(NSString*)key idxslf:(BOOL)idxslf{
    for (NSDictionary *dic in arr)
    {if([[dic objectForKey:@"tn"] isEqualToString:key]) return idxslf?dic:[dic objectForKey:@"list"];}
    return nil;
}

- (void)parserDidEndDocument:(NSXMLParser *)parser{}


//字符串替换
-(void)MReplace:(NSMutableString*)str fdstr:(NSString*)fdstr rpstr:(NSString*)rpstr{
    NSRange range=[str rangeOfString:fdstr];
    if(range.length>0)[str replaceCharactersInRange:range withString:rpstr];
}


@end
//====================================================================
//====================================================THE END=========
//====================================================================