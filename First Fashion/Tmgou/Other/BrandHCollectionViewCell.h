//
//  BrandHCollectionViewCell.h
//  Tmgou
//
//  Created by hj on 16/10/2.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BrandHModel.h"
@interface BrandHCollectionViewCell : UICollectionViewCell
@property (nonatomic,strong) BrandHModel *model ;
@property (nonatomic,copy) void(^reloadCell)();
@end
