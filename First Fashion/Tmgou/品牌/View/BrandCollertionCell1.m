//
//  BrandCollertionCell1.m
//  Tmgou
//
//  Created by qianfeng on 16/9/21.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

#import "BrandCollertionCell1.h"

@interface BrandCollertionCell1()
@property (weak, nonatomic) IBOutlet UIImageView *iconView;

@end
@implementation BrandCollertionCell1
-(void)setModel:(Brandmodel *)model
{
    brandListModel *listmodel = (brandListModel *)model;
    [self.iconView sd_setImageWithURL:[NSURL URLWithString:listmodel.logo] placeholderImage:[UIImage imageNamed:@"453_80921_813949.jpg"]];
 

}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

@end
