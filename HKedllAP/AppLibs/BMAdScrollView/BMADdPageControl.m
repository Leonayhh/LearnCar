//
//  BMADdPageControl.m
//  AppleDP
//
//  Created by ly on 15/5/30.
//  Copyright (c) 2015年 kedll. All rights reserved.
//

#import "BMADdPageControl.h"
#define dotSize 6.0f
@implementation BMADdPageControl

/**
 *  改变pageControl中点的大小
 */
- (void)setCurrentPage:(NSInteger)page{
    [super setCurrentPage:page];
    for (NSUInteger subviewIndex = 0; subviewIndex < [self.subviews count]; subviewIndex++) {
        UIImageView* subview = [self.subviews objectAtIndex:subviewIndex];
        CGSize size;
        size.height = dotSize;
        size.width = dotSize;
        [subview setFrame:CGRectMake(subview.frame.origin.x, subview.frame.origin.y, size.width,size.height)];
        if (subviewIndex == page) {
            [subview setBackgroundColor:self.currentPageIndicatorTintColor];
        } else {
            [subview setBackgroundColor:self.pageIndicatorTintColor];
        }
    }
}

@end
