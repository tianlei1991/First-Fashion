//
//  buttItemJumoCell.m
//  Tmgou
//
//  Created by qianfeng on 16/10/18.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

#import "buttItemJumoCell.h"
@interface buttItemJumoCell()
@property (weak, nonatomic) IBOutlet UIImageView *sourceurlimgaview;
@property (weak, nonatomic) IBOutlet UILabel *titlelabel;
@property (weak, nonatomic) IBOutlet UILabel *pricelabel;
@property (weak, nonatomic) IBOutlet UILabel *pricetypelabel;
@property (weak, nonatomic) IBOutlet UILabel *likelabel;



@end
@implementation buttItemJumoCell
- (void)setModel:(ButtItemJumpModel *)model{

    [self.sourceurlimgaview sd_setImageWithURL:[NSURL URLWithString:model.url] placeholderImage:[UIImage imageNamed:@"1"]];
    self.titlelabel.text = model.title;
    self.pricelabel.text = model.price;
    self.pricetypelabel.text = model.priceType;
    self.likelabel.text = model.like;
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

@end
