//
//  interactiveCell2.h
//  Tmgou
//
//  Created by qianfeng on 16/10/17.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "InteractiveJumpModel.h"
@interface interactiveCell2 : UITableViewCell
@property (nonatomic,strong)InteractiveJumpModel *model;
@property (nonatomic,copy) void (^blockaction)();
@end
