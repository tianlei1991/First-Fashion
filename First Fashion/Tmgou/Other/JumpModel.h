//
//  JumpModel.h
//  Tmgou
//
//  Created by qianfeng on 16/9/26.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

#import "JSONModel.h"

@interface JumpModel : JSONModel
@property (nonatomic,copy) NSString *coverImg;
@property (nonatomic,copy) NSString *title;
@property (nonatomic,copy) NSString *newsId;//跳转web;
@property (nonatomic,copy) NSString *time;//时间
@property (nonatomic,copy) NSString *showType;
@property (nonatomic,copy) NSString *jumpType;
@property (nonatomic,copy) NSString *bloggerName;//时间前面title
@property (nonatomic,copy) NSString *channelName;
@end
