//
//  QSParentInfo.h
//  RandomMenu
//
//  Created by ZJ-Jie on 2017/6/1.
//  Copyright © 2017年 Jie. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface QSParentCategory : NSObject

@property (nonatomic, copy) NSString * categoryId;
@property (nonatomic, copy) NSString * name;
@property (nonatomic, copy) NSString * parentId;

@end

@interface QSParentInfo : NSObject

@property (nonatomic, strong) NSArray<QSParentCategory *> *list;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *parentId;

@end

