//
//  BranStoryJumpCell2.m
//  Tmgou
//
//  Created by qianfeng on 16/10/15.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

#import "BranStoryJumpCell2.h"
@interface BranStoryJumpCell2()
@property (weak, nonatomic) IBOutlet UILabel *contensLabel;
@property (weak, nonatomic) IBOutlet UILabel *arrconutlabel;
@property (weak, nonatomic) IBOutlet UILabel *recodrlabel;



@end
@implementation BranStoryJumpCell2
- (void)setModel:(BrandSToryCellModel *)model{

    self.contensLabel.text = model.descriptionInfo;
    self.arrconutlabel.text = model.arrcount;
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
