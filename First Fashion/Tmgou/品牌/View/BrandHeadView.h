//
//  BrandHeadView.h
//  Tmgou
//
//  Created by qianfeng on 16/9/21.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BrandHeadView : UIView
- (void)setScrollViewPageNumber:(NSArray *)datasourec;
@property (nonatomic,copy) void(^jumpBlock)(NSString *url,NSString *index);

@end
