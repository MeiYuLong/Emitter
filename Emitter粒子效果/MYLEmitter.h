//
//  MYLEmitter.h
//  Emitter粒子效果
//
//  Created by 梅玉龙 on 2017/4/14.
//  Copyright © 2017年 梅玉龙. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import <UIKit/UIKit.h>

@interface MYLEmitter : CAEmitterLayer

+ (void)addEmitterwithEmitterPosition:(CGPoint *)point withEmitterSize:(CGSize *)size withView:(UIView *)view;

@end
