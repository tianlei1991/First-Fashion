//
//  Brand2CollectionCell.m
//  Tmgou
//
//  Created by qianfeng on 16/9/21.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

#import "Brand2CollectionCell.h"
@interface Brand2CollectionCell()
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *contenLabel;
@property (weak, nonatomic) IBOutlet UIImageView *iconImagview;
@end
@implementation Brand2CollectionCell
-(void)setModel:(Brandmodel *)model{
    brandStoryModel *stoymodel = (brandStoryModel *)model;
    self.titleLabel.text = stoymodel.title;
    self.contenLabel.text  = stoymodel.summary;
    [self.iconImagview sd_setImageWithURL:[NSURL URLWithString:stoymodel.picture] placeholderImage:[UIImage imageNamed:@"453_80921_813949.jpg"]];

}
- (void)awakeFromNib {
    [super awakeFromNib];
}

@end
