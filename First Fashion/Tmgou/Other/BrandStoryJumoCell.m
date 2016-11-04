//
//  BrandStoryJumoCell.m
//  Tmgou
//
//  Created by qianfeng on 16/10/15.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

#import "BrandStoryJumoCell.h"
@interface BrandStoryJumoCell()
@property (weak, nonatomic) IBOutlet UIImageView *iconImage;
@property (weak, nonatomic) IBOutlet UIView *hiddeView;
@property (weak, nonatomic) IBOutlet UILabel *contensLabel;
@property (weak, nonatomic) IBOutlet UILabel *ArrcountLabel;

@property (weak, nonatomic) IBOutlet UILabel *recodrlabel;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *heigthLayout;
@property (nonatomic,strong) UIImageView *imageview;
@end
@implementation BrandStoryJumoCell
- (void)setModel:(BrandSToryCellModel *)model{
    
    if (model.descriptionInfo.length == 0) {
        self.hiddeView.hidden = YES;
        self.heigthLayout.constant =0;


    }else{
        self.heigthLayout.constant =223;

        self.hiddeView.hidden = NO;
        
    }
   
   
    [self.iconImage sd_setImageWithURL:[NSURL URLWithString:model.imgUrl] placeholderImage:[UIImage imageNamed:@"453_79800_140864.jpg"]];
    self.contensLabel.text = model.descriptionInfo;
    self.ArrcountLabel.text = model.arrcount;
     NSString *Newrecodr = [NSString stringWithFormat:@"%@/",model.recordNumber];
    self.recodrlabel.text = Newrecodr;
    

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
