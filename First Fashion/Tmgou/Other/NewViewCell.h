//
//  NewViewCell.h
//  Tmgou
//
//  Created by qianfeng on 16/10/13.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

#import <UIKit/UIKit.h>
//品牌资讯
@interface NewViewCell : UITableViewCell
@property (nonatomic,strong) NSArray *DataSource;
@property (nonatomic,copy) void(^ButtJumpblock)();
@property (nonatomic,copy) void(^CellblockJump)(NSString *url);

@end
