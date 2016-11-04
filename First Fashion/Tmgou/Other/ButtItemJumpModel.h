//
//  ButtItemJumpModel.h
//  Tmgou
//
//  Created by qianfeng on 16/10/18.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

#import "JSONModel.h"

@interface ButtItemJumpModel : JSONModel
@property (nonatomic,copy) NSString *itemId;
@property (nonatomic,copy) NSString *url;
@property (nonatomic,copy) NSString *title;
@property (nonatomic,copy) NSString *brandId;
@property (nonatomic,copy) NSString *priceType;
@property (nonatomic,copy) NSString *price;
@property (nonatomic,copy) NSString *brandName;
@property (nonatomic,copy) NSString *like;
@property (nonatomic,copy) NSString *sourceUrl;
@end
