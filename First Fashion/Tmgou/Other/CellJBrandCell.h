//
//  CellJBrandCell.h
//  Tmgou
//
//  Created by qianfeng on 16/10/10.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CellBranJumpModel.h"
@interface CellJBrandCell : UITableViewCell
@property (nonatomic,strong) CellBranJumpModel *model ;
@property (nonatomic,copy) void (^blockButtclick)(NSInteger index);
@end
