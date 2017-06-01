//
//  QSMenuModel.h
//  RandomMenu
//
//  Created by ZJ-Jie on 2017/5/31.
//  Copyright © 2017年 Jie. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QSCookStep : NSObject

@property(nonatomic, copy) NSString *img;
@property(nonatomic, copy) NSString *step;

@end

@interface QSMenuModel : NSObject

@property(nonatomic, copy) NSString *menuId;
@property (nonatomic, strong) NSArray<NSString *> *albums;
@property (nonatomic, copy) NSString *burden;
@property (nonatomic, copy) NSString *imtro;
@property (nonatomic, copy) NSString *ingredients;
@property (nonatomic, strong) NSArray<QSCookStep *> *steps;
@property (nonatomic, copy) NSString *tags;
@property (nonatomic, copy) NSString *title;

@end

@interface QSMenuInfo : NSObject

@property (nonatomic, strong) NSArray<QSMenuModel *> *data;
@property (nonatomic, copy) NSString *pn;
@property (nonatomic, copy) NSString *rn;
@property (nonatomic, copy) NSString *totalNum;

@end
