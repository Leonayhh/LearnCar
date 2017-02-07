//
//  HKSinglePickerView
//  AppleDP
//
//  Created by ly on 15/6/4.
//  Copyright (c) 2015年 kedll. All rights reserved.
//

#import "HKSinglePickerView.h"

@implementation HKSinglePickerView

@synthesize handerView,toolBar,CancleBtn,ConfirmBtn,dataPicker,dataSource;

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor=HKRGBColor(33.0, 39.0, 53.0, 1);
        dataSource=[NSArray array];
        [self initSubView];
    }
    return self;
}

-(void)initToolBarView{
    toolBar=[[UIView alloc] initWithFrame:CGRectMake(0, 0, self.width, 44)];
    toolBar.backgroundColor=[UIColor clearColor];
    [self addSubview:toolBar];
    
    CancleBtn=[[UIButton alloc] initWithFrame:CGRectMake(0, 0, 80, toolBar.height)];
    [CancleBtn setTitle:@"取消" forState:0];
    [CancleBtn setTitleColor:[UIColor colorWithRed:33.0f/255.0f green:172.0f/255.0f blue:107.0f/255.0f alpha:1.0f] forState:0];
    [CancleBtn.titleLabel setFont:[UIFont systemFontOfSize:15]];
    [CancleBtn addTarget:self action:@selector(onToolBarBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [toolBar addSubview:CancleBtn];
    
    
    ConfirmBtn=[[UIButton alloc] initWithFrame:CGRectMake(toolBar.width-80, 0, 80, toolBar.height)];
    [ConfirmBtn setTitle:@"确定" forState:0];
    [ConfirmBtn setTitleColor:[UIColor colorWithRed:33.0f/255.0f green:172.0f/255.0f blue:107.0f/255.0f alpha:1.0f] forState:0];
    [ConfirmBtn.titleLabel setFont:[UIFont systemFontOfSize:16]];
    [ConfirmBtn addTarget:self action:@selector(onToolBarBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [toolBar addSubview:ConfirmBtn];
    
    UIView *sep=[[UIView alloc] initWithFrame:CGRectMake(0, toolBar.height-0.75, toolBar.width, 0.75)];
    sep.backgroundColor=UIColorFromRGB(0x3A4459, 1);
    [toolBar addSubview:sep];
}
-(void)initData{
    
}
-(void)initSubView{
    [self initToolBarView];
    
    handerView = [UIButton buttonWithType:UIButtonTypeCustom];
    [handerView setFrame:[UIScreen mainScreen].bounds];
    handerView.hidden=YES;
    handerView.backgroundColor=[UIColor colorWithWhite:0 alpha:0.5];
    //    [handerView addTarget:self action:@selector(dissmiss) forControlEvents:UIControlEventTouchUpInside];
    [handerView addSubview:self];
    
    dataPicker = [[UIPickerView alloc] init];
    // 显示选中框
    dataPicker.showsSelectionIndicator=NO;
    dataPicker.dataSource = self;
    dataPicker.delegate = self;
    dataPicker.frame=CGRectMake(0, 44, self.width ,self.height-toolBar.height);
    
    self.frame=CGRectMake(0, handerView.height, self.width, self.height);
    
    [self addSubview:dataPicker];
    
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    [window addSubview:handerView];
    
}


-(void)show{
    
    [self initData];
    
    [UIView animateWithDuration:0.3 animations:^{
        handerView.hidden=NO;
        self.frame=CGRectMake(0, handerView.height-self.height, self.width, self.height);;
        
    } completion:^(BOOL finished) {
        
        
    }];
    
    [dataPicker reloadAllComponents];
    
}

-(void)dissmiss{
    
    
    [UIView animateWithDuration:0.3 animations:^{
        self.frame=CGRectMake(0, handerView.height, self.width, self.height);;
    } completion:^(BOOL finished) {
        handerView.hidden=YES;
    }];
}

#pragma mark-UIPickerViewDelegate
- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view{
    UILabel* pickerLabel = (UILabel*)view;
    if (!pickerLabel){
        pickerLabel = [[UILabel alloc] init];
        [pickerLabel setTextAlignment:NSTextAlignmentCenter];
        [pickerLabel setBackgroundColor:[UIColor clearColor]];
        pickerLabel.textColor=[UIColor whiteColor];
        [pickerLabel setFont:[UIFont systemFontOfSize:22]];
    }
    pickerLabel.text=[self pickerView:pickerView titleForRow:row forComponent:component];
    return pickerLabel;
}


// pickerView 列数
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

// pickerView 每列个数
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return dataSource.count;
}

// 每列宽度
- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component {
    
    return self.width;
}


//返回当前行的内容,此处是将数组中数值添加到滚动的那个显示栏上
-(NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return dataSource[row][@"title"];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    
    self.selectRow=row;
}



#pragma mark-onToolBarBtnClick
-(void)onToolBarBtnClick:(UIButton *)btn{
    if(btn==ConfirmBtn){
        if([self.delegate respondsToSelector:@selector(didSinglePickerViewSelected:)]){
            [self.delegate didSinglePickerViewSelected:self];
        }
    }
    [self dissmiss];
}


@end
