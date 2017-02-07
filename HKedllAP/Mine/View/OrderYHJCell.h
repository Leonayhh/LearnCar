//
//  OrderYHJCell.h
//  LearnCar
//
//  Created by 进超王 on 17/1/16.
//  Copyright © 2017年 kedll. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OrderYHJCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UILabel *moneyLB;

@property (strong, nonatomic) IBOutlet UILabel *useLb;

@property (strong, nonatomic) IBOutlet UIImageView *backImgview;

@property (strong, nonatomic) IBOutlet UILabel *biaoHaoLB;

@property (strong, nonatomic) IBOutlet UILabel *valideLB;

@property (strong, nonatomic) IBOutlet NSLayoutConstraint *moneyW;

@property (strong, nonatomic) IBOutlet UIView *backView;


@end
