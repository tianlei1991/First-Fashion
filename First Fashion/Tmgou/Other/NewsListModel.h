//
//  NewsListModel.h
//  Tmgou
//
//  Created by qianfeng on 16/10/18.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

#import "JSONModel.h"

@interface NewsListModel : JSONModel
@property (nonatomic,copy) NSString *showType;
@property (nonatomic,copy) NSString *jumpType;
@property (nonatomic,copy) NSString *coverImg;
@property (nonatomic,copy) NSString *title;
@property (nonatomic,copy) NSString *time;
@property (nonatomic,copy) NSString *source;
@property (nonatomic,copy) NSString *newsId;

@end
