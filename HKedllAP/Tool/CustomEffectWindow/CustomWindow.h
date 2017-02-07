//
//  CustomWindow.h
//  CustomWindow
//
//  Created by 进超王 on 16/10/19.
//  Copyright © 2016年 进超王. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, CustomBackgroundWindowStyle) {
    CustomBackgroundStyleWindowGradient = 0,
    CustomBackgroundStyleWindowSolid,
};
@interface CustomWindow : UIWindow


@property (nonatomic) CustomBackgroundWindowStyle style;

@end







