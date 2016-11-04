//
//  UserOptionCollectionViewCell.h
//  Tmgou
//
//  Created by qianfeng on 16/10/12.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CellBranJumpModel.h"

@interface UserOptionCollectionViewCell : UICollectionViewCell
@property (nonatomic,strong) CellinteractiveModel *model;
@property (nonatomic,copy) void (^leftblock)();
@property (nonatomic,copy) void (^regthblock)();
@end
