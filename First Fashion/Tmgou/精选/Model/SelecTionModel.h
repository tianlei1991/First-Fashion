//
//  SelecTionModel.h
//  Tmgou
//
//  Created by qianfeng on 16/9/13.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

#import "JSONModel.h"
@interface CellfiveModel:JSONModel
@property (nonatomic,copy) NSString *labeltitle;
@property (nonatomic,copy) NSString *title;
@property (nonatomic,copy) NSString *newsDetailUrl;
@property (nonatomic,copy) NSString *sourceCover;
@property (nonatomic,copy) NSString *contentUrl;
@end
@protocol CellfiveModel;
@interface SelecTionModel : JSONModel
@property (nonatomic,copy) NSString *coverImg;
@property (nonatomic,copy) NSString *title;
@property (nonatomic,copy) NSString *source;
@property (nonatomic,copy) NSString *jumpType;
@property (nonatomic,copy) NSString *showType;
@property (nonatomic,copy) NSString *channelName;
@property (nonatomic,copy) NSString *bloggerName;
@property (nonatomic,copy) NSString *type;
@property (nonatomic,strong) NSArray <CellfiveModel>*newsList;
@property (nonatomic,copy) NSString *contentUrl;
@property (nonatomic,copy) NSString *jumpUrl;
@property (nonatomic,copy) NSString *TimerLaber;
@property (nonatomic,copy) NSString *Celltitle;
@property (nonatomic,copy) NSString *enId;//跳转用的。。！

@end
