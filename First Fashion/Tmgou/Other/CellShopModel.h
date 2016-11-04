//
//  CellShopModel.h
//  Tmgou
//
//  Created by qianfeng on 16/9/28.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

#import "JSONModel.h"
@interface Cellcontens :JSONModel
@property (nonatomic,copy) NSString *title;
@property (nonatomic,copy) NSString *url;
@property (nonatomic,copy) NSString *sourceUrl;
@property (nonatomic,copy) NSString *likes;
@property (nonatomic,copy) NSString *price;
@property (nonatomic,copy) NSString *priceType;

@end
@protocol Cellcontens;
@interface CellShopModel : JSONModel
@property (nonatomic,copy) NSString *title;
@property (nonatomic,copy) NSString *newsId;
@property (nonatomic,strong) NSArray<Cellcontens> *list;
@property (nonatomic,copy) NSString *summary;
@property (nonatomic,copy) NSString *mpage;

@end
