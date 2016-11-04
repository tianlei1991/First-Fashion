//
//  BrandDetailCell.m
//  Tmgou
//
//  Created by hj on 16/10/3.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

#import "BrandDetailCell.h"
@interface BrandDetailCell()
@property (weak, nonatomic) IBOutlet UIImageView *backgroudview;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@end
@implementation BrandDetailCell

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event
{
    
    
    return self;
}

-(void)setModel:(BandetailsDModel *)model{

    [self.backgroudview sd_setImageWithURL:[NSURL URLWithString:model.listBackground] placeholderImage:[UIImage imageNamed:@"1"]];
    self.titleLabel.text = model .title;
    self.titleLabel.font = [UIFont systemFontOfSize:19];
    [self.titleLabel setTextColor:[UIColor whiteColor]];


}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
