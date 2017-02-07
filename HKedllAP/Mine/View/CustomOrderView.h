//
//  CustomOrderView.h
//  LearnCar
//
//  Created by 进超王 on 17/1/18.
//  Copyright © 2017年 kedll. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomOrderView : UIView

@property (nonatomic, strong) UIView *oneView;

@property (nonatomic, strong) UIView *twoView;

@property (nonatomic, strong) UIImageView *diTuImgview;

@property (nonatomic, strong) UILabel *oneLabel;

@property (nonatomic, strong) UILabel *twoLabel;

@property (nonatomic, strong) UILabel *threeLabel;

@property (nonatomic, strong) UILabel *fourLabel;

@property (nonatomic, strong) UILabel *fiveLabel;

@property (nonatomic, strong) UILabel *sixLabel;

@property (nonatomic, strong) UILabel *sevenLabel;

@property (nonatomic, strong) UILabel *eightLabel;

@property (nonatomic, strong) UILabel *typeLabel;

@property (nonatomic, assign) CGFloat height;

- (void)setDataWithModel:(OrderModel *)model;

@end
