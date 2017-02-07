//
//  XYUtils.m
//  GangQinEJia
//
//  Created by ly on 15/12/3.
//  Copyright © 2015年 kedll. All rights reserved.
//

#import "XYUtils.h"

@implementation XYUtils


+(id)GetSharedObj:(int)cmd{
    UIApplication *app=[UIApplication sharedApplication];
    if (cmd==0) return app;
    else if(cmd==1) return [[app windows] objectAtIndex:0];
    return nil;
}

+(UIViewController *)getCurrentRootViewController {
    
    
    UIViewController *result;
    
    
    // Try to find the root view controller programmically
    
    
    // Find the top window (that is not an alert view or other window)
    
    
    UIWindow *topWindow = [[UIApplication sharedApplication] keyWindow];
    
    
    if (topWindow.windowLevel != UIWindowLevelNormal)
        
        
    {
        
        NSArray *windows = [[UIApplication sharedApplication] windows];
        
        
        for(topWindow in windows)
            
            
        {
            
            if (topWindow.windowLevel == UIWindowLevelNormal)
                
                
                break;
            
        }
    }
    
    UIView *rootView = [[topWindow subviews] objectAtIndex:0];
    
    
    id nextResponder = [rootView nextResponder];
    
    if ([nextResponder isKindOfClass:[UIViewController class]])
        
        
        result = nextResponder;
    
    
    else if ([topWindow respondsToSelector:@selector(rootViewController)] && topWindow.rootViewController != nil)
        
        
        result = topWindow.rootViewController;
    
    
    else
        
        NSAssert(NO, @"ShareKit: Could not find a root view controller.  You can assign one manually by calling [[SHK currentHelper] setRootViewController:YOURROOTVIEWCONTROLLER].");
    
    return result;    
    
    
}
@end
