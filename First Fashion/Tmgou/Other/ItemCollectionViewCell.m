//
//  ItemCollectionViewCell.m
//  Tmgou
//
//  Created by qianfeng on 16/10/13.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

#import "ItemCollectionViewCell.h"
@interface ItemCollectionViewCell()
@property (weak, nonatomic) IBOutlet UIImageView *iconImagview;
@property (weak, nonatomic) IBOutlet UILabel *cantanLabie;
@property (weak, nonatomic) IBOutlet UILabel *piersLabel;
@property (weak, nonatomic) IBOutlet UILabel *liveLabel;



@end
@implementation ItemCollectionViewCell
-(void)setModel:(itemListModel *)model{

    [self.iconImagview sd_setImageWithURL:[NSURL URLWithString:model.url] placeholderImage:[UIImage imageNamed:@"1"]];
    self.cantanLabie.text = model.title;
    self.piersLabel.text = model.price;
    


}
- (void)awakeFromNib {
    [super awakeFromNib];
}

@end
