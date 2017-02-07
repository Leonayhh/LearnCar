//
//  XYAreaPickerView
//  AppleDP
//  日期选择器
//  Created by ly on 15/6/4.
//  Copyright (c) 2015年 kedll. All rights reserved.
//

#import <UIKit/UIKit.h>
@class XYDatePickerView;

@protocol XYDatePickerViewDelegate <NSObject>

-(void)XYDatePickerView:(XYDatePickerView*)picker didSelectDate:(NSDate *)date;

@end

@interface XYDatePickerView : UIView
{

}

@property(nonatomic,assign)NSInteger selectRow;
@property(nonatomic,weak)id<XYDatePickerViewDelegate> delegate;
@property (nonatomic,strong) UIButton *handerView;
@property (nonatomic,strong) UIDatePicker *datePicker;
@property(nonatomic,strong)UIView *toolBar;
@property(nonatomic,strong)UIButton *CancleBtn;
@property(nonatomic,strong)UIButton *ConfirmBtn;
-(void)show;

@end
