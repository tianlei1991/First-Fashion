//
//  Brandmodel.m
//  Tmgou
//
//  Created by qianfeng on 16/9/21.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

#import "Brandmodel.h"

@implementation brandListModel
+ (BOOL)propertyIsOptional:(NSString *)propertyName{
    return YES;
}

@end


@implementation brandStoryModel
+ (BOOL)propertyIsOptional:(NSString *)propertyName{
    return YES;
}

@end
@implementation lookBookModel
+ (BOOL)propertyIsOptional:(NSString *)propertyName{
    return YES;
}

@end

@implementation interactiveModel
+ (BOOL)propertyIsOptional:(NSString *)propertyName{
    return YES;
}
+ (JSONKeyMapper *)keyMapper{
    
    
    return [[JSONKeyMapper alloc] initWithDictionary:@{@"interactive.interactiveUserCount":@"interactiveUserCount",@"interactive.interactiveOption":@"interactiveOption"}];
}
@end
@implementation Brandmodel
+ (BOOL)propertyIsOptional:(NSString *)propertyName{
    return YES;
}


@end
