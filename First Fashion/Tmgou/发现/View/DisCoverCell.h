//
//  DisCoverCell.h
//  Tmgou
//
//  Created by qianfeng on 16/9/19.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DisCoverModel.h"
@interface DisCoverCell : UITableViewCell
@property (nonatomic,strong)DisCoverModel *model;
@property (nonatomic,copy) void (^jumpwebViewblock)(newsListModle *model);
@property (nonatomic,copy) void (^jumpVCblock)(NSString *Urlstring,NSString *changgename);
@end
