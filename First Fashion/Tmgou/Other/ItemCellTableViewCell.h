//
//  ItemCellTableViewCell.h
//  Tmgou
//
//  Created by qianfeng on 16/10/13.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ItemCellTableViewCell : UITableViewCell
@property (nonatomic,strong) NSArray *DataSource;
@property (nonatomic,copy) void (^Buttblock)();
@property (nonatomic,copy) void (^cellBlcok)(NSString *joinstring);
@end
