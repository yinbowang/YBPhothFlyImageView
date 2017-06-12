//
//  YBPhothFlyImageView.m
//  图片上传动画
//
//  Created by wyb on 2017/6/12.
//  Copyright © 2017年 中天易观. All rights reserved.
//

#import "YBPhothFlyImageView.h"
#define KScreenWidth [UIScreen mainScreen].bounds.size.width
#define KScreenHeight [UIScreen mainScreen].bounds.size.height



@interface YBPhothFlyImageView()<CAAnimationDelegate>

@end

@implementation YBPhothFlyImageView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
      
        
    }
    return self;
}

- (void)startFlyAnimation
{
    UIBezierPath *phothPath = [UIBezierPath bezierPath];
    [phothPath moveToPoint:self.center];
    CGPoint endPoint = CGPointMake(KScreenWidth/2.0, KScreenHeight/2.0);
    // 随机数
    NSInteger i = arc4random_uniform(2);
    NSInteger rotationDirection = 1 - (2*i);
    
    CGPoint controlPoint = CGPointMake(KScreenWidth/2.0 + (100+arc4random_uniform(KScreenWidth/2.0))*rotationDirection, (KScreenHeight-130-KScreenHeight/2.0)/2.0+ KScreenHeight/2.0 + rotationDirection*(30 + arc4random_uniform(30)));
    
    [phothPath addQuadCurveToPoint:endPoint controlPoint:controlPoint];
    
    
    CAKeyframeAnimation *keyFrameAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    keyFrameAnimation.path = phothPath.CGPath;
    keyFrameAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    
    CABasicAnimation *opacityAnimation = [CABasicAnimation animationWithKeyPath:@"opacity"];
    opacityAnimation.fromValue = @1;
    opacityAnimation.toValue = @0;
    
    CABasicAnimation *scallAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    scallAnimation.fromValue = @1;
    scallAnimation.toValue = @0.5;
    
    CABasicAnimation *rotateAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotateAnimation.toValue = @(rotationDirection*2*M_PI);
    
    CAAnimationGroup *positionGroup = [CAAnimationGroup animation];
    positionGroup.animations = @[keyFrameAnimation,opacityAnimation,scallAnimation,rotateAnimation];
    positionGroup.duration = 1;
    positionGroup.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    positionGroup.delegate = self;
    //如果不加这句[self animationForKey:@"ani1"]是nil
    //    positionGroup.removedOnCompletion = NO;
    //    positionGroup.fillMode = kCAFillModeForwards;
    //kvc记录layer的值方便在代理方法里移除
    //    [positionGroup setValue:self forKey:@"likeLayer"];
    [self.layer addAnimation:positionGroup forKey:@"positionGroup"];
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    [self removeFromSuperview];
}


@end
