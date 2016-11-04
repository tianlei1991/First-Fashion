//
//  HeadView.h
//  Tmgou
//
//  Created by qianfeng on 16/9/13.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HeadView : UIView
- (void)setScrollViewPageNumber:(NSArray *)datasourec;
@property (nonatomic,copy) void(^jumpblock)(NSString *urlString);
@end
