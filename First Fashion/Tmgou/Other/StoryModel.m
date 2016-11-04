//
//  StoryModel.m
//  Tmgou
//
//  Created by qianfeng on 16/10/15.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

#import "StoryModel.h"

@implementation StoryModel
+ (BOOL)propertyIsOptional:(NSString *)propertyName{
    return YES;
}
+ (JSONKeyMapper *)keyMapper{
    
    
    return [[JSONKeyMapper alloc] initWithDictionary:@{@"brandInfo.logo":@"logo",@"brandInfo.brandId":@"brandId"}];
    
}
@end
