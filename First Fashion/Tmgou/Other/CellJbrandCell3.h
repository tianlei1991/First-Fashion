//
//  CellJbrandCell3.h
//  Tmgou
//
//  Created by qianfeng on 16/10/11.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

#import <UIKit/UIKit.h>
//互动
@interface CellJbrandCell3 : UITableViewCell
@property (nonatomic,strong) NSArray *DataSource;
@property (nonatomic,copy) void(^blockJump)(NSString *url);
@end
