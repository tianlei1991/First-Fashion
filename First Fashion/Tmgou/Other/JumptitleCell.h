//
//  JumptitleCell.h
//  Tmgou
//
//  Created by qianfeng on 16/10/13.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CellBranJumpModel.h"
//互动
@interface JumptitleCell : UITableViewCell
@property (nonatomic,strong) CellBranJumpModel *model;
@property (nonatomic,copy) void (^blockJumpintercativoVC)();
@end
