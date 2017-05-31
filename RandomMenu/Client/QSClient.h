//
//  QSClient.h
//  RandomMenu
//
//  Created by ZJ-Jie on 2017/5/27.
//  Copyright © 2017年 Jie. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AFNetworking.h>

#define NetAPI [QSClient sharedClient]

@interface QSClient : AFHTTPSessionManager

+ (instancetype)sharedClient;

/**
 GET请求

 @param url <#url description#>
 @param params <#params description#>
 @param block <#block description#>
 @return <#return value description#>
 */
- (NSURLSessionDataTask *)get:(NSString *)url withParams:(NSDictionary*)params andBlock:(void (^)(id data, NSError *error))block;

/**
 POST请求

 @param url <#url description#>
 @param params <#params description#>
 @param block <#block description#>
 @return <#return value description#>
 */
- (NSURLSessionDataTask *)post:(NSString *)url withParams:(NSDictionary*)params andBlock:(void (^)(id data, NSError *error))block;

@end
