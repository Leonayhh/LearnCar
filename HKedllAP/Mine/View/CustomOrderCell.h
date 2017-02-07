//
//  CustomOrderCell.h
//  LearnCar
//
//  Created by 进超王 on 17/1/18.
//  Copyright © 2017年 kedll. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ImgLBView.h"
#import "OrderModel.h"

@protocol CustomOrderCellDelegate <NSObject>

@optional
- (void)clickWithTag:(NSInteger)tag;

@end


@interface CustomOrderCell : UITableViewCell

@property (nonatomic, strong) UIView *oneView;

@property (nonatomic, strong) UIView *twoView;

@property (nonatomic, strong) UIView *threeView;

@property (nonatomic, strong) UIImageView *headerImgview;

@property (nonatomic, strong) UIImageView *diTuImgview;

@property (nonatomic, strong) UILabel *nameLabel;

@property (nonatomic, strong) UILabel *typeLabel;

@property (nonatomic, strong) UILabel *oneLabel;

@property (nonatomic, strong) UILabel *twoLabel;

@property (nonatomic, strong) UILabel *threeLabel;

@property (nonatomic, strong) UILabel *fourLabel;

@property (nonatomic, strong) UILabel *fiveLabel;

@property (nonatomic, strong) UILabel *sixLabel;

@property (nonatomic, strong) UILabel *sevenLabel;

@property (nonatomic, strong) UILabel *jinELabel;

@property (nonatomic, strong) UILabel *yaJinLabel;

@property (nonatomic, strong) UIButton *fuKuanBtn;

@property (nonatomic, strong) UIButton *quXiaoBtn;

@property (nonatomic, strong) ImgLBView *imgLbView;

@property (nonatomic, assign) CGFloat height;

@property (nonatomic, weak) id<CustomOrderCellDelegate> orderCellDelegate;

- (void)setDataWithModel:(OrderModel *)model;


@end
