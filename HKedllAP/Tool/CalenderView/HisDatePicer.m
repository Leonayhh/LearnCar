//
//  HisDatePicer.h
//  FWatch
//
//  Created by mac003-20130924 on 16/6/22.
//  Copyright © 2016年 newMac002. All rights reserved.
//
#define BTNWIDTH   [UIScreen mainScreen].bounds.size.width/2
#import "HisDatePicer.h"

@implementation HisDatePicer
{
    long long  TimeStamp;
    
    NSMutableArray *minutesArray;
    NSMutableArray * hoursArray;
    NSString *hours;
    NSString *minutes;
    
}
/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */
-(id)initWithFrame:(CGRect)frame{
    if (self==[super initWithFrame:frame]) {
        
        
        hoursArray=[[NSMutableArray alloc]init];
        minutesArray = [[NSMutableArray alloc]init];
        for (int i = 0; i < 24; i ++) {
            
            NSString *string =[NSString stringWithFormat:@"%02d",i];
            [hoursArray addObject:string];
        }
        for (int i = 0; i < 60; i ++) {
            
            NSString *string =[NSString stringWithFormat:@"%02d",i];
            
            [minutesArray addObject:string];
        }
        
        _bigArr =[[NSArray alloc]initWithObjects:hoursArray,minutesArray, nil];
        [self InterceptionTime];
//        UIButton*cancelBtn=[UIButton buttonWithType:UIButtonTypeCustom];
////        cancelBtn.backgroundColor=[UIColor grayColor];
//        cancelBtn.frame=CGRectMake(0, 0, BTNWIDTH, 40);
//        [cancelBtn setTitle:@"取消" forState:UIControlStateNormal];
//        cancelBtn.tag=1;
//        [cancelBtn setContentHorizontalAlignment:UIControlContentHorizontalAlignmentLeft];
//        [cancelBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
//        [cancelBtn addTarget:self action:@selector(cancelBtnClick:) forControlEvents:UIControlEventTouchUpInside];
//        [self addSubview:cancelBtn];
//        
//        UIButton*determineBtn=[UIButton buttonWithType:UIButtonTypeCustom];
//        
//        determineBtn.tag=2;
//        determineBtn.frame=CGRectMake(cancelBtn.frame.size.width, 0, BTNWIDTH, 40);
//        [determineBtn setTitle:@"确定" forState:UIControlStateNormal];
//        [determineBtn setContentHorizontalAlignment:UIControlContentHorizontalAlignmentRight];
//        [determineBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
//        [determineBtn addTarget:self action:@selector(determineClick:) forControlEvents:UIControlEventTouchUpInside];
//        [self addSubview:determineBtn];
//        UILabel*lable1=[[UILabel alloc]initWithFrame:CGRectMake(0,0, [UIScreen mainScreen].bounds.size.width, 1)];
//        UILabel*lable=[[UILabel alloc]initWithFrame:CGRectMake(0, determineBtn.frame.size.height, [UIScreen mainScreen].bounds.size.width, 1)];
//        lable1.backgroundColor=[UIColor lightGrayColor];
//        [self addSubview:lable1];
//        lable.backgroundColor=[UIColor lightGrayColor];
//        [self addSubview:lable];
        
        
        //高度 默认值 162
        UIPickerView *pickerView =[[UIPickerView alloc]init];
        pickerView.frame=CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, self.frame.size.height);
        //设置数据源（返回多少区 多少行）
        pickerView.dataSource =self;
        //设置代理
        pickerView.delegate =self;
        
        [self addSubview:pickerView];
        
        [pickerView selectRow:[hours intValue] inComponent:0 animated:YES];
        [pickerView selectRow:[minutes intValue] inComponent:1 animated:YES];
    }
    return self;
}
#pragma mark- 数据源协议方法
//返回多少区
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    //大数组中有几个小数组 就返回几个区
    return _bigArr.count;
}

//每一区返回多少行
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    
    //  NSLog(@"component==%d",component);
    //1.根据区号component，取出其所对应的小数组
    NSArray *smallArr =_bigArr[component];
    
    //2.小数组中有几个元素 就返回几行
    return smallArr.count;
    
}
#pragma mark-
#pragma mark- 代理协议方法
//设置第component区row行的标题
-(NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    
    //1.根据区号component取出对应的小数组
    NSArray *smallArr =_bigArr[component];
    
    //2.从小数组中取出row行对应的内容
    NSString *str =smallArr[row];
    
    //3.返回要展示的内容
    return str;
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    
    NSInteger rowCount2=[pickerView selectedRowInComponent:0];
    NSString * valuemin = [hoursArray objectAtIndex:rowCount2];
    NSInteger rowCount3=[pickerView selectedRowInComponent:1];
    NSString * min = [minutesArray objectAtIndex:rowCount3];
    ;
    
    _Taketime=[NSString stringWithFormat:@"%@:%@",valuemin,min];
    [self determineClick];
    
}

#pragma mark-截取时间
-(void)InterceptionTime{
    //        获取今天的小时
    NSDate *date =[NSDate date];
    NSDateFormatter *formatter =[[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm"];
    hours=[formatter stringFromDate:date];
    hours=[hours substringWithRange:NSMakeRange(11,2)] ;
    NSLog(@"%d",[hours intValue]);
    
    //  获取今天的分钟
    NSDate *date1=[NSDate date];
    NSDateFormatter *formatter1 =[[NSDateFormatter alloc]init];
    [formatter1 setDateFormat:@"yyyy-MM-dd HH:mm"];
    minutes=[formatter1 stringFromDate:date1];
    minutes=[minutes substringWithRange:NSMakeRange(14,2)];
    
}

-(void)cancelBtnClick:(UIButton*)btn{
    
    _Taketime = @"选择时间";
    [self.delegate hisPickerView:self];
    
}
-(void)determineClick{
    if (_Taketime == nil) {
        _Taketime = [NSString stringWithFormat:@"%@:%@",hours,minutes];
    }
    [self.delegate hisPickerView:self];
    
}

@end
