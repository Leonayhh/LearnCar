//
//  HKSinglePickerView
//  AppleDP
//  单列数据选择器
//  Created by ly on 15/6/4.
//  Copyright (c) 2015年 kedll. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HKSinglePickerView;

@protocol HKSinglePickerViewDelegate <NSObject>

-(void)didSinglePickerViewSelected:(HKSinglePickerView*)picker;

@end

@interface HKSinglePickerView : UIView<UIPickerViewDataSource,UIPickerViewDelegate>
{

}

@property (strong, nonatomic) NSArray *dataSource;

@property(nonatomic,assign)NSInteger selectRow;
@property(nonatomic,weak)id<HKSinglePickerViewDelegate> delegate;
@property (nonatomic,strong) UIButton *handerView;
@property (nonatomic,strong) UIPickerView *dataPicker;
@property(nonatomic,strong)UIView *toolBar;
@property(nonatomic,strong)UIButton *CancleBtn;
@property(nonatomic,strong)UIButton *ConfirmBtn;

-(void)show;

@end
