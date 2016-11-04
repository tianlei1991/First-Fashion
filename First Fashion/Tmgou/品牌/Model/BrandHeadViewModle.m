//
//  BrandHeadViewModle.m
//  Tmgou
//
//  Created by qianfeng on 16/9/21.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

#import "BrandHeadViewModle.h"

@implementation BrandHeadViewModle
+ (BOOL)propertyIsOptional:(NSString *)propertyName{
    return YES;
}
+ (JSONKeyMapper *)keyMapper{
    
    
    return [[JSONKeyMapper alloc] initWithDictionary:@{@"result.shareImg":@"shareImg",@"result.shareUrl":@"shareUrl"}];
}
@end
