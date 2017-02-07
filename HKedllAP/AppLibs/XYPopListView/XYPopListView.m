//
//  XYPopListView.m
//  AppleDP
//
//  Created by ly on 15/6/4.
//  Copyright (c) 2015年 kedll. All rights reserved.
//

#import "XYPopListView.h"
#define tableViewHeight 60.0f
#define MaxShowCount 4

@interface XYPopListViewCell (){


}

@end

@implementation XYPopListViewCell
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.backgroundColor=[UIColor clearColor];
    }
    return self;
}


-(void)drawRect:(CGRect)rect{
    [super drawRect:rect];
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [UIColor clearColor].CGColor);
    CGContextFillRect(context, rect);
    CGContextSetStrokeColorWithColor(context, [UIColor colorWithRed:241.0f/255.0f green:241.0f/255.0f blue:241.0f/255.0f alpha:1.0f].CGColor);
    CGContextStrokeRect(context, CGRectMake(0, rect.size.height - 0.25, rect.size.width, 0.25));
}
@end


@implementation XYPopListView
@synthesize m_tableView,itemHeight,dataArr;
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.itemHeight=tableViewHeight;
        dataArr=[[NSArray alloc] init];
    }
    return self;
}

-(void)startCreate{
    m_tableView=[[UITableView alloc] initWithFrame:self.bounds];
    m_tableView.delegate=self;
    m_tableView.dataSource=self;
    m_tableView.separatorStyle=0;
    m_tableView.backgroundColor=[UIColor colorWithRed:218.0f/255.0f green:219.0f/255.0f blue:219.0f/255.0f alpha:5.0f];
    m_tableView.showsVerticalScrollIndicator=NO;
    [self addSubview:m_tableView];
}

-(void)showWithData:(NSArray *)data{
    if(data){
        dataArr=data;
    }
    [m_tableView reloadData];
    self.handerView = [UIButton buttonWithType:UIButtonTypeCustom];
    [_handerView setFrame:[UIScreen mainScreen].bounds];
    _handerView.backgroundColor=[UIColor colorWithWhite:0 alpha:0.5];
    [_handerView addTarget:self action:@selector(dissmiss) forControlEvents:UIControlEventTouchUpInside];
    [_handerView addSubview:self];
    
    CGRect tmpRC=self.frame;
    if(data.count>=MaxShowCount||data.count==0){
        tmpRC.size.height=MaxShowCount*itemHeight;
    }else {
        tmpRC.size.height=data.count*itemHeight;
    }
    self.frame=tmpRC;
    self.center=_handerView.center;
    [m_tableView setFrame:self.bounds];
    
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    [window addSubview:_handerView];
}

-(void)dissmiss{
    [_handerView removeFromSuperview];
}

#pragma mark-tableView delegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return itemHeight;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return dataArr.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *idf=@"cell";
    XYPopListViewCell *cell=[tableView dequeueReusableCellWithIdentifier:idf];
    if(!cell){
        cell=[[XYPopListViewCell alloc] init];
    }
    if(self.CellFont){
        cell.textLabel.font=self.CellFont;
    }
    if(self.CelltextAlignment){
        cell.textLabel.textAlignment=self.CelltextAlignment;
    }else{
        cell.textLabel.textAlignment=1;
    }
    cell.textLabel.text=dataArr[indexPath.row];
    
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    if (self.selectRowAtIndex) {
        self.selectRowAtIndex(indexPath.row);
    }
    [self dissmiss];
}
@end
