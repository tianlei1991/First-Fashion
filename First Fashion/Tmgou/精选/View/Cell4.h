//
//  Cell4.h
//  Tmgou
//
//  Created by qianfeng on 16/9/18.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Cell4 : UITableViewCell
@property (nonatomic,strong)SelecTionModel *model;
@property (nonatomic,strong) NSArray *DataSource;
@property (nonatomic,copy) void(^jumpblock)(CellfiveModel *model);
@property (nonatomic,copy) void (^jumpVC)(NSString *title);
@end
