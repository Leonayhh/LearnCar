#import <Foundation/Foundation.h>
#import "XmlCenter.h"
//====================================================================
//=====应用HTTP解析中心=================================================
//====================================================================
@interface HKAppURC:NSObject
{
    
}



-(NSMutableDictionary *)Parser:(NSString*)api data:(NSData*)data;
@end
//====================================================================
//=============================================Create by aidfen=======
//====================================================================