//
//  NewsCollectionViewCell.m
//  Tmgou
//
//  Created by qianfeng on 16/10/13.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

#import "NewsCollectionViewCell.h"
@interface NewsCollectionViewCell()
@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@property (weak, nonatomic) IBOutlet UILabel *ContenLabel;

@end
@implementation NewsCollectionViewCell
-(void)setModel:(newsListModel *)model{

    [self.iconView sd_setImageWithURL:[NSURL URLWithString:model.coverImg] placeholderImage:[UIImage imageNamed:@"1"]];
    self.ContenLabel.text = model.title;

}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

@end
