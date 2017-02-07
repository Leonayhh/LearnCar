//
//  TypeView.h
//  LearnCar
//
//  Created by 进超王 on 17/1/13.
//  Copyright © 2017年 kedll. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YLButton.h"

@protocol TypeViewDelegate <NSObject>

- (void)btnClickWithYLButton:(YLButton *)btn;

@end

@interface TypeView : UIView

@property (nonatomic, strong) YLButton *learnCarBtn;

@property (nonatomic, strong) YLButton *orderDrivingBtn;

@property (nonatomic, strong) YLButton *maintainBtn;

@property (nonatomic, strong) UIView *oneView;

@property (nonatomic, strong) UIView *twoView;

@property (nonatomic, weak) id<TypeViewDelegate> TypeViewDelegate;

@end
