//
//  Cell2.m
//  Tmgou
//
//  Created by qianfeng on 16/9/14.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

#import "Cell2.h"
@interface Cell2()
@property (weak, nonatomic) IBOutlet UILabel *channelLaber;
@property (weak, nonatomic) IBOutlet UILabel *bloggerLabel;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIImageView *coverImage;

@end
@implementation Cell2

- (void)awakeFromNib {
    [super awakeFromNib];

}

- (void)setModel:(SelecTionModel *)model{
    self.channelLaber.text = model.channelName;
    self.bloggerLabel.text = model.bloggerName;
    self.titleLabel.text   = model.title;
    [self.coverImage sd_setImageWithURL:[NSURL URLWithString:model.coverImg] placeholderImage:[UIImage imageNamed:@"1"]];

}

@end
