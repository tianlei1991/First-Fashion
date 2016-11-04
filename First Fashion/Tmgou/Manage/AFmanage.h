//
//  AFmanage.h
//  Tmgou
//
//  Created by qianfeng on 16/9/12.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef void (^succseedBlock)(id object);
typedef void (^Error)(NSError *error);
@interface AFmanage : NSObject
+ (instancetype)ShareInstance;
//最新的url
- (void)getDataFormNet:(NSString *)str  andSuccsee:(succseedBlock)succ and:(Error)error;
//加载的url
//-(void)oldDataSource:(NSString *)str  AndPage:(NSString *)PageStr  andSuccsee:(succseedBlock)succ and:(Error)error;
//;
//- (void)getdata:(NSString *)url andsuccsee:(void(^)(NSString *str))block;
@end
