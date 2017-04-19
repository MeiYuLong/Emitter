//
//  MYLEmitter.m
//  Emitter粒子效果
//
//  Created by 梅玉龙 on 2017/4/14.
//  Copyright © 2017年 梅玉龙. All rights reserved.
//

#import "MYLEmitter.h"

@implementation MYLEmitter

+ (void)addEmitterwithEmitterPosition:(CGPoint *)point withEmitterSize:(CGSize *)size withView:(UIView *)view{
    
    // 创建粒子Layer
    CAEmitterLayer* _emitterLayer = [CAEmitterLayer layer];
    
    // 创建粒子Layer
    _emitterLayer = [CAEmitterLayer layer];
    
    // 粒子发射位置
    _emitterLayer.emitterPosition = CGPointMake(view.frame.origin.x+view.frame.size.width/2, view.frame.origin.y+view.frame.size.height/2);
    
    // 发射源的尺寸大小
    _emitterLayer.emitterSize     = view.frame.size
    ;
    
    // 发射模式
    _emitterLayer.emitterMode     = kCAEmitterLayerSurface;
    
    // 发射源的形状
    _emitterLayer.emitterShape    = kCAEmitterLayerCircle;
    
    // 创建雪花类型的粒子
    CAEmitterCell *snowflake    = [CAEmitterCell emitterCell];
    
    // 粒子的名字
    snowflake.name = @"snow";
    
    // 粒子参数的速度乘数因子
    snowflake.birthRate = 20.0;
    snowflake.lifetime  = 120.0;
    
    // 粒子速度
    snowflake.velocity  = 100.0;
    
    // 粒子的速度范围
    snowflake.velocityRange = 10;
    
    // 粒子y方向的加速度分量
    snowflake.yAcceleration = 200;
    
    // 周围发射角度
    snowflake.emissionRange = 0.5 * M_PI;
    
    // 子旋转角度范围
    snowflake.spinRange = 0.25 * M_PI;
    snowflake.contents  = (id)[[UIImage imageNamed:@"littleOrangeIcon"] CGImage];
    
    // 设置雪花形状的粒子的颜色
    snowflake.color      = [[UIColor whiteColor] CGColor];
    snowflake.redRange   = 2.f;
    snowflake.greenRange = 2.f;
    snowflake.blueRange  = 2.f;
    
    snowflake.scaleRange = 0.6f;
    snowflake.scale      = 0.7f;
    
    _emitterLayer.shadowOpacity = 1.0;
    _emitterLayer.shadowRadius  = 0.0;
    _emitterLayer.shadowOffset  = CGSizeMake(0.0, 0.0);
    
    // 粒子边缘的颜色
    _emitterLayer.shadowColor  = [[UIColor whiteColor] CGColor];
    
    // 添加粒子
    _emitterLayer.emitterCells = @[snowflake];
    
    // 将粒子Layer添加进图层中
    [view.layer addSublayer:_emitterLayer];

}

@end
