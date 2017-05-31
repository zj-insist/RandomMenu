//
//  NSError+QSMessage.h
//  RandomMenu
//
//  Created by ZJ-Jie on 2017/5/31.
//  Copyright © 2017年 Jie. All rights reserved.
//

#import <Foundation/Foundation.h>

extern NSString *const QSNetWorkErrorDomain;


@interface NSError (QSMessage)

@property (nonatomic, strong, readonly) NSString *message;

@end
