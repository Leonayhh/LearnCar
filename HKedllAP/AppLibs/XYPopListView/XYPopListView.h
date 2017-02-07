//
//  XYPopListView.h
//  AppleDP
//
//  Created by ly on 15/6/4.
//  Copyright (c) 2015年 kedll. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XYPopListViewCell : UITableViewCell

@end


@interface XYPopListView : UIView<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,strong)NSArray *dataArr;
@property(nonatomic,assign)CGFloat itemHeight;
@property(nonatomic,strong)UIFont *CellFont;
@property(nonatomic,assign)int CelltextAlignment;
@property(nonatomic,strong)UITableView *m_tableView;
@property (nonatomic,strong) UIButton *handerView;
@property (nonatomic,copy)void (^selectRowAtIndex)(NSInteger index);

-(void)startCreate;
-(void)showWithData:(NSArray *)data;
@end
