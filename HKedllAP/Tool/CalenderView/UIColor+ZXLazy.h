//
//  UIColor+ZXLazy.h
//  Aier360
//
//  Created by 王进超 on 15/11/10.
//  Copyright Copyright © 2016年 王进超. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (ZXLazy)
+ (UIColor *)colorWithRed:(NSInteger)red green:(NSInteger)green blue:(NSInteger)blue;

/**
 *  16进制转uicolor
 *
 *  @param color @"#FFFFFF" ,@"OXFFFFFF" ,@"FFFFFF"
 *
 *  @return uicolor
 */
+ (UIColor *)colorWithHexString:(NSString *)color;
@end
