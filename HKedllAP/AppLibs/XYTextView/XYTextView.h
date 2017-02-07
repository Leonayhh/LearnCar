//
//  XYTextView.h
//  AppleDP
//
//  Created by ly on 15/6/16.
//  Copyright (c) 2015年 kedll. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XYTextView : UIView<UITextViewDelegate>
{
    
    
}
@property (nonatomic, strong) UITextView *m_palceholderTV;
@property(nonatomic,strong)NSString *palceholder;//默认文字
@property(nonatomic,strong)UITextView *m_textView;
@property(nonatomic,assign)NSInteger maxLength;//最大输入字数
@property(nonatomic,strong)UIColor *palceholderColor;

-(void)startCreate;
@end
