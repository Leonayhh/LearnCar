//
//  XYTextView.m
//  AppleDP
//
//  Created by ly on 15/6/16.
//  Copyright (c) 2015年 kedll. All rights reserved.
//

#import "XYTextView.h"

@implementation XYTextView
@synthesize m_textView,palceholder,maxLength,palceholderColor,m_palceholderTV;
- (instancetype)initWithFrame:(CGRect )frame
{
    self = [super initWithFrame:frame];
    if (self) {
        maxLength=99999999;
    }
    return self;
}

-(void)startCreate{
    CGRect tmpRC=CGRectMake(0, 0, self.width, self.height);
    m_textView=[[UITextView alloc] initWithFrame:tmpRC];
    m_textView.layer.borderWidth=1;
    m_textView.layer.cornerRadius=2;
    m_textView.textColor=Color_CommonBlackFontColor;
    m_textView.font=[UIFont fontWithName:@"Helvetica" size:[XYStringOperate GetFontSizeByScreenWithPrt:17]];
    m_textView.layer.borderColor=[UIColor colorWithRed:206.0f/255.0f green:206.0f/255.0f blue:206.0f/255.0f alpha:1.0f].CGColor;
    m_textView.tintColor = [UIColor redColor];
    m_textView.delegate=self;
    [self addSubview:m_textView];
    
    
    m_palceholderTV=[[UITextView alloc] initWithFrame:m_textView.bounds];
    m_palceholderTV.userInteractionEnabled=NO;
    m_palceholderTV.textColor=palceholderColor ? palceholderColor : [UIColor lightGrayColor];
    m_palceholderTV.font=[UIFont fontWithName:@"Helvetica" size:[XYStringOperate GetFontSizeByScreenWithPrt:17]];
    m_palceholderTV.backgroundColor=[UIColor clearColor];
    m_palceholderTV.text=palceholder;
    [m_textView addSubview:m_palceholderTV];
    [self setFrame:CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width, m_textView.bottom)];
}
#pragma mark-UITextViewDelegate
- (void)textViewDidBeginEditing:(UITextView *)textView{
    if(textView==m_textView){
        if(textView.text.length!=0){
            m_palceholderTV.text=@"";
        }
    }
}
- (void)textViewDidEndEditing:(UITextView *)textView{
    if(textView==m_textView){
        if(textView.text.length==0){
            m_palceholderTV.text=self.palceholder;
        }
    }
}
- (void)textViewDidChange:(UITextView *)textView{
    NSString *toBeString = textView.text;
    //获取高亮部分
    UITextRange *selectedRange = [textView markedTextRange];
    UITextPosition *position = [textView positionFromPosition:selectedRange.start offset:0];
    
    // 没有高亮选择的字，则对已输入的文字进行字数统计和限制
    if (!position||!selectedRange)
    {
        if (toBeString.length > maxLength)
        {
            NSRange rangeIndex = [toBeString rangeOfComposedCharacterSequenceAtIndex:maxLength];
            if (rangeIndex.length == 1)
            {
                textView.text = [toBeString substringToIndex:maxLength];
            }
            else
            {
                NSRange rangeRange = [toBeString rangeOfComposedCharacterSequencesForRange:NSMakeRange(0, maxLength)];
                textView.text = [toBeString substringWithRange:rangeRange];
            }
        }
    }
    


}
- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    
    if(textView==m_textView){
        if(textView.text.length==0){
            m_palceholderTV.text=@"";
        }else{
            m_palceholderTV.text=@"";
        }
    }
    return YES;
}

@end
