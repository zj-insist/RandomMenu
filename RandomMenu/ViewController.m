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
            [Net searchMenuWithDishName:@"红烧肉" pageNumber:nil block:^(QSMenuInfo *data, NSError *error) {
                QSMenuModel *model = [data.data firstObject];
                NSLog(@"%@",model);
            }];
            break;
        case 2:
            [Net searchMenuWithMenuCategoryId:0 block:^( NSArray<QSParentInfo *> *data, NSError *error) {
                
            }];
            break;
        case 3:
            [Net searchMenuWithMenuIndex:20 pageNumber:nil block:^(QSMenuInfo *data, NSError *error) {
                
            }];
            break;
        case 4:
            [Net searchMenuWithMenuId:2 block:^(QSMenuInfo *data, NSError *error) {
                
            }];
            break;
        default:
            break;
    }
}


@end
