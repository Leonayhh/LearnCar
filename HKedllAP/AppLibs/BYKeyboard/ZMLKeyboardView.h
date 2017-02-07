//
//  ZMLKeyboardView.h
//  自定义键盘
//
//  Created by 王进超 on 16/7/1.
//  Copyright © 2016年 Apress. All rights reserved.
//  带表情键盘的自定义输入框视图

#import <UIKit/UIKit.h>
typedef enum keyBoard {
    present = 0,
    hidden,
    KBTtansEP,
    EPTransKB
} keyBoardTransState;

@protocol ZMLKeyboardViewDelegate <NSObject>

- (void)otherBtn:(NSInteger)index;

/**
 * 键盘的高度
 *
 */

- (void)keyBoardChangWithHeight:(CGFloat)keyHeight isHidden:(BOOL)ishidden isChange:(BOOL)isChange;

/**
 *TXAjustH 为相对的高度
 *
 */

- (void)textViewAjustWithHeight:(CGFloat)TXAjustH;

@end



@interface ZMLKeyboardView : UIView <UIScrollViewDelegate>

/**
 *  展示自定义键盘视图
 *
 *  @param height        容器视图高度
 *  @param sendTextBlock 点击键盘上的发送按钮回调
 */
+ (instancetype)showKeyboardViewWithContainerHeight:(CGFloat)height sendTextBlock:(void (^)(NSString *text))sendTextBlock;


- (void)becomeFirstResponder;

- (void)resignFirstResponder;

/***  设置输入框文字*/
- (void)setInputViewText:(NSString *)text;

/***  设置输入框占位文字*/     
- (void)setInputViewPlaceholderText:(NSString *)text;

/**
 *  监听键盘的出现/消失
 */
@property (nonatomic, copy) void (^keyboardAppearAndDismiss)(BOOL isAppear);

@property (nonatomic,weak) id<ZMLKeyboardViewDelegate> keyBoardDelegate;

@property (nonatomic, assign) CGFloat kFaceViewHeight;

@end
