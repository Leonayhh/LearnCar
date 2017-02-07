//
//  HomeCell.h
//  LearnCar
//
//  Created by 进超王 on 17/1/12.
//  Copyright © 2017年 kedll. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UIImageView *headerImgview;

@property (strong, nonatomic) IBOutlet UILabel *titleLB;

@property (strong, nonatomic) IBOutlet UILabel *typeLB;

@property (strong, nonatomic) IBOutlet UILabel *dateLB;

@property (nonatomic, strong) UIView *lineView;

@end
