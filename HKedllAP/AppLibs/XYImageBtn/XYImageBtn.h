//
//  XYImageBtn.h
//  GangQinEJia
//  图片按钮
//  Created by ly on 15/11/20.
//  Copyright © 2015年 kedll. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XYImageBtn : XYButton

@property(nonatomic,assign)CGFloat titleWidth;
@property(nonatomic,assign)CGFloat titleHeight;
@property(nonatomic,assign)CGFloat imgWidth;
@property(nonatomic,assign)CGFloat imgHeight;
@property(nonatomic,strong)UIImageView *btnImageView;

@property(nonatomic,strong)UILabel *btnTitleView;

-(void)startCreate;
@end
