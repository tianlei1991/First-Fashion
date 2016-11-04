//
//  DisCoverModel.h
//  Tmgou
//
//  Created by qianfeng on 16/9/19.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

#import "JSONModel.h"
@interface newsListModle :JSONModel
@property (nonatomic,copy) NSString *sourceCover;
@property (nonatomic,copy) NSString *title;
@property (nonatomic,copy) NSString *newsDetailUrl;
@property (nonatomic,copy) NSString *coverImg;
@property (nonatomic,copy) NSString *contentUrl;
@property (nonatomic,copy) NSString *showType;
@property (nonatomic,copy) NSString *newsId;
@property (nonatomic,copy) NSString *channelId;
@property (nonatomic,copy) NSString *channelName;

@end
@protocol newsListModle;
@interface DisCoverModel : JSONModel
@property (nonatomic,copy) NSString *title;
@property (nonatomic,copy) NSString *showType;
@property (nonatomic,strong) NSArray <newsListModle>*newsList;
@end
