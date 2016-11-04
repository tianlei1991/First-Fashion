//
//  CellShopModel.m
//  Tmgou
//
//  Created by qianfeng on 16/9/28.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

#import "CellShopModel.h"
@implementation Cellcontens
+ (BOOL)propertyIsOptional:(NSString *)propertyName{
    return YES;
}
+ (JSONKeyMapper *)keyMapper{
    
    
    return [[JSONKeyMapper alloc] initWithDictionary:@{@"img.url":@"url"}];
}

@end
@implementation CellShopModel
+ (BOOL)propertyIsOptional:(NSString *)propertyName{
    return YES;
}

@end
