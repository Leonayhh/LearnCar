//
//  KDCommonAnimation.h
//  KedllDemo
//
//  Created by tracy wang on 15/11/27.
//  Copyright © 2015年 kedll. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <QuartzCore/QuartzCore.h>
#import <UIKit/UIKit.h>

#define pi 3.14159265358979323846
#define degreesToRadian(x) (pi * x / 180.0)

//该类封装了所有的常用动画
@interface KDCommonAnimation : NSObject


/*
 *@brief 单例
 */
+(KDCommonAnimation *) sharedCommonAnimation;

/* @brief 放大变淡动画
 * @param
 * @return 返回CAAnimationGroup
 */
- (CAAnimationGroup *)blowupAnimationAtPoint;


/* @brief 抖动动画效果 例如 输入框输错密码，抖动
 * @param view 传入的view distancex移动的距离 duration动画持续时间 count动画重复次数
 * @return
 */
-(void) shakeAnimationForView:(UIView*)view distance:(float) distancex animationDuration:(float) duration repeatCount:(int) count;


/* @brief 弹跳淡出动画效果
 * @param view 传入的view duration第一个动画持续时间 delay 延迟多少时间后开始动画 scale 传入CATransform3DMakeScale duration2 第二个动画持续时间 defaultTransform 恢复到默认值 传入CATransform3DIdentity
 * @return
 */
-(void) bounceAnimation:(UIView *)view animationDuration:(float) duration delay:(float) delay catransform:(CATransform3D) scale animationDuration2:(float)duration2 catransform2:(CATransform3D) defaultTransform;

/* @brief 水滴动画
 * @param duration 动画持续时间 view 目标view
 * @return
 */
-(void) showRippleEffectAnimation:(float)duration fromView:(UIView *)view;


/* @brief 按照某个轴旋转的动画
 * @param keyPath 某个轴 degree 要旋转的角度 duration 动画时间 view 目标view
 * @return
 */
-(void) rotationAnimation:(NSString *)keyPath animationDegree:(CGFloat)degree animationDuration:(float)duration fromView:(UIView *)view;



/* @brief 立方体旋转动画
 * @param duration 动画持续时间 direction 动画方向 view 目标view
 * @return
 */
-(void) showCubAnimation:(float)duration direction:(NSString *)direction fromView:(UIView *)view;


@end
