//
//  SetCell.h
//  LearnCar
//
//  Created by 进超王 on 17/1/16.
//  Copyright © 2017年 kedll. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SetCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UILabel *contentLB;

@property (strong, nonatomic) IBOutlet UILabel *typeLB;

@property (strong, nonatomic) IBOutlet UIImageView *imgView;

@property (strong, nonatomic) IBOutlet NSLayoutConstraint *imgViewH;

@property (strong, nonatomic) IBOutlet NSLayoutConstraint *imgViewW;

@property (strong, nonatomic)  UIView *lineView;

@end
