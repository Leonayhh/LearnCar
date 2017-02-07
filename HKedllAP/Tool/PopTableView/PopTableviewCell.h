//
//  PopTableviewCell.h
//  PinchFish
//
//  Created by 进超王 on 16/10/14.
//  Copyright © 2016年 进超王. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PopTableviewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *namelable;

@property (strong, nonatomic) IBOutlet UIButton *selectBtn;

@property (strong, nonatomic)  UIView *lineView;

@end
