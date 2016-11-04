//
//  smallCell.h
//  Tmgou
//
//  Created by hj on 16/10/11.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

#import <UIKit/UIKit.h>
//地图
@interface smallCell : UITableViewCell
@property (nonatomic,strong) NSString *mytitle;
@property (nonatomic,copy) void(^blockActionAddview)(NSString *jumpmaptitle);
@property (nonatomic,copy) void (^blcokActionJumptableiview)();

@end
