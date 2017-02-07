//
//  XYAreaPickerView
//  AppleDP
//  城市选择器
//  Created by ly on 15/6/4.
//  Copyright (c) 2015年 kedll. All rights reserved.
//

#import <UIKit/UIKit.h>
@class XYAreaPickerView;
@protocol XYAreaPickerViewDelegate <NSObject>

-(void)didAreaPickerViewSelected:(XYAreaPickerView*)picker;

@end

@interface XYAreaPickerView : UIView<UIPickerViewDataSource,UIPickerViewDelegate>
{

}

@property (strong, nonatomic) NSArray *dataSource;
@property (strong, nonatomic) NSArray *compentArray1;
@property (strong, nonatomic) NSArray *compentArray2;
@property (strong, nonatomic) NSArray *compentArray3;

@property (nonatomic, assign) NSInteger row1;
@property (nonatomic, assign) NSInteger row2;
@property (nonatomic, assign) NSInteger row3;

@property(nonatomic,assign)NSInteger selectRow;
@property(nonatomic,weak)id<XYAreaPickerViewDelegate> delegate;
@property (nonatomic,strong) UIButton *handerView;
@property (nonatomic,strong) UIPickerView *dataPicker;
@property(nonatomic,strong)UIView *toolBar;
@property(nonatomic,strong)UIButton *CancleBtn;
@property(nonatomic,strong)UIButton *ConfirmBtn;
-(void)show;

@end
