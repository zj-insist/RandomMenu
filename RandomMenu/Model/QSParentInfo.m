//
//  QSParentInfo.m
//  RandomMenu
//
//  Created by ZJ-Jie on 2017/6/1.
//  Copyright © 2017年 Jie. All rights reserved.
//

#import "QSParentInfo.h"

@implementation QSParentCategory

+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"categoryId" : @"id"};
}

@end

@implementation QSParentInfo

+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"list" : [QSParentCategory class]};
}

@end
