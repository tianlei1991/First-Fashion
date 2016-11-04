//
//  BrandCell3.h
//  Tmgou
//
//  Created by qianfeng on 16/9/21.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BrandCell3 : UITableViewCell
@property (nonatomic,strong) NSArray *DataSource;
@property (nonatomic,copy) void (^ButtjumpAction)();

@property (nonatomic,copy) void (^CellJumpblcok)(NSString *urlid);
@property (nonatomic,copy) void (^CellJumpblcok1)(NSString *urlid);

@property (nonatomic,copy) void (^interactivejumoBlock)();

@end
