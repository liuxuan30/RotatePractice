//
//  ViewController.m
//  RotatePractice
//
//  Created by Xuan on 1/26/16.
//  Copyright © 2016 Wingzero. All rights reserved.
//

#import "ViewController.h"
#import "RotateView.h"

@interface ViewController ()

@property (nonatomic, strong) RotateView *rotateView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.rotateView = [[RotateView alloc] initWithFrame:CGRectMake(375/2.0 - 50, 667/2.0 - 50, 100, 100)];
    self.rotateView.backgroundColor = [UIColor blueColor];
    self.rotateView.text = @"helloiqy";
    [self.view addSubview:self.rotateView];
}

@end
