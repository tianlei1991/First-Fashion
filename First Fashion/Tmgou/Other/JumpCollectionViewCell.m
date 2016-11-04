//
//  JumpCollectionViewCell.m
//  Tmgou
//
//  Created by qianfeng on 16/9/27.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

#import "JumpCollectionViewCell.h"
@interface JumpCollectionViewCell()
@property (weak, nonatomic) IBOutlet UIImageView *coverImg;

@end
@implementation JumpCollectionViewCell
- (void)setModel:(HeadviewModel *)model{
    [self.coverImg sd_setImageWithURL:[NSURL URLWithString:model.coverImg] placeholderImage:[UIImage imageNamed:@"1"]];

}
- (void)awakeFromNib {
    [super awakeFromNib];
}

@end
