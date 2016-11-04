//
//  InteractiveJumpModel.h
//  Tmgou
//
//  Created by qianfeng on 16/10/17.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

#import "JSONModel.h"

@interface InteractiveJumpModel : JSONModel
@property (nonatomic,copy) NSString *showType;
@property (nonatomic,copy) NSString *jumpType;
@property (nonatomic,copy) NSString *coverImg;
@property (nonatomic,copy) NSString *newsId;
@property (nonatomic,copy) NSString *title;
@property (nonatomic,copy) NSString *time;
@property (nonatomic,copy) NSArray  *interactiveOption;
@property (nonatomic,copy) NSString *newsDetailUrl;
@property (nonatomic,strong) NSNumber *interactiveUserCount;
@end
