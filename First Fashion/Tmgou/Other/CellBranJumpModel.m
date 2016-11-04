//
//  CellBranJumpModel.m
//  Tmgou
//
//  Created by qianfeng on 16/10/10.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

#import "CellBranJumpModel.h"
@implementation CellbrandStoryModel
+ (BOOL)propertyIsOptional:(NSString *)propertyName{
    return YES;
}
@end
@implementation CellinteractiveModel
+ (BOOL)propertyIsOptional:(NSString *)propertyName{
    return YES;
}
+ (JSONKeyMapper *)keyMapper{
    
    
    return [[JSONKeyMapper alloc] initWithDictionary:@{@"interactive.interactiveOption":@"interactiveOption",@"brandInfo.follow":@"follow",@"interactive.interactiveUserCount":@"interactiveUserCount"}];
    
}


@end
@implementation newsListModel
+ (BOOL)propertyIsOptional:(NSString *)propertyName{
    return YES;
}
@end
@implementation similarBrandModel
+ (BOOL)propertyIsOptional:(NSString *)propertyName{
    return YES;
}
@end
@implementation itemListModel
+ (BOOL)propertyIsOptional:(NSString *)propertyName{
    return YES;


}

+ (JSONKeyMapper *)keyMapper{
    
    
    return [[JSONKeyMapper alloc] initWithDictionary:@{@"img.url":@"url"}];
    
}


@end
@implementation CellBranJumpModel
+ (BOOL)propertyIsOptional:(NSString *)propertyName{

    return YES;
}
+ (JSONKeyMapper *)keyMapper{
    
    
    return [[JSONKeyMapper alloc] initWithDictionary:@{@"brandInfo.logo":@"logo",@"brandInfo.title":@"title",@"brandInfo.followers":@"followers",@"brandNews.newsList":@"newsList",@"brandNews.blubInfo.title":@"blubInfotitle",@"brandNews.blubInfo.jumpUrl":@"NowjumpUrl",@"brandInfo.background":@"background",@"brandInfo.summary":@"summary",@"brandInfo.brandId":@"brandId"}];
    
}










        








@end
