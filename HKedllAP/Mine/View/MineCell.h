//
//  MineCell.h
//  LearnCar
//
//  Created by 进超王 on 17/1/13.
//  Copyright © 2017年 kedll. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MineCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UIImageView *imgView;

@property (strong, nonatomic) IBOutlet UILabel *contentLB;

@property (strong, nonatomic) IBOutlet NSLayoutConstraint *imgW;

@property (strong, nonatomic) IBOutlet NSLayoutConstraint *imgH;

@property (strong, nonatomic)  UIView *lineView;

@end
