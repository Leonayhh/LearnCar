//
//  KDCommonAnimation.m
//  KedllDemo
//
//  Created by tracy wang on 15/11/27.
//  Copyright © 2015年 kedll. All rights reserved.
//

#import "KDCommonAnimation.h"

@implementation KDCommonAnimation


+(KDCommonAnimation *) sharedCommonAnimation
{
    
    static KDCommonAnimation *_conmmonAnimation=nil;
    
    static dispatch_once_t t;
    //相当于线程同步
    dispatch_once(&t,^{
        
        _conmmonAnimation=[[self alloc] init];
        
        
    });
    
    return _conmmonAnimation;
    
}


-(id) init
{
    
    if (self=[super init])
    {
        
        
        
    }
    
    
    return self;
    
}

-(CAAnimationGroup *) blowupAnimationAtPoint
{
    
    CABasicAnimation *scaleAnimation = [CABasicAnimation animationWithKeyPath:@"transform"];
    scaleAnimation.toValue = [NSValue valueWithCATransform3D:CATransform3DMakeScale(3, 3, 1)];
    
    CABasicAnimation *opacityAnimation = [CABasicAnimation animationWithKeyPath:@"opacity"];
    opacityAnimation.toValue  = [NSNumber numberWithFloat:0.0f];
    
    CAAnimationGroup *animationgroup = [CAAnimationGroup animation];
    animationgroup.animations = [NSArray arrayWithObjects:scaleAnimation, opacityAnimation, nil];
    animationgroup.duration = 0.3f;
    animationgroup.fillMode = kCAFillModeForwards;
    // animationgroup.removedOnCompletion=NO;
    
    return animationgroup;
    
    
}


-(void) shakeAnimationForView:(UIView *)view distance:(float)distancex animationDuration:(float)duration repeatCount:(int)count
{
    
    CALayer *layer=[view layer];
    
    CGPoint viewPos=[layer position];
    
    CGPoint y=CGPointMake(viewPos.x-distancex, viewPos.y);
    CGPoint x=CGPointMake(viewPos.x+distancex, viewPos.y);
    
    
    CABasicAnimation *animation=[CABasicAnimation animationWithKeyPath:@"position"];
    [animation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
    
    [animation setFromValue:[NSValue valueWithCGPoint:x]];
    [animation setToValue:[NSValue valueWithCGPoint:y]];
    
    //动画循环到原始值
    [animation setAutoreverses:YES];
    
    [animation setDuration:duration];
    [animation setRepeatCount:count];
    
    [layer addAnimation:animation forKey:nil];
    
    
}


-(void) bounceAnimation:(UIView *)view animationDuration:(float)duration delay:(float)delay catransform:(CATransform3D)scale animationDuration2:(float)duration2 catransform2:(CATransform3D)defaultTransform
{
    
    
    [UIView animateWithDuration:duration
                          delay:(delay)
                        options:UIViewAnimationOptionBeginFromCurrentState | UIViewAnimationCurveEaseInOut
                     animations:^{
                         view.layer.transform = scale;
                         view.alpha = 1;
                     }
                     completion:^(BOOL finished) {
                         [UIView animateWithDuration:duration2 animations:^{
                             view.layer.transform = defaultTransform;
                         }];
                     }];
    
    
}


-(void) showRippleEffectAnimation:(float)duration fromView:(UIView *)view
{
    
    
    CATransition *animation = [CATransition animation];
    animation.duration = duration;
    animation.timingFunction =UIViewAnimationCurveEaseInOut;
    animation.fillMode = kCAFillModeForwards;
    
    [animation setType:@"rippleEffect"];
    [view.layer addAnimation:animation forKey:@"rippleEffect"];
    
}

//旋转
-(void) rotationAnimation:(NSString *)keyPath animationDegree:(CGFloat)degree animationDuration:(float)duration fromView:(UIView *)view
{
    
    CABasicAnimation *roteAnimation=[CABasicAnimation animationWithKeyPath:keyPath];
    roteAnimation.toValue=[NSNumber numberWithFloat:degreesToRadian(degree)];
    roteAnimation.duration=duration;
    roteAnimation.removedOnCompletion=NO;
    
    // roteAnimation.repeatCount=10;
    roteAnimation.fillMode=kCAFillModeForwards;
    
    
    [view.layer addAnimation:roteAnimation forKey:@"rotationAnimation"];
    
    
}


-(void) showCubAnimation:(float)duration direction:(NSString *)direction fromView:(UIView *)view
{
    
    CATransition *animation = [CATransition animation];
    animation.duration = duration;
    animation.timingFunction = UIViewAnimationCurveEaseInOut;
    animation.type = @"cube";
    animation.subtype = direction;
    [[view layer] addAnimation:animation forKey:@"animation"];
    
    
}


- (void)dealloc
{
    
    
    
    
    
    
}





@end
