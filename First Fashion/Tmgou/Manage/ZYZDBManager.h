//
//  ZYZDBManager.m
//  FMDB封装
//
//  Created by Jarvan on 15/12/15.
//  Copyright (c) 2015年 Jarvan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FMDatabase.h"
// 线程安全
#import "FMDatabaseQueue.h"
// 使用到RunTime机制所需要包含的
#import <objc/runtime.h>



@interface ZYZDBManager : NSObject

/** 类方法,快速实例化对象*/
+ (instancetype)shareDBManager;

/** 增加模型数据*/
- (BOOL)insertDbWithModel:(id)model;
/** 删除模型数据*/
- (BOOL)deleteDbWithModel:(id)model;
/** 修改模型数据*/
- (BOOL)updateDbWithNewModel:(id)newModel oldModel:(id)oldModel;
/** 查询整个表单数据*/
- (NSMutableArray *)selectWithModel:(id)model;

/** 按条件查询数据*/


/** 删除所有数据*/
- (BOOL)removeAllDataWithModel:(id)model;
@end