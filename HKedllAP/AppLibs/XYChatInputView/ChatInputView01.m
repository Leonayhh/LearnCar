//
//  XYChatInputView.m
//  AppleDP
//
//  Created by ly on 15/8/10.
//  Copyright (c) 2015年 kedll. All rights reserved.
//

#import "ChatInputView01.h"
#define KMessageTextViewHeight 32.0f
#define keyboardItemPadding 20.0f
@implementation ChatInputView01
@synthesize mMessageTextView,CView,palceholderLabel;
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initSubViews];
        _rightBtns=[NSMutableArray array];
    }
    return self;
}



-(void)initSubViews{
    self.backgroundColor=[UIColor whiteColor];
    [self.layer setShadowOffset:CGSizeMake(5,0)];
    [self.layer setShadowColor:[UIColor lightGrayColor].CGColor];
    [self.layer setShadowOpacity:0.4f];
    
    
    
    mMessageTextView=[[UITextView alloc] initWithFrame:CGRectMake(10, (self.height-KMessageTextViewHeight)/2, self.width-10*2, KMessageTextViewHeight)];
    mMessageTextView.layer.borderWidth=1;
    mMessageTextView.layer.cornerRadius=2;
    mMessageTextView.delegate=self;
    mMessageTextView.font=[UIFont systemFontOfSize:15];
    mMessageTextView.layer.borderColor=[UIColor colorWithRed:206.0f/255.0f green:206.0f/255.0f blue:206.0f/255.0f alpha:1.0f].CGColor;
    [self addSubview:mMessageTextView];
    
    //默认文字
    palceholderLabel=[[UITextField alloc] initWithFrame:CGRectMake(10, 0, mMessageTextView.width, mMessageTextView.height)];
    palceholderLabel.userInteractionEnabled=NO;
    palceholderLabel.textColor=[UIColor lightGrayColor];
    palceholderLabel.font=mMessageTextView.font;
    palceholderLabel.backgroundColor=[UIColor clearColor];
    [mMessageTextView addSubview:palceholderLabel];
    [mMessageTextView sendSubviewToBack:palceholderLabel];
}
- (void)setPalceholder:(NSString *)palceholder
{
    _palceholder = palceholder;
    palceholderLabel.text=_palceholder;
}
- (void)setPalceholderView:(UIImageView *)palceholderView
{
    _palceholderView = palceholderView;
    palceholderLabel.leftViewMode = UITextFieldViewModeAlways;
    palceholderLabel.leftView=palceholderView;
    
}
#pragma mark-动态添加按钮
-(void)setRightBtns:(NSMutableArray *)rightBtns{
    if(rightBtns){
        _rightBtns=rightBtns;
    }
    UIButton *tmpBtn=nil;
    for (UIButton *btn in _rightBtns) {
        [btn setTop:self.height/2-btn.height/2];
        if(tmpBtn){
            [btn setRight:tmpBtn.left-keyboardItemPadding];
        }else{
            [btn setRight:self.width-10];
        }
        tmpBtn=btn;
        [self addSubview:btn];
        [_rightBtns addObject:btn];
    }
    [mMessageTextView setWidth:tmpBtn.left-mMessageTextView.left-10];
}

#pragma mark- textview
#pragma mark-UITextViewDelegate
-(BOOL) textViewShouldBeginEditing:(UITextView *)textView
{
    palceholderLabel.frame=CGRectMake(10, 0, mMessageTextView.width, mMessageTextView.height);
    palceholderLabel.text=@"";
    palceholderLabel.leftView=nil;
    return YES;
}


- (BOOL)textViewShouldEndEditing:(UITextView *)textView{

    if(textView==mMessageTextView){
        if(textView.text.length){
            palceholderLabel.text=@"";
            palceholderLabel.leftView=nil;
        }else{
            palceholderLabel.text=self.palceholder;
            palceholderLabel.leftView=self.palceholderView;
        }
    }
    return YES;
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
    
    if ([text isEqualToString:@"\n"]) {
        [textView resignFirstResponder];
        if (mMessageTextView.text.length==0 || [mMessageTextView.text isEqualToString:@""] || [mMessageTextView.text isEqualToString:@" "])
        {
            return NO;
            
        }
        mMessageTextView.text=@"";
        
        mMessageTextView.contentSize=CGSizeMake(mMessageTextView.frame.size.width, KMessageTextViewHeight);
        
        [self textViewDidChange:mMessageTextView];
        
        textView.inputView = nil;
        return NO;
    }
    return YES;
}

- (void)textViewDidChange:(UITextView *)_textView {
    if(_textView==mMessageTextView){
        if(_textView.text.length){
            palceholderLabel.text=@"";
            palceholderLabel.leftView=nil;
        }else{
            palceholderLabel.text=self.palceholder;
            palceholderLabel.leftView=self.palceholderView;
        }
    }
    
    CGSize size = mMessageTextView.contentSize;
    
    //NSLog(@"height:-------%f",size.height);
    
    size.height -= 2;
    
    if ( size.height >= KMessageTextViewHeight*2+4)
    {
        size.height =  KMessageTextViewHeight*2+4;
    }
    else if ( size.height <= KMessageTextViewHeight )
    {
        size.height = KMessageTextViewHeight;
    }
    
    if ( size.height != mMessageTextView.frame.size.height ) {
        
        CGFloat span = size.height - mMessageTextView.frame.size.height;
        
        CGRect frame = self.frame;
        frame.origin.y -= span;
        frame.size.height += span;
        self.frame = frame;
        
        CGFloat centerY = frame.size.height / 2;
        
        frame = mMessageTextView.frame;
        frame.size = size;
        mMessageTextView.frame = frame;
        
        CGPoint center = mMessageTextView.center;
        center.y = centerY;
        mMessageTextView.center = center;
    }
}

@end
