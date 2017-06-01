//
//  QSMenuModel.m
//  RandomMenu
//
//  Created by ZJ-Jie on 2017/5/31.
//  Copyright © 2017年 Jie. All rights reserved.
//

#import "QSMenuModel.h"

@implementation QSCookStep

@end

@implementation QSMenuModel

+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"menuId" : @"id"};
}

+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"steps" : [QSCookStep class],
             @"albums" : [NSString class]
             };
}

@end

@implementation QSMenuInfo

+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"data" : [QSMenuModel class]};
}

@end
