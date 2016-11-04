//
//  CellBrandBookCell.m
//  Tmgou
//
//  Created by qianfeng on 16/10/17.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

#import "CellBrandBookCell.h"
@interface CellBrandBookCell()

@property (weak, nonatomic) IBOutlet UIImageView *urlImagview;


@end
@implementation CellBrandBookCell
- (void)setModel:(CellBrandBookModel *)model{

    [self.urlImagview sd_setImageWithURL:[NSURL URLWithString:model.imgUrl] placeholderImage:[UIImage imageNamed:@"1"]];


}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

@end
