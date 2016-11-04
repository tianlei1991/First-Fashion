//
//  InteBrandModel.m
//  Tmgou
//
//  Created by qianfeng on 16/10/20.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

#import "InteBrandModel.h"

@implementation InteBrandModel
+ (BOOL)propertyIsOptional:(NSString *)propertyName{
    return YES;
}
+ (JSONKeyMapper *)keyMapper{
    
    
    return [[JSONKeyMapper alloc] initWithDictionary:@{@"interactive.interactiveUserCount":@"interactiveUserCount",@"interactive.interactiveOption":@"interactiveOption"}];
}
@end
