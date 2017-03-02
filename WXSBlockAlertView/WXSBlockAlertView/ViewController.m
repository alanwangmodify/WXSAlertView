//
//  ViewController.m
//  WXSBlockAlertView
//
//  Created by AlanWang on 17/3/2.
//  Copyright © 2017年 AlanWang. All rights reserved.
//

#import "ViewController.h"
#import "WXSBlockAlertView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(20, 100, 200, 200)];
    btn.backgroundColor = [UIColor yellowColor];
    [btn addTarget:self action:@selector(clickAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}
- (void)clickAction {
    [[[WXSBlockAlertView alloc] initWithTitle:@"title" message:@"message" cancelButtonTitle:@"cancel" clickButton:^(NSInteger index)  {
        
        NSLog(@"%zd",index);
        
    } otherButtonTitles:@"1",@"2",@"3",nil] show];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
