//
//  TowJnmpCell.h
//  Tmgou
//
//  Created by qianfeng on 16/9/28.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CellShopModel.h"
@interface TowJnmpCell : UITableViewCell
@property (nonatomic,strong) CellShopModel *model;
@property (nonatomic,copy) void (^blockReload)();
@property (nonatomic,copy)void (^jumpBlock)(NSString *UrlSource);
@end
