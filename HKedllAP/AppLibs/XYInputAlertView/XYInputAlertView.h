//
//  XYPopListView.h
//  AppleDP
//  输入框Alert
//  Created by ly on 15/6/4.
//  Copyright (c) 2015年 kedll. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol XYInputAlertViewDelegate <NSObject>

-(void)onInputAlertViewClickAtIndex:(NSInteger )index text:(NSString *)inputStr;

@end

@interface XYInputAlertView : UIView<UITextFieldDelegate>
{
    NSString *titleStr;
    NSString *msgStr;
    NSString *cancelButtonTitleStr;
    NSString *otherButtonTitleStr;
    id<XYInputAlertViewDelegate> delegate;
    
    
    UIButton *handerView;
    UILabel *titleLabel;
    UILabel *msgLabel;
    UITextField *textField;
    UIButton *cancleBtn;
    UIButton *otherBtn;
}


-(instancetype)initWithTarget:(id)target title:(NSString *)title Message:(NSString *)msg cancelButtonTitle:(NSString *)cancelButtonTitle otherButtonTitle:(NSString *)otherButtonTitle;

-(void)show;
@end
