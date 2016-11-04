//
//  smallCollectionViewCell.m
//  Tmgou
//
//  Created by qianfeng on 16/10/13.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

#import "smallCollectionViewCell.h"
@interface smallCollectionViewCell()
@property (weak, nonatomic) IBOutlet UIImageView *logoView;


@end
@implementation smallCollectionViewCell
- (void)setModel:(similarBrandModel *)model{

    [self.logoView sd_setImageWithURL:[NSURL URLWithString:model.logo] placeholderImage:[UIImage imageNamed:@"1"]];


}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

@end
