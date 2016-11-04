//
//  Cell2CollectionCell.m
//  Tmgou
//
//  Created by qianfeng on 16/10/11.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

#import "Cell2CollectionCell.h"
@interface Cell2CollectionCell()
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *contenLabel;
@property (weak, nonatomic) IBOutlet UIImageView *iconImagview;
@end
@implementation Cell2CollectionCell
- (void)setModel:(CellbrandStoryModel *)model{
    self.titleLabel.text = model.title;
    self.contenLabel.text = model.summary;
    [self.iconImagview sd_setImageWithURL:[NSURL URLWithString:model.coverImg] placeholderImage:[UIImage imageNamed:@"1"]];
    


}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

@end
