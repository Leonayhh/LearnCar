//
//  XYDatePickerView
//  AppleDP
//
//  Created by ly on 15/6/4.
//  Copyright (c) 2015年 kedll. All rights reserved.
//

#import "XYDatePickerView.h"
@implementation XYDatePickerView

@synthesize handerView,toolBar,CancleBtn,ConfirmBtn,datePicker;

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor=HKRGBColor(33.0, 39.0, 53.0, 1);
     
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

-(void)initSubView{
    [self initToolBarView];
    
    handerView = [UIButton buttonWithType:UIButtonTypeCustom];
    [handerView setFrame:[UIScreen mainScreen].bounds];
    handerView.hidden=YES;
    handerView.backgroundColor=[UIColor colorWithWhite:0 alpha:0.5];
    //    [handerView addTarget:self action:@selector(dissmiss) forControlEvents:UIControlEventTouchUpInside];
    [handerView addSubview:self];
    
    datePicker = [[UIDatePicker alloc] init];
    datePicker.datePickerMode = UIDatePickerModeDate;
    datePicker.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"];
    NSDateComponents *dc = [[NSDateComponents alloc] init];
    dc.year = 2022;
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    datePicker.maximumDate = [gregorian dateFromComponents:dc];

    datePicker.frame=CGRectMake(0, 44, self.width ,self.height-toolBar.height);
    
    self.frame=CGRectMake(0, handerView.height, self.width, self.height);
    [self addSubview:datePicker];
    
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    [window addSubview:handerView];
    
    [self changePickerColor];
    
}

-(void)show{
    
    [UIView animateWithDuration:0.3 animations:^{
         handerView.hidden=NO;
        self.frame=CGRectMake(0, handerView.height-self.height, self.width, self.height);;
        
    } completion:^(BOOL finished) {
        
        
    }];

    
}

-(void)dissmiss{
  
    
    [UIView animateWithDuration:0.3 animations:^{
        self.frame=CGRectMake(0, handerView.height, self.width, self.height);;
    } completion:^(BOOL finished) {
         handerView.hidden=YES;
    }];
}


#pragma mark-onToolBarBtnClick
-(void)onToolBarBtnClick:(UIButton *)btn{
    if(btn==ConfirmBtn){
        if([self.delegate respondsToSelector:@selector(XYDatePickerView:didSelectDate:)]){
            [self.delegate XYDatePickerView:self didSelectDate:datePicker.date];
        }
    }
    [self dissmiss];
}

/**
 *  通过Runtime修改UIdatePicker的字体颜色
 */
-(void)changePickerColor{
    unsigned outCount;
    int i;
    objc_property_t *pProperty = class_copyPropertyList([UIDatePicker class], &outCount);
    for (i = outCount -1; i >= 0; i--)
    {
        // 循环获取属性的名字   property_getName函数返回一个属性的名称
        NSString *getPropertyName = [NSString stringWithCString:property_getName(pProperty[i]) encoding:NSUTF8StringEncoding];
        NSString *getPropertyNameString = [NSString stringWithCString:property_getAttributes(pProperty[i]) encoding:NSUTF8StringEncoding];
        if([getPropertyName isEqualToString:@"textColor"])
        {
            [datePicker setValue:[UIColor whiteColor] forKey:@"textColor"];
        }
        
        NSLog(@"%@====%@",getPropertyNameString,getPropertyName);
    }
    
}

@end
