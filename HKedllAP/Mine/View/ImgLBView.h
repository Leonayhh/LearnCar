//
//  ImgLBView.h
//  LearnCar
//
//  Created by 进超王 on 17/1/18.
//  Copyright © 2017年 kedll. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ImgLBView : UIView

@property (nonatomic, strong) UIImageView *imgView;

@property (nonatomic, strong) UILabel *getLB;

@property (nonatomic, assign) BOOL isGet;

- (void)setTextWithString:(NSString *)str withFrame:(CGRect)frame;

@end
