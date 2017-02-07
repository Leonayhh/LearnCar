//
//  XYSearchBar.h
//  AppleDP
//
//  Created by ly on 15/6/11.
//  Copyright (c) 2015年 kedll. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol XYSearchBarDelegate <NSObject>

-(void)onBarSearchBtnClicked;

@end


@interface XYSearchBar : UIView
@property(nonatomic,weak)id<XYSearchBarDelegate> theDelegate;
@property(nonatomic,strong)UIButton *barSearchBtn;
@property(nonatomic,strong)UITextField *barTextField;

@end
