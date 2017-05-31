//
//  ViewController.m
//  RandomMenu
//
//  Created by ZJ-Jie on 2017/5/27.
//  Copyright © 2017年 Jie. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)touch:(UIButton *)sender {
    switch (sender.tag) {
        case 1:
            [Net searchMenuWithDishName:@"红烧肉" pageNumber:nil block:^(id data, NSError *error) {
                
            }];
            break;
        case 2:
            [Net searchMenuWithMenuCategoryId:0 block:^(id data, NSError *error) {
                
            }];
            break;
        case 3:
            [Net searchMenuWithMenuIndex:10005 pageNumber:nil block:^(id data, NSError *error) {
                
            }];
            break;
        case 4:
            [Net searchMenuWithMenuId:2 block:^(id data, NSError *error) {
                
            }];
            break;
        default:
            break;
    }
}


@end
