//
//  PQActionSheet.m
//  PQActionSheet
//
//  Created by Docee on 16/3/3.
//  Copyright © 2016年 temobi. All rights reserved.
//

#import "PQActionSheet.h"

//@brief 按钮的高度
#define ACTION_SHEET_BTN_HEIGHT 55.0f
#define ACTION_SHEET_TEXT_SIZE 16.0f
#define ACTION_SHEET_ITEM_COLOR UIColorFromRGB(0x4C5870, 1)
#define ACTION_SHEET_SEP_COLOR UIColorFromRGB(0x3A4459, 1)
#define ACTION_SHEET_TEXT_COLOR [UIColor whiteColor]
#define ACTION_SHEET_ITEMCLICK_COLOR UIColorFromRGB(0x3A4459, 1)
@interface PQActionSheet () <UITableViewDelegate,UITableViewDataSource>

@property (copy,nonatomic) ClickedIndexBlock block;
@property (strong,nonatomic) UITableView *tableView;
@property (strong,nonatomic) UIButton *cancleBtn;
@property (strong,nonatomic) UIView *backgroundView;

@property (strong,nonatomic) NSMutableArray *otherButtons;

@property (assign,nonatomic) CGFloat tableViewHeight;
@property (assign,nonatomic) NSInteger buttonCount;

@end

@implementation PQActionSheet

#pragma mark - LifeCycle

/**
 *  @brief 初始化PQActionSheet
 *
 *  @param title                  ActionSheet标题
 *  @param delegate               委托
 *  @param cancelButtonTitle      取消按钮标题
 *  @param otherButtonTitles      其他按钮标题
 *
 *  @return PQActionSheet
 */
- (instancetype)initWithTitle:(NSString *)title
                     delegate:(id<PQActionSheetDelegate>)delegate
            cancelButtonTitle:(NSString *)cancelButtonTitle
            otherButtonTitles:(NSString *)otherButtonTitles, ...
{
    self = [super init];
    if (self) {
        self.titleText = [title copy];
        self.cancelText = [cancelButtonTitle copy];
        self.delegate = delegate;
        
        self.otherButtons = [[NSMutableArray alloc]init];
        
        // 获取可变参数
        [_otherButtons addObject:otherButtonTitles];
        va_list list;
        NSString *curStr;
        va_start(list, otherButtonTitles);
        while ((curStr = va_arg(list, NSString *))) {
            
            [_otherButtons addObject:curStr];
            
        }

        //初始化子视图
        [self installSubViews];
        
        
    }
    return self;
}


/**
 *  @brief 初始化PQActionSheet(Block回调结果)
 *
 *  @param title             ActionSheet标题
 *  @param block             Block回调选中的Index
 *  @param cancelButtonTitle 取消按钮标题
 *  @param otherButtonTitles 其他按钮标题
 *
 *  @return PQActionSheet
 */
- (instancetype)initWithTitle:(NSString *)title
               clickedAtIndex:(ClickedIndexBlock)block
            cancelButtonTitle:(NSString *)cancelButtonTitle
            otherButtonTitles:(NSString *)otherButtonTitles, ...
{
    self = [super init];
    if (self) {
        
        //FIXME 宝宝还不知道如何传递可变参数，只能重复地再写一遍代码了
        
        self.titleText = [title copy];
        self.cancelText = [cancelButtonTitle copy];
        self.block = block;
        
        self.otherButtons = [[NSMutableArray alloc]init];
        
        
        // 获取可变参数
        [_otherButtons addObject:otherButtonTitles];
        va_list list;
        NSString *curStr;
        va_start(list, otherButtonTitles);
        while ((curStr = va_arg(list, NSString *))) {
            
            [_otherButtons addObject:curStr];
            
        }
        
        //初始化子视图
        [self installSubViews];
        
    }
    return self;
}

- (void)dealloc {
    
    
}

#pragma mark - Public Method
/**
 *  按下
 *
 *  @param btn
 */
-(void)didCancleBtnTouchDown:(UIButton *)btn{
    btn.backgroundColor=ACTION_SHEET_ITEMCLICK_COLOR;
}


-(void)didCancleBtnClick:(UIButton *)btn{
    btn.backgroundColor=ACTION_SHEET_ITEM_COLOR;
    
    
    NSInteger index = self.otherButtons.count;
    
    // 委托方式返回结果
    if([_delegate respondsToSelector:@selector(actionSheet:clickedButtonAtIndex:)]) {
        
        [_delegate actionSheet:self clickedButtonAtIndex:index];
        
    }
    
    // Block方式返回结果
    if(self.block) {
        
        self.block(index);
        
    }
    
    [self hide];

}
/**
 *  取消
 *
 *  @param btn
 */
-(void)didCancleBtnTouchCancel:(UIButton *)btn{
   btn.backgroundColor=ACTION_SHEET_ITEM_COLOR;
}

/**
 *  @brief 显示ActionSheet
 */
- (void)show
{
    
    __block typeof(self) weakSelf = self;
    
    if([_delegate respondsToSelector:@selector(willPresentActionSheet:)]) {
        
        [_delegate willPresentActionSheet:weakSelf];
        
    }
    
    [[UIApplication sharedApplication].keyWindow addSubview:self];
    
    self.hidden = NO;
    
    [UIView animateWithDuration:0.3 animations:^{
      
        weakSelf.frame=CGRectMake(0, 0, weakSelf.width, weakSelf.tableViewHeight+weakSelf.cancleBtn.height+20);
        [weakSelf setTop:weakSelf.backgroundView.height-weakSelf.height];
        [weakSelf.cancleBtn setTop:weakSelf.height-weakSelf.cancleBtn.height-10];
        [weakSelf.tableView setTop:0];
        weakSelf.cancleBtn .hidden=NO;
        weakSelf.tableView.hidden = NO;
        
    } completion:^(BOOL finished) {
        
        
        if([_delegate respondsToSelector:@selector(didPresentActionSheet:)]) {
            
            [_delegate didPresentActionSheet:weakSelf];
            
        }
        
        
    }];
}

/**
 *  @brief 隐藏ActionSheet
 */
-(void)hide
{
    __block typeof(self) weakSelf = self;
    
    
    [UIView animateWithDuration:0.3 animations:^{
       
        weakSelf.frame=CGRectMake(0, 0, weakSelf.width, weakSelf.tableViewHeight+weakSelf.cancleBtn.height+20);
        [weakSelf setTop:weakSelf.backgroundView.height+weakSelf.height];
        [weakSelf.cancleBtn setTop:weakSelf.height-weakSelf.cancleBtn.height-10];
        [weakSelf.tableView setTop:0];
        
    } completion:^(BOOL finished) {
        
        weakSelf.hidden = YES;
        weakSelf.tableView.hidden = YES;
        [self.backgroundView removeFromSuperview];
        
    }];
}
/**
 *  @brief 添加按钮
 *
 *  @param title 按钮标题
 *
 *  @return 按钮的Index
 */
- (NSInteger)addButtonWithTitle:(NSString *)title {
    
    [self.otherButtons addObject:[title copy]];
    
    return self.otherButtons.count - 1;
    
}

#pragma mark - Private

/**
 *  @brief 初始化子视图
 */
- (void)installSubViews {
    
    self.backgroundColor=[UIColor clearColor];
    
    // 初始化遮罩视图
    self.backgroundView = [[UIView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.backgroundView.backgroundColor = [UIColor colorWithWhite:0 alpha:0.5];
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    [window addSubview:self.backgroundView];
    [self setFrame:CGRectMake(0, 0, self.backgroundView.width, 0)];
    [self.backgroundView addSubview:self];
    // 初始化TableView
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(10.0f,self.bounds.size.height-10, self.bounds.size.width-20, self.tableViewHeight)
                                                 style:1];
    self.tableView.scrollEnabled = NO;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    _tableView.backgroundColor = RGBA(237, 237, 237, 1);
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.tableView setAutoresizingMask:UIViewAutoresizingFlexibleWidth];
    self.tableView.backgroundColor=ACTION_SHEET_ITEM_COLOR;
    self.tableView.layer.cornerRadius=10;
    [self addSubview:_tableView];
    
    // 遮罩加上手势
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(hide)];
    [self.backgroundView addGestureRecognizer:tap];
    
    self.hidden = YES;
    self.tableView.hidden = YES;
    
    if(self.cancelText){
        self.cancleBtn=[[UIButton alloc] initWithFrame:CGRectMake(self.tableView.left, 0, self.tableView.width, ACTION_SHEET_BTN_HEIGHT)];
        [self.cancleBtn setTitleColor:ACTION_SHEET_TEXT_COLOR forState:0];
        self.cancleBtn.titleLabel.font=[UIFont systemFontOfSize:ACTION_SHEET_TEXT_SIZE];
        [self.cancleBtn setTitle:self.cancelText forState:0];
        self.cancleBtn.layer.cornerRadius=self.tableView.layer.cornerRadius;
        self.cancleBtn.backgroundColor=ACTION_SHEET_ITEM_COLOR;
        [self addSubview: self.cancleBtn];
        self.cancleBtn.hidden=YES;
        
        [self.cancleBtn addTarget:self action:@selector(didCancleBtnTouchDown:) forControlEvents:UIControlEventTouchDown];
        [self.cancleBtn addTarget:self action:@selector(didCancleBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.cancleBtn addTarget:self action:@selector(didCancleBtnTouchCancel:) forControlEvents:UIControlEventTouchCancel];
         [self.cancleBtn addTarget:self action:@selector(didCancleBtnTouchCancel:) forControlEvents:UIControlEventTouchCancel];
    }
    
    self.frame=CGRectMake(0, 0, self.width, self.tableViewHeight+self.cancleBtn.height+20);
    [self setTop:self.backgroundView.height+self.height];
    [self.cancleBtn setTop:self.height-self.cancleBtn.height-10];
    [self.tableView setTop:0];
    self.cancleBtn .hidden=NO;
    self.tableView.hidden = NO;
    
}

#pragma mark - GET/SET

/**
 *  @brief TableView高度
 *
 *  @return TableView高度
 */
-(CGFloat)tableViewHeight {
    
    if(self.titleText && ![@"" isEqualToString:self.titleText]) {
        return self.buttonCount * ACTION_SHEET_BTN_HEIGHT+ACTION_SHEET_BTN_HEIGHT;
    }
    
    return self.buttonCount * ACTION_SHEET_BTN_HEIGHT;
    
}

/**
 *  @brief 按钮的总个数(包括Title)
 *
 *  @return 按钮的总个数
 */
-(NSInteger)buttonCount {
    
    NSInteger count = self.otherButtons.count;
  
    return count;
    
}

#pragma mark - UITableViewDelegate
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return ACTION_SHEET_BTN_HEIGHT;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    if(self.titleText) {
        
        return ACTION_SHEET_BTN_HEIGHT;
        
    }
    
    return 0.1f;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{

    return 0.01;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    if(self.titleText) {
        
        UILabel *label = [[UILabel alloc]init];
        [label setFont:[UIFont systemFontOfSize:ACTION_SHEET_TEXT_SIZE]];
        [label setText:self.titleText];
        [label setTextAlignment:NSTextAlignmentCenter];
        [label setTextColor:ACTION_SHEET_TEXT_COLOR];
        [label setAdjustsFontSizeToFitWidth:YES];
               
        return label;
    }
    
    return nil;
    
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    NSInteger index = self.otherButtons.count;
    
    index = indexPath.row;
    
    // 委托方式返回结果
    if([_delegate respondsToSelector:@selector(actionSheet:clickedButtonAtIndex:)]) {
        
        [_delegate actionSheet:self clickedButtonAtIndex:index];
        
    }
    
    // Block方式返回结果
    if(self.block) {
        
        self.block(index);
        
    }
    
    [self hide];
    
}

#pragma mark - UITableViewDataSource

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *identify = @"actionsheetCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identify];
    if(!cell) {
        
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault
                                     reuseIdentifier:identify];
        cell.backgroundColor=[UIColor clearColor];
        cell.layer.masksToBounds = YES;
        
        UIView *view_bg = [[UIView alloc]initWithFrame:cell.frame];
        view_bg.backgroundColor =ACTION_SHEET_ITEMCLICK_COLOR;
        cell.selectedBackgroundView = view_bg;
        
        
    }
    
    // 加上分割线
    UIView *sepLine = [[UIView alloc]init];
    sepLine.backgroundColor=ACTION_SHEET_SEP_COLOR;
    sepLine.frame = CGRectMake(0, 0.5f, self.tableView.width, 0.5f);
    [cell addSubview:sepLine];
    if(!self.titleText&&indexPath.row==0){
        sepLine.hidden=YES;
    }else{
        sepLine.hidden=NO;
    }
    
    [cell.textLabel setFont:[UIFont systemFontOfSize:ACTION_SHEET_TEXT_SIZE]];
    [cell.textLabel setTextColor:ACTION_SHEET_TEXT_COLOR];
    [cell.textLabel setTextAlignment:NSTextAlignmentCenter];
    [cell.textLabel setText:self.otherButtons[indexPath.row]];
    
    return cell;
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
   return self.otherButtons.count;
    
}
//延迟调用的方法
- (void)performBlock:(void(^)())block afterDelay:(NSTimeInterval)delay {
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delay * NSEC_PER_SEC));
    dispatch_after(popTime, dispatch_get_main_queue(), block);
}

@end
