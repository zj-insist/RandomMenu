//
//  QSCookAPIManage.h
//  RandomMenu
//
//  Created by ZJ-Jie on 2017/5/31.
//  Copyright © 2017年 Jie. All rights reserved.
//

#import <Foundation/Foundation.h>

#define Net [QSCookAPIManage sharedManage]

@interface QSCookAPIManage : NSObject

+ (instancetype)sharedManage;

/**
 根据菜名查询菜谱

 @param name <#name description#>
 @param page <#page description#>
 @param block <#block description#>
 @return <#return value description#>
 */
- (NSURLSessionDataTask *)searchMenuWithDishName:(NSString *)name pageNumber:(NSString *)page block:(void (^)(id data, NSError *error))block;

/**
 查询菜谱分类，不传id默认查询所有

 @param CategoryId <#CategoryId description#>
 @param block <#block description#>
 @return <#return value description#>
 */
- (NSURLSessionDataTask *)searchMenuWithMenuCategoryId:(NSInteger)CategoryId block:(void (^)(id data, NSError *error))block;

/**
 按标签检索菜谱

 @param index <#index description#>
 @param page <#page description#>
 @param block <#block description#>
 @return <#return value description#>
 */
- (NSURLSessionDataTask *)searchMenuWithMenuIndex:(NSInteger)index pageNumber:(NSString *)page block:(void (^)(id data, NSError *error))block;

/**
 按菜谱 ID 查看详细

 @param menuId <#menuId description#>
 @param block <#block description#>
 @return <#return value description#>
 */
- (NSURLSessionDataTask *)searchMenuWithMenuId:(NSInteger)menuId block:(void (^)(id data, NSError *error))block;

@end
