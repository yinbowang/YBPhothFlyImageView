//
//  ViewController.m
//  图片上传动画
//
//  Created by wyb on 2017/6/12.
//  Copyright © 2017年 中天易观. All rights reserved.
//

#import "ViewController.h"
#import "YBPhothFlyImageView.h"

#define KScreenWidth self.view.bounds.size.width

#define KScreenHeight  self.view.bounds.size.height
@interface ViewController ()



@property(nonatomic,strong)NSTimer *timer;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    YBPhothFlyImageView *imageView = [[YBPhothFlyImageView alloc]initWithFrame:CGRectMake((KScreenWidth-100)/2.0, KScreenHeight-100, 100, 100)];
    NSInteger index = arc4random_uniform(11);
    NSString *str = [NSString stringWithFormat:@"%ld.jpg",index];
    imageView.image = [UIImage imageNamed:str];
    [self.view addSubview:imageView];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [super touchesBegan:touches withEvent:event];
    
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(add) userInfo:nil repeats:YES];
    self.timer = timer;

    
}


- (void)add {
   
    NSLog(@"add");
    YBPhothFlyImageView *imageView = [[YBPhothFlyImageView alloc]initWithFrame:CGRectMake((KScreenWidth-100)/2.0, KScreenHeight-100, 100, 100)];
    NSInteger index = arc4random_uniform(11);
    NSString *str = [NSString stringWithFormat:@"%ld.jpg",index];
    imageView.image = [UIImage imageNamed:str];
    [self.view addSubview:imageView];
    
    [imageView startFlyAnimation];
    

}


@end
