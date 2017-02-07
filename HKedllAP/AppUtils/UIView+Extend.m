//
//  UIView+Extend.m
//  CLFZS
//
//  Created by jysd on 14/12/19.
//  Copyright (c) 2014年 jysd. All rights reserved.
//

#import "UIView+Extend.h"

@implementation UIView (Extend)

//判断UIView 所在的UIViewController
- (UIViewController *)viewController{
    for (UIView *next=[self superview]; next ;next=[next superview]) {
        UIResponder *responder=[next nextResponder];
        if([responder isKindOfClass:[UIViewController class]]){
            return (UIViewController *)responder;
        }
    }
      return nil;
}

@end
