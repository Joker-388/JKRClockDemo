//
//  ViewController.m
//  JKRLayerDemo
//
//  Created by Lucky on 2018/2/9.
//  Copyright © 2018年 Lucky. All rights reserved.
//

#import "ViewController.h"
#import "NSDate+JKRDate.h"

@interface ViewController ()

@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) CALayer *shi;
@property (nonatomic, strong) CALayer *fen;
@property (nonatomic, strong) CALayer *miao;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.imageView.frame = CGRectMake(self.view.frame.size.width * 0.5 - 150 + 5, self.view.frame.size.height * 0.5 - 150, 300, 300);
    self.imageView.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.imageView];
    
    self.shi.anchorPoint = CGPointMake(10 / 60.0, 0.5);
    self.fen.anchorPoint = CGPointMake(10 / 100.0, 0.5);
    self.miao.anchorPoint = CGPointMake(10 / 130.0, 0.5);
    
    self.shi.frame = CGRectMake(self.view.frame.size.width * 0.5, self.view.frame.size.height * 0.5, 60, 5);
    self.fen.frame = CGRectMake(self.view.frame.size.width * 0.5, self.view.frame.size.height * 0.5 + 1, 100, 3);
    self.miao.frame = CGRectMake(self.view.frame.size.width * 0.5, self.view.frame.size.height * 0.5 + 1.5, 130, 2);
    
    [self.view.layer addSublayer:self.shi];
    [self.view.layer addSublayer:self.fen];
    [self.view.layer addSublayer:self.miao];
    
    __weak typeof(self) weak__self = self;
    [NSTimer scheduledTimerWithTimeInterval:1.0 repeats:YES block:^(NSTimer * _Nonnull timer) {
        NSDate *now = [NSDate date];
        NSInteger hour = [now hour] > 12 ? ([now hour] - 12): [now hour];
        NSInteger minute = [now minute];
        NSInteger second = [now second];
        weak__self.shi.transform = CATransform3DMakeRotation(2 * M_PI * ((hour + minute / 60.0) / 12.0) - M_PI * 0.5, 0, 0, 1);
        weak__self.fen.transform = CATransform3DMakeRotation(2 * M_PI * ((minute + second / 60.0)/ 60.0) - M_PI * 0.5, 0, 0, 1);
        weak__self.miao.transform = CATransform3DMakeRotation(2 * M_PI * (second / 60.0) - M_PI * 0.5, 0, 0, 1);
    }];
}

- (UIImageView *)imageView {
    if (!_imageView) {
        _imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"timg-4"]];
    }
    return _imageView;
}

- (CALayer *)shi {
    if (!_shi) {
        _shi = [CALayer new];
        _shi.backgroundColor = [UIColor redColor].CGColor;
    }
    return _shi;
}

- (CALayer *)fen {
    if (!_fen) {
        _fen = [CALayer new];
        _fen.backgroundColor = [UIColor blueColor].CGColor;
    }
    return _fen;
}

- (CALayer *)miao {
    if (!_miao) {
        _miao = [CALayer new];
        _miao.backgroundColor = [UIColor greenColor].CGColor;
    }
    return _miao;
}

@end
