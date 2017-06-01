//
//  QSCookAPIManage.m
//  RandomMenu
//
//  Created by ZJ-Jie on 2017/5/31.
//  Copyright © 2017年 Jie. All rights reserved.
//

#import "QSCookAPIManage.h"
#import "QSAPIURL.h"
#import "QSClient.h"
#import <YYKit.h>

static NSString * const kMaxPageNumber = @"10";

@implementation QSCookAPIManage

+ (instancetype)sharedManage {
    static dispatch_once_t onceToken;
    static QSCookAPIManage *sharedManage = nil;
    dispatch_once(&onceToken, ^{
        sharedManage = [self new];
    });
    return sharedManage;
}

- (NSURLSessionDataTask *)searchMenuWithDishName:(NSString *)name pageNumber:(NSString *)page block:(void (^)(id data, NSError *error))block {
    NSString *pages = page.length ? @"0":[NSString stringWithFormat:@"%ld",[page integerValue] * [kMaxPageNumber integerValue]];
    return [NetAPI post:KNetPath_Menus withParams:@{@"menu":name,@"pn":pages,@"rn":kMaxPageNumber} andBlock:^(id data, NSError *error) {
        
        QSMenuInfo *menuInfo = [QSMenuInfo modelWithJSON:data[@"result"]];
        
        [self safeBlockWithData:menuInfo error:error block:block];
    }];
}

- (NSURLSessionDataTask *)searchMenuWithMenuCategoryId:(NSInteger)CategoryId block:(void (^)(id data, NSError *error))block {
    NSDictionary *param = nil;
    if (CategoryId > 0) {
        param = @{@"parentid":@(CategoryId)};
    }
    return [NetAPI post:KNetPath_MenusCategory withParams:param andBlock:^(id data, NSError *error) {
        
        NSArray<QSParentInfo *> *parents = [NSArray modelArrayWithClass:[QSParentInfo class] json:data[@"result"]];
        
        [self safeBlockWithData:parents error:error block:block];
    }];
}

- (NSURLSessionDataTask *)searchMenuWithMenuIndex:(NSInteger)index pageNumber:(NSString *)page block:(void (^)(id data, NSError *error))block {
    NSString *pages = page.length ? @"0":[NSString stringWithFormat:@"%ld",[page integerValue] * [kMaxPageNumber integerValue]];
    return [NetAPI post:KNetPath_MenusWithIndex withParams:@{@"cid":@(index),@"pn":pages,@"rn":kMaxPageNumber} andBlock:^(id data, NSError *error) {
        
        QSMenuInfo *menuInfo = [QSMenuInfo modelWithJSON:data[@"result"]];
        
        [self safeBlockWithData:menuInfo error:error block:block];
    }];
}

- (NSURLSessionDataTask *)searchMenuWithMenuId:(NSInteger)menuId block:(void (^)(id data, NSError *error))block {
    return [NetAPI post:KNetPath_MenusID withParams:@{@"id":@(menuId)} andBlock:^(id data, NSError *error) {
        //TODO:处理数据
        QSMenuInfo *menuInfo = [QSMenuInfo modelWithJSON:data[@"result"]];
        [self safeBlockWithData:menuInfo error:error block:block];
    }];
}

- (void)safeBlockWithData:(id)data error:(NSError *)error block:(void (^)(id data, NSError *error))block {
    if (block) {
        if (data) {
            error = nil;
        }
        if ([NSThread isMainThread]) {
            block(data, error);
        } else {
            dispatch_async(dispatch_get_main_queue(), ^{
                block(data, error);
            });
        }
    }
}

@end
