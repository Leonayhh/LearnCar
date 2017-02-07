//
//  XYAreaPickerView
//  AppleDP
//
//  Created by ly on 15/6/4.
//  Copyright (c) 2015年 kedll. All rights reserved.
//

#import "XYAreaPickerView.h"
@implementation XYAreaPickerView

@synthesize handerView,toolBar,CancleBtn,ConfirmBtn,dataPicker,dataSource,compentArray1,compentArray2,compentArray3,row1,row2,row3;

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor=HKRGBColor(33.0, 39.0, 53.0, 1);
        dataSource=[NSArray array];
        compentArray1=[NSArray array];
        compentArray2=[NSArray array];
        compentArray3=[NSArray array];
        row1=0;
        row2=0;
        row3=0;
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
    if(self.dataSource){
        compentArray1=self.dataSource;
    }
    if(compentArray1.count){
        compentArray2=compentArray1[row1][@"list"];
    }
    if(compentArray2.count){
        compentArray3=compentArray2[row2][@"list"];
    }
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
    return 3;
}

// pickerView 每列个数
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    
    switch (component) {
        case 0:
            return compentArray1.count;
            break;
        case 1:
           return compentArray2.count;
            break;
        case 2:
            return compentArray3.count;
            break;
        default:
            return 0;
            break;
    }
}

// 每列宽度
- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component {
    
    return self.width/3;
}


//返回当前行的内容,此处是将数组中数值添加到滚动的那个显示栏上
-(NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    
    switch (component) {
        case 0:
            return compentArray1[row][@"title"];
            break;
        case 1:
            return compentArray2[row][@"title"];
            break;
        case 2:
             return compentArray3[row][@"title"];
        default:
            return 0;
            break;
    }
    
    return  @"";
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    switch (component) {
        case 0:{
            
            row1=row;
            row2=0;
            row3=0;
            [self initData];
            [dataPicker reloadComponent:1];
            [dataPicker selectRow:row2 inComponent:1 animated:YES];
            [dataPicker reloadComponent:2];
            [dataPicker selectRow:row3 inComponent:2 animated:YES];
            
            break;
        }
        case 1:
        {
            row2=row;
            row3=0;
            [self initData];
            [dataPicker reloadComponent:2];
            [dataPicker selectRow:0 inComponent:2 animated:YES];
            break;
        }
        case 2:{
            row3=row;
            [self initData];
            break;
        }
        
        default:
            break;
    }
    
   
    
}



#pragma mark-onToolBarBtnClick
-(void)onToolBarBtnClick:(UIButton *)btn{
    if(btn==ConfirmBtn){
        if([self.delegate respondsToSelector:@selector(didAreaPickerViewSelected:)]){
            [self.delegate didAreaPickerViewSelected:self];
        }
    }
    [self dissmiss];
}


@end
