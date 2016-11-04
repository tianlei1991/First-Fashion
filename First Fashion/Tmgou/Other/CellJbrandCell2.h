//
//  CellJbrandCell2.h
//  Tmgou
//
//  Created by qianfeng on 16/10/11.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CellBranJumpModel.h"

@interface CellJbrandCell2 : UITableViewCell
@property (nonatomic,strong) NSArray *dataSource;
@property (nonatomic,copy) void(^blockaction)(NSString *newid);
@end
