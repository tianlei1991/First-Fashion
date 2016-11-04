//
//  AFmanage.m
//  Tmgou
//
//  Created by qianfeng on 16/9/12.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

#import "AFmanage.h"

@interface AFmanage()
@end
@implementation AFmanage
+ (instancetype)ShareInstance{

    static AFmanage *manager = nil;
    static dispatch_once_t oneceToken;
    dispatch_once(&oneceToken, ^{
        manager = [[AFmanage alloc]init];
    });
    return manager;

}
- (void)getDataFormNet:(NSString *)str andSuccsee:(succseedBlock)succ and:(Error)error{
    AFHTTPSessionManager *sessionManger = [AFHTTPSessionManager manager];
    sessionManger.responseSerializer = [AFHTTPResponseSerializer serializer];
    [sessionManger GET:str parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        succ(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
        
    }];

}
@end
