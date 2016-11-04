///Users/qianfeng/Documents/Tmgou副本/Tmgou
//  SelecTionModel.m
//  Tmgou
//
//  Created by qianfeng on 16/9/13.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

#import "SelecTionModel.h"
@implementation CellfiveModel
+ (BOOL)propertyIsOptional:(NSString *)propertyName{
    return YES;
}


@end
@implementation SelecTionModel
+ (BOOL)propertyIsOptional:(NSString *)propertyName{
    return YES;
}
//这个是该属性的。。！
+ (JSONKeyMapper *)keyMapper{
    
    
    return [[JSONKeyMapper alloc] initWithDictionary:@{@"channelInfo.channelName":@"channelName",@"bloggerInfo.bloggerName":@"bloggerName",@"blubInfo.jumpUrl":@"jumpUrl",@"blubInfo.title":@"Celltitle",@"blubInfo.entityId":@"enId",@"channelInfo.channelId":@"channelId"}];
}

@end
