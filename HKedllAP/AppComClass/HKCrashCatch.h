//
//  HKCrashCatch.h
//  HKedllAP
//
//  Created by ly on 16/5/10.
//  Copyright © 2016年 kedll. All rights reserved.
//

#import <Foundation/Foundation.h>
#define HKCrashCatchFilePath @"/Documents/error.log"
@interface HKCrashCatch : NSObject
{

}


void uncaughtExceptionHandler(NSException *exception);
@end
