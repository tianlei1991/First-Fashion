//
//  BookBrandCollerCell.m
//  Tmgou
//
//  Created by qianfeng on 16/10/17.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

#import "BookBrandCollerCell.h"
@interface BookBrandCollerCell ()
@property (weak, nonatomic) IBOutlet UIImageView *iconImagview;
@property (weak, nonatomic) IBOutlet UILabel *BrandLabel;

@property (weak, nonatomic) IBOutlet UILabel *ContenLabel;
@end
@implementation BookBrandCollerCell
- (void)setModel:(BookBrandModel *)model{

    [self.iconImagview sd_setImageWithURL:[NSURL URLWithString:model.coverImg] placeholderImage:[UIImage imageNamed:@"1"]];
    self.BrandLabel.text = model.idtitle;
    self.ContenLabel.text = model.title;


}
- (void)awakeFromNib {
    [super awakeFromNib];
}

@end
