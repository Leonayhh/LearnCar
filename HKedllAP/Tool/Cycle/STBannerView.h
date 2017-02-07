//
//  STBannerView.h
//  Saftop
//
//  Created by AG_TigerNong on 17/1/7.
//  Copyright © 2017年 Saftop. All rights reserved.
//

#import <UIKit/UIKit.h>

@class STBannerView;
@protocol STBannerViewDelegate <NSObject>

- (void)bannerView:(STBannerView *)view didSelectImageView:(UIImageView *)imageView;

@end

@interface STBannerView : UIView<UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *bannerScrollView;
@property (weak, nonatomic) IBOutlet UIPageControl *bannerPageController;

/*图片的URL*/
@property (nonatomic, strong) NSMutableArray *images;

/*图片轮播定时器*/
@property(strong ,nonatomic) NSTimer *bannerTimer;

/*图片轮播时间间隔*/
@property(assign ,nonatomic) NSTimeInterval interval;

@property (nonatomic, weak) id<STBannerViewDelegate> delegate;

/*加载控件*/
+ (id)bannerView;

/*创建定时器*/
- (void)creatTimer;

/*停止定时器*/
- (void)stopTimer;

@end
