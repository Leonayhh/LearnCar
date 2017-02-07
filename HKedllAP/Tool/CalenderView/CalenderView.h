//
//  CalenderView.h
//  日历表
//
//  Created by apple on 16/6/14.
//  Copyright © 2016年 王进超. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CalenderViewDelegate <NSObject>

@optional
- (void)itemClick:(NSString *)selctTime;

@end


@interface CalenderView : UIView

@property (nonatomic, assign) NSInteger nowTime;

@property (nonatomic,assign) BOOL isTrans;

@property (nonatomic, strong) NSString *currentDateStr;

@property (nonatomic, strong) NSString *sendStr;

@property (nonatomic, strong) NSString *currenter;

@property (nonatomic, weak) id<CalenderViewDelegate>  mDelegate;

-(instancetype)initWithFrame:(CGRect)frame WithStr:(NSString *)dateStr;

@end
