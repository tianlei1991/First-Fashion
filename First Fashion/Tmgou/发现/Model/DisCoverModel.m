//
//  DisCoverModel.m
//  Tmgou
//
//  Created by qianfeng on 16/9/19.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

#import "DisCoverModel.h"
@implementation newsListModle

+ (BOOL)propertyIsOptional:(NSString *)propertyName{
    return YES;
}
+ (JSONKeyMapper *)keyMapper{
    
    
    return [[JSONKeyMapper alloc] initWithDictionary:@{@"channelInfo.channelId":@"channelId",@"channelInfo.channelName":@"channelName"}];
}
@end
@implementation DisCoverModel
+ (BOOL)propertyIsOptional:(NSString *)propertyName{
    return YES;
}

+ (JSONKeyMapper *)keyMapper{
    
    
    return [[JSONKeyMapper alloc] initWithDictionary:@{@"blubInfo.title":@"title"}];
}
@end
