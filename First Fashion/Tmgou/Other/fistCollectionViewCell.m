//
//  fistCollectionViewCell.m
//  Tmgou
//
//  Created by qianfeng on 16/9/29.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

#import "fistCollectionViewCell.h"
@interface fistCollectionViewCell()
@property (weak, nonatomic) IBOutlet UIImageView *coverImg;

@end
@implementation fistCollectionViewCell
- (void)setModel:(DisfistHeadModel *)model{
    
    [self.coverImg sd_setImageWithURL:[NSURL URLWithString:model.coverImg] placeholderImage:[UIImage imageNamed:@"1"]];
    
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

@end
