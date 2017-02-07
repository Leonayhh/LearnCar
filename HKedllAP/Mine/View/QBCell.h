//
//  QBCell.h
//  LearnCar
//
//  Created by 进超王 on 17/1/16.
//  Copyright © 2017年 kedll. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QBCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UILabel *typeLB;

@property (strong, nonatomic) IBOutlet UIView *dateLB;

@property (strong, nonatomic) IBOutlet UILabel *moneyLB;

@property (nonatomic,strong) UIView *lineView;
@end
