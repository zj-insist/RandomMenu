//
//  NSError+QSMessage.m
//  RandomMenu
//
//  Created by ZJ-Jie on 2017/5/31.
//  Copyright © 2017年 Jie. All rights reserved.
//

#import "NSError+QSMessage.h"

NSString *const QSNetWorkErrorDomain = @"QSNetWorkErrorDomain";

@implementation NSError (QSMessage)

- (NSString *)message {
    //TODO:处理错误请求的类型
    if([self.domain isEqualToString:QSNetWorkErrorDomain]) {
        NSString *msg = self.userInfo[@"reason"];
        if (self.userInfo[@"msg"] != [NSNull null] && msg.length) {
            return msg;
        }
    }
    
    if (self.code == NSURLErrorCancelled || self.code == NSURLErrorTimedOut) {
        return @"";
    }
    if (self.localizedDescription.length) {
        return self.localizedDescription;
    }
    return @"请求异常";
}

@end
