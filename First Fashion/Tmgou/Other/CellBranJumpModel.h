//
//  CellBranJumpModel.h
//  Tmgou
//
//  Created by qianfeng on 16/10/10.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

#import "JSONModel.h"
//品牌故事
@protocol CellbrandStoryModel;
@interface CellbrandStoryModel : JSONModel
@property (nonatomic,copy) NSString *title;
@property (nonatomic,copy) NSString *time;
@property (nonatomic,copy) NSString *coverImg;
@property (nonatomic,copy) NSString *newsId;
@property (nonatomic,copy) NSString *summary;
@end

//互动
@protocol CellinteractiveModel;
@interface CellinteractiveModel : JSONModel
@property (nonatomic,copy) NSString *showType;
@property (nonatomic,copy) NSString *jumpType;
@property (nonatomic,copy) NSString *coverImg;
@property (nonatomic,copy) NSString *newsId;
@property (nonatomic,copy) NSString *title;
@property (nonatomic,copy) NSString *time;
@property (nonatomic,copy) NSString *newsDetailUrl;//wepview
@property (nonatomic,copy) NSString *interactiveUserCount;
@property (nonatomic,strong) NSArray *interactiveOption;
@property (nonatomic,copy) NSString *follow;
@property (nonatomic,assign) CGFloat cellheigth;
@end

//品牌资讯
@protocol newsListModel;
@interface newsListModel : JSONModel
@property (nonatomic,copy) NSString *coverImg;
@property (nonatomic,copy) NSString *title;
@property (nonatomic,copy) NSString *source;
@property (nonatomic,copy) NSString *newsId;
@end


//类似品牌
@protocol similarBrandModel ;
@interface similarBrandModel : JSONModel
@property (nonatomic,copy) NSString *brandId;//push自己的url拼接用的
@property (nonatomic,copy) NSString *logo;//背景图片
@property (nonatomic,copy) NSString *title;
@end


//shopping商品
@protocol itemListModel;
@interface itemListModel : JSONModel
@property (nonatomic,copy) NSString *itemId;
@property (nonatomic,copy) NSString *title;
@property (nonatomic,copy) NSString *sourceUrl;//跳转页面
@property (nonatomic,copy) NSString *priceType;
@property (nonatomic,copy) NSString *price;
@property (nonatomic,copy) NSString *url;
@property (nonatomic) CGFloat ItemHeigth;
@end



@interface CellBranJumpModel : JSONModel
@property (nonatomic,copy) NSString *logo;
@property (nonatomic,copy) NSString *brandId;
@property (nonatomic,copy) NSString *background;
@property (nonatomic,copy) NSString *title;
@property (nonatomic,copy) NSString *followers;//追逐者
@property (nonatomic,copy) NSString *summary;
@property (nonatomic,copy) NSString *blubInfotitle;//品牌资讯title
@property (nonatomic,copy) NSString *NowjumpUrl;//品牌资讯跳转
@property (nonatomic,copy) NSString *enSummary;
@property (nonatomic,strong) NSArray <CellbrandStoryModel > *brandStory;//品牌故事
@property (nonatomic,strong) NSArray <CellinteractiveModel> *interactive;
@property (nonatomic,strong) NSArray <newsListModel> *newsList;//品牌资源
@property (nonatomic,strong) NSArray <similarBrandModel> *similarBrand;
@property (nonatomic,strong) NSArray <itemListModel> *itemList;//单品

@end



