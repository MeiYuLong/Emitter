//
//  ViewController.m
//  Emitter粒子效果
//
//  Created by 梅玉龙 on 2017/4/13.
//  Copyright © 2017年 梅玉龙. All rights reserved.
//

#import "ViewController.h"
#import "MYLEmitter.h"

@interface ViewController ()

@property (nonatomic,strong)UIButton *button;

@end

@implementation ViewController{
    CAEmitterLayer *_emitterLayer;//粒子发射器
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.button = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [self.button setFrame:CGRectMake(100, 100, 80, 80)];
    self.button.layer.masksToBounds = YES;
    self.button.layer.cornerRadius = self.button.frame.size.width/2;
    self.button.backgroundColor = [UIColor cyanColor];
    [self.button addTarget:self action:@selector(changeValue:) forControlEvents:UIControlEventTouchUpInside];
    [self.button addTarget:self action:@selector(startChangeOpinsion:withEvent:) forControlEvents:UIControlEventTouchDragInside];
    [self.button addTarget:self action:@selector(endChangeOpinsion:withEvent:) forControlEvents:UIControlEventTouchUpOutside];
    
    [self.view addSubview:self.button];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor blackColor];
    
    [self createEmitter];
    
#pragma mark 有待封装
//    [MYLEmitter addEmitterwithEmitterPosition:nil withEmitterSize:nil
//                                     withView:self.button];
    
   }

- (void)createEmitter{
    // 创建粒子Layer
    _emitterLayer = [CAEmitterLayer layer];
    
    // 粒子发射位置
    _emitterLayer.emitterPosition = CGPointMake(self.button.frame.origin.x+self.button.frame.size.width/2, self.button.frame.origin.y+self.button.frame.size.height/2);
    
    // 发射源的尺寸大小
    _emitterLayer.emitterSize     = self.button.frame.size
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
    [self.view.layer addSublayer:_emitterLayer];

}

- (void)changeValue:(UIButton *)bu{
    
    NSLog(@"KISS ME");
}

- (void)startChangeOpinsion:(UIControl *)c withEvent:ev{
    c.center = [[[ev allTouches] anyObject] locationInView:self.view];
    _emitterLayer.emitterPosition = CGPointMake(self.button.frame.origin.x+self.button.frame.size.width/2, self.button.frame.origin.y+self.button.frame.size.height/2);
}
- (void)endChangeOpinsion:(UIControl *)c withEvent:ev{
    c.center = [[[ev allTouches] anyObject] locationInView:self.view];
    _emitterLayer.emitterPosition = CGPointMake(self.button.frame.origin.x+self.button.frame.size.width/2, self.button.frame.origin.y+self.button.frame.size.height/2);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
