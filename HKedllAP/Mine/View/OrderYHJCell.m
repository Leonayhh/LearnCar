//
//  OrderYHJCell.m
//  LearnCar
//
//  Created by 进超王 on 17/1/16.
//  Copyright © 2017年 kedll. All rights reserved.
//

#import "OrderYHJCell.h"

@implementation OrderYHJCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.contentView.backgroundColor = RGBA(237, 237, 237, 1);
    self.backView.layer.cornerRadius = 7;
    self.backView.layer.masksToBounds = YES;
    self.backView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.backView.layer.borderWidth = 1;
}

@end
