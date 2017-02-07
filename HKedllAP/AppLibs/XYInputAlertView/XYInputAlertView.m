//
//  XYPopListView.m
//  AppleDP
//
//  Created by ly on 15/6/4.
//  Copyright (c) 2015年 kedll. All rights reserved.
//

#import "XYInputAlertView.h"


@implementation XYInputAlertView



-(instancetype)initWithTarget:(id)target title:(NSString *)title Message:(NSString *)msg cancelButtonTitle:(NSString *)cancelButtonTitle otherButtonTitle:(NSString *)otherButtonTitle{
    self=[super init];
    if(self){
        delegate=target;
        titleStr=title;
        msgStr=msg;
        cancelButtonTitleStr=cancelButtonTitle;
        otherButtonTitleStr=otherButtonTitle;
    }
    return self;
}
-(void)show{
    [self startCreate];
}
-(void)startCreate{
    
    handerView = [UIButton buttonWithType:UIButtonTypeCustom];
    handerView.backgroundColor=[UIColor colorWithWhite:0.5 alpha:0.4];
    [handerView addTarget:self action:@selector(dismiss:) forControlEvents:UIControlEventTouchUpInside];
    [handerView setFrame:[UIScreen mainScreen].bounds];
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    [window addSubview:handerView];
    
    self.frame=CGRectMake(0, 0, 281, 210);
    self.backgroundColor=[UIColor whiteColor];
    self.layer.cornerRadius=5;
    self.center=handerView.center;
    [handerView addSubview:self];
    
    titleLabel=[[UILabel alloc] init];
    CGSize titleLabelSize=CGSizeMake(self.width-40, 0);
    titleLabelSize=[XYStringOperate getLabelSizeWithText:titleStr Size:titleLabelSize font:titleLabel.font];
    titleLabel.frame=CGRectMake(20, 20, titleLabelSize.width, titleLabelSize.height);
    titleLabel.font=[UIFont systemFontOfSize:[XYStringOperate GetFontSizeByScreenWithPrt:14]];
    titleLabel.textColor=Color_CommonBlackFontColor;
    titleLabel.text=titleStr;
    titleLabel.textAlignment=1;
    [self addSubview:titleLabel];
    
    msgLabel=[[UILabel alloc] init];
    CGSize msgLabelSize=CGSizeMake(titleLabel.width, 0);
    msgLabelSize=[XYStringOperate getLabelSizeWithText:msgStr Size:msgLabelSize font:msgLabel.font];
    msgLabel.font=[UIFont systemFontOfSize:[XYStringOperate GetFontSizeByScreenWithPrt:13]];
    msgLabel.textColor=Color_CommonBlackFontColor;
    msgLabel.frame=CGRectMake(titleLabel.left, titleLabel.bottom+10, msgLabelSize.width, msgLabelSize.height);
    msgLabel.numberOfLines=0;
    msgLabel.text=msgStr;
    msgLabel.textAlignment=1;
    [self addSubview:msgLabel];
    
    
    textField=[[UITextField alloc] initWithFrame:CGRectMake(titleLabel.left, msgLabel.bottom+10, titleLabel.width, ScreenPrt(30))];
    textField.layer.borderWidth=0.5;
    textField.layer.borderColor=Color_GrayborderColor.CGColor;
    textField.layer.cornerRadius=4;
    textField.secureTextEntry=YES;
    [self addSubview:textField];
    
    cancleBtn=[[UIButton alloc] initWithFrame:CGRectMake(0, 0, self.width/2, self.height-textField.bottom-20)];
    [cancleBtn setFrame:CGRectMake(0, self.height-cancleBtn.height, cancleBtn.width, cancleBtn.height)];
    [cancleBtn setTitle:cancelButtonTitleStr forState:0];
    [cancleBtn setTitleColor:Color_CommonBlackFontColor forState:0];
    [cancleBtn.titleLabel setFont:[UIFont systemFontOfSize:[XYStringOperate GetFontSizeByScreenWithPrt:14]]];
    [cancleBtn addTarget:self action:@selector(onItembtnTouchDown:) forControlEvents:UIControlEventTouchDown];
    [cancleBtn addTarget:self action:@selector(onItembtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:cancleBtn];
    
    otherBtn=[[UIButton alloc] initWithFrame:CGRectMake(cancleBtn.right, cancleBtn.top, self.width-cancleBtn.width, cancleBtn.height)];
    [otherBtn setTitle:otherButtonTitleStr forState:0];
    [otherBtn setTitleColor:Color_CommonBlackFontColor forState:0];
    [otherBtn.titleLabel setFont:[UIFont systemFontOfSize:[XYStringOperate GetFontSizeByScreenWithPrt:14]]];
    [otherBtn addTarget:self action:@selector(onItembtnTouchDown:) forControlEvents:UIControlEventTouchDown];
    [otherBtn addTarget:self action:@selector(onItembtnClick:) forControlEvents:UIControlEventTouchUpInside];

    [self addSubview:otherBtn];
    
    UIView *sep1=[[UIView alloc] initWithFrame:CGRectMake(0, cancleBtn.top, self.width, 0.5)];
    sep1.backgroundColor=Color_GrayborderColor;
    [self addSubview:sep1];
    
    UIView *sep2=[[UIView alloc] initWithFrame:CGRectMake(cancleBtn.right, cancleBtn.top, 0.5, cancleBtn.height)];
    sep2.backgroundColor=Color_GrayborderColor;
    [self addSubview:sep2];
}
#pragma mark-消失
-(void )dismiss:(UIButton *)btn{
    [textField resignFirstResponder];
}
-(void)onItembtnTouchDown:(UIButton *)btn{
    btn.alpha=0.6;
}
-(void)onItembtnClick:(UIButton *)btn{
    [self performBlock:^{
        btn.alpha=1;
        [textField resignFirstResponder];
        NSInteger index = 0;
        if(btn==cancleBtn){
            index=0;
        }else if(btn==otherBtn){
            if(!textField.text.length){
                return ;
            }
            index=1;
        }
        if([delegate respondsToSelector:@selector(onInputAlertViewClickAtIndex:text:)]){
            [delegate onInputAlertViewClickAtIndex:index text:textField.text];
        }
        [handerView removeFromSuperview];
    } afterDelay:0.1];
}


- (void)performBlock:(void(^)())block afterDelay:(NSTimeInterval)delay {
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delay * NSEC_PER_SEC));
    dispatch_after(popTime, dispatch_get_main_queue(), block);
}

@end
