//
//  XYPopBubbleLIstView
//  AppleDP
//  气泡列表弹出视图
//  Created by ly on 15/6/4.
//  Copyright (c) 2015年 kedll. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface XYPopBubbleLIstView : UIView
/**
 *  创建气泡列表弹出视图
 *
 *  @param frame      尺寸
 *  @param selectData 选择控件的数据源
 *  @param action     点击回调方法
 *  @param animate    是否动画弹出
 */
+ (void)addPellTableViewSelectWithWindowFrame:(CGRect)frame
                                   selectData:(NSArray *)selectData
                                       images:(NSArray *)images
                                       action:(void(^)(NSInteger index))action animated:(BOOL)animate
                                        backgroudColor:(UIColor *)bgColor;
/**
 *  手动隐藏
 */
+ (void)hiden;
@end
