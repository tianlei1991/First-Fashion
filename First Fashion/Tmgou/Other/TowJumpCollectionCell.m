//
//  TowJumpCollectionCell.m
//  Tmgou
//
//  Created by qianfeng on 16/9/28.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

#import "TowJumpCollectionCell.h"
@interface TowJumpCollectionCell()
@property (weak, nonatomic) IBOutlet UILabel *titeLabel;
@property (weak, nonatomic) IBOutlet UIImageView *UrlImage;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@property (weak, nonatomic) IBOutlet UIImageView *HeadView;
@property (weak, nonatomic) IBOutlet UILabel *lovelabe;
@end
@implementation TowJumpCollectionCell
- (void)setModel:(Cellcontens *)model{
    self.titeLabel.text = model.title;
    
    [self.UrlImage sd_setImageWithURL:[NSURL URLWithString:model.url] placeholderImage:[UIImage imageNamed:@"453_80921_813949.jpg"]];
    self.priceLabel.text = [NSString stringWithFormat:@"%@%@",model.priceType,model.price];
   
    self.lovelabe.text = model.likes;

}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

@end
