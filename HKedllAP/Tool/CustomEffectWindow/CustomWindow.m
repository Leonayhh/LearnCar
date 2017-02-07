//
//  CustomWindow.m
//  CustomWindow
//
//  Created by 进超王 on 16/10/19.
//  Copyright © 2016年 进超王. All rights reserved.
//

#import "CustomWindow.h"

const UIWindowLevel UIWindowCustomLevel = 1999.0;
const UIWindowLevel UIWindowCustomLevelBacground = 1998.0;

@implementation CustomWindow

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        self.opaque = NO;
        self.windowLevel = UIWindowCustomLevel;
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    switch (self.style) {
        case CustomBackgroundStyleWindowGradient:
        {
            size_t locationsCount = 2;
            CGFloat locations[2] = {0.0f, 1.0f};
            CGFloat colors[8] = {0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f};
            CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
            CGGradientRef gradient = CGGradientCreateWithColorComponents(colorSpace, colors, locations, locationsCount);
            CGColorSpaceRelease(colorSpace);
            
            CGPoint center = CGPointMake(self.bounds.size.width / 2, self.bounds.size.height / 2);
            CGFloat radius = MIN(self.bounds.size.width, self.bounds.size.height) ;
            CGContextDrawRadialGradient (context, gradient, center, 0, center, radius, kCGGradientDrawsAfterEndLocation);
            CGGradientRelease(gradient);
            break;
        }
        case CustomBackgroundStyleWindowSolid:
        {
            [UIView animateWithDuration:0.5 animations:^{
                [[UIColor colorWithWhite:0 alpha:0.5] set];
                CGContextFillRect(context, self.bounds);
            }];
            break;
        }
    }
}



@end
