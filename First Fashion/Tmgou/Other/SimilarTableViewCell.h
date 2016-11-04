//
//  SimilarTableViewCell.h
//  Tmgou
//
//  Created by qianfeng on 16/10/13.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SimilarTableViewCell : UITableViewCell
@property (nonatomic,strong) NSArray *dataSource;
@property (nonatomic,copy) void(^blockJump)(NSString *brandId,NSString *totitle);
@end
