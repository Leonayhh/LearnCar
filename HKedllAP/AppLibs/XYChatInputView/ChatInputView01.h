//
//  ChatInputView01
//  AppleDP
//  评论输入
//  Created by ly on 15/8/10.
//  Copyright (c) 2015年 kedll. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface ChatInputView01 : UIView<UITextViewDelegate>
{
 
}
@property (nonatomic, strong)UITextField *palceholderLabel;
@property(nonatomic,strong)UIView *CView;
@property(nonatomic,strong)UITextView *mMessageTextView;
@property(nonatomic,strong)NSString *palceholder;//默认文字
@property(nonatomic,strong)UIImageView *palceholderView;//默认图标
@property (nonatomic, strong) NSMutableArray *rightBtns;


@end
