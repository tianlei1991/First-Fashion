//
//  JumpModel.m
//  Tmgou
//
//  Created by qianfeng on 16/9/26.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

#import "JumpModel.h"

@implementation JumpModel
+ (BOOL)propertyIsOptional:(NSString *)propertyName{
    return YES;
}
+ (JSONKeyMapper *)keyMapper{
    
    
    return [[JSONKeyMapper alloc] initWithDictionary:@{@"bloggerInfo.bloggerName":@"bloggerName",@"channelInfo.channelId":@"channelId",@"channelInfo.channelId":@"channelId",@"channelInfo.channelName":@"channelName"}];
}
@end
