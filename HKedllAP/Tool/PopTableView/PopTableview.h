//
//  PopTableview.h
//  PinchFish
//
//  Created by 进超王 on 16/10/14.
//  Copyright © 2016年 进超王. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PopTableviewCell.h"
#import "PopheaderView.h"

@protocol  PopTableviewDelegate <NSObject>

@optional

- (void)cellDidSelectWithIndex:(NSIndexPath *)indexPath isCancel:(BOOL)isCancel;

@end

@interface PopTableview : UIView<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *mTableview;

@property (nonatomic, strong) NSArray *dataArr;



@property (nonatomic, weak) id<PopTableviewDelegate> delegate;

- (instancetype)initWithFrame:(CGRect)frame withTittle:(NSArray *)titleArr;


@end
