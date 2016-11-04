//
//  intebrand2cell.h
//  Tmgou
//
//  Created by qianfeng on 16/10/20.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "InteBrandModel.h"
@interface intebrand2cell : UITableViewCell
@property (nonatomic,strong) InteBrandModel *model;
@property (nonatomic,copy) void (^blockaction)();
@end
