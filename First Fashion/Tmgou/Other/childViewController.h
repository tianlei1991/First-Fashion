//
//  childViewController.h
//  Tmgou
//
//  Created by qianfeng on 16/10/8.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface childViewController : UIViewController
@property (nonatomic,strong) NSMutableArray  *DataSource;
@property (nonatomic) NSInteger  count;
@property (nonatomic,copy)void (^block)(NSString *brandID,NSString *tirle);
@end
