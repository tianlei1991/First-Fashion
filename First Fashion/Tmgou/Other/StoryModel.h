//
//  StoryModel.h
//  Tmgou
//
//  Created by qianfeng on 16/10/15.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

#import "JSONModel.h"

@interface StoryModel : JSONModel
@property (nonatomic,copy) NSString *coverImg;
@property (nonatomic,copy) NSString *title;
@property (nonatomic,copy) NSString *time;
@property (nonatomic,copy) NSString *summary;
@property (nonatomic,copy) NSString *newsId;

@property (nonatomic,copy) NSString *logo;
@property (nonatomic,copy) NSString *brandId;

@end
