//
//  XYSearchBar.m
//  AppleDP
//
//  Created by ly on 15/6/11.
//  Copyright (c) 2015年 kedll. All rights reserved.
//

#import "XYSearchBar.h"

@implementation XYSearchBar
@synthesize barSearchBtn,barTextField;
@synthesize theDelegate;

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self initSubView];
    }
    return self;
}


-(void)initSubView{
    //白色边框
    self.layer.borderColor= [UIColor whiteColor].CGColor;
    self.layer.borderWidth=0.5;
    self.layer.cornerRadius=4;
    
    barTextField=[[UITextField alloc] initWithFrame:CGRectMake(5, 0, self.width-self.height-10-5, self.height)];
    barTextField.font=[UIFont systemFontOfSize:14];
    barTextField.keyboardType=UIKeyboardTypeDefault;
    barTextField.textColor=[UIColor blackColor];
    barTextField.returnKeyType=UIReturnKeySearch;
    [self addSubview:barTextField];
    
    barSearchBtn=[[UIButton alloc] initWithFrame:CGRectMake(self.width-self.height, 0, self.height, self.height)];
    barSearchBtn.imageEdgeInsets=UIEdgeInsetsMake(2, 2, 2, 2);
    [barSearchBtn setImage:[UIImage imageNamed:@"search_gray_img"] forState:0];
    [barSearchBtn addTarget:self action:@selector(onBarSearchBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:barSearchBtn];
    barSearchBtn.adjustsImageWhenHighlighted=NO;
    barSearchBtn.showsTouchWhenHighlighted=YES;
    
}
#pragma mark-onBarSearchBtnClicked
-(void)onBarSearchBtnClicked:(UIButton *)sender{
    if([self.theDelegate respondsToSelector:@selector(onBarSearchBtnClicked)]){
        [self.theDelegate onBarSearchBtnClicked];
    }
    
    NSLog(@"onBarSearchBtnClicked");
}



@end
