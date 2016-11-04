//
//  BrandCell2.h
//  Tmgou
//
//  Created by qianfeng on 16/9/21.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Brandmodel.h"
@interface BrandCell2 : UITableViewCell
@property (nonatomic,strong) NSArray *DataSource;
@property (nonatomic,copy) void(^jumpbolckButt)();
@property (nonatomic,copy) void (^jumpblockCell)(NSString *myid);
@end
