//
//  JumpHeadView.h
//  Tmgou
//
//  Created by qianfeng on 16/9/27.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface JumpHeadView : UIView
@property (nonatomic,strong) NSArray *dataSource;
@property (nonatomic,copy) void (^blockCilck)(NSString *Url);
@end
