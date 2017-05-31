//
//  QSClient.m
//  RandomMenu
//
//  Created by ZJ-Jie on 2017/5/27.
//  Copyright © 2017年 Jie. All rights reserved.
//

#import "QSClient.h"
#import "QSAppKey.h"

typedef NS_ENUM(NSUInteger, QSRespondType) {
    QSRespondTypeGet,
    QSRespondTypePost
};

@interface QSClient()

@end

static NSString* const kBaseURL = @"http://apis.juhe.cn/cook";

@implementation QSClient

+ (instancetype)sharedClient {
    static QSClient *sharedClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedClient = [[self alloc] initWithBaseURL:[NSURL URLWithString:kBaseURL]];
    });
    
    return sharedClient;
}

- (instancetype)initWithBaseURL:(NSURL *)url {
    if (self = [super initWithBaseURL:url]) {
        /** 分别设置请求以及相应的序列化器 */
        self.requestSerializer = [AFHTTPRequestSerializer serializer];
        
        self.requestSerializer.timeoutInterval = 5;
        self.requestSerializer.cachePolicy = NSURLRequestReloadIgnoringLocalCacheData;
        
        AFJSONResponseSerializer * response = [AFJSONResponseSerializer serializer];
        
        response.removesKeysWithNullValues = YES;
        
        self.responseSerializer = response;
        
        /** 复杂的参数类型 需要使用 json 传值 - 设置请求内容的类型 */
        
//        [self.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Accept"];
        
//        [self.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
        
        self.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/plain", @"text/javascript", @"text/json", @"text/html", nil];
        
//         [self.requestSerializer setValue:kappKey forHTTPHeaderField:@"key"];
    }
    return self;
}

- (NSURLSessionDataTask *)get:(NSString *)url withParams:(NSDictionary*)params andBlock:(void (^)(id data, NSError *error))block {
    return [self setupClientWithRespondType:QSRespondTypeGet url:url params:params completeBlock:block];
}

- (NSURLSessionDataTask *)post:(NSString *)url withParams:(NSDictionary*)params andBlock:(void (^)(id data, NSError *error))block {
    return [self setupClientWithRespondType:QSRespondTypePost url:url params:params completeBlock:block];
}

- (NSURLSessionDataTask *)setupClientWithRespondType:(QSRespondType)type url:(NSString *)url params:(NSDictionary *)params completeBlock:(void (^)(id data, NSError *error))block {
    if (!params) {
        params = @{};
    }
    
    id successBlock = ^(NSURLSessionDataTask * _Nonnull task, NSDictionary *  _Nonnull responseObject) {
        NSError *error = [self handleResponse:responseObject url:url];
        if (error) {
            block(nil,error);
        } else {
            block(responseObject,nil);
        }
        
    };
    
    id failureBlock = ^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
        if (task.state == NSURLSessionTaskStateCompleted) {
            block(nil,error);
        }
    };
    
    url = [url stringByAppendingString:[NSString stringWithFormat:@"?key=%@",kappKey]];
    
    if (type == QSRespondTypeGet) {
        return [self GET:url parameters:params progress:nil success:successBlock failure:failureBlock];
    } else {
        return [self POST:url parameters:params progress:nil success:successBlock failure:failureBlock];
    }
}

-(NSError *)handleResponse:(NSDictionary *)responseJSON url:(NSString *)url
{
    NSError *error = nil;
    NSInteger resultCode = [responseJSON[@"resultcode"] integerValue];
    if (resultCode != 200) {
        error = [NSError errorWithDomain:QSNetWorkErrorDomain code:resultCode userInfo:responseJSON];
        [self showError:error url:url];
    }
    return error;
}

- (void)showError:(NSError *)error url:(NSString *)url {
    if (!error.message.length) {
        return;
    }
    dispatch_async(dispatch_get_main_queue(), ^{
        [kKeyWindow hudPostError:error.message];
    });
}


@end
