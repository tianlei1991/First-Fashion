//
//  CellJBrandCell.m
//  Tmgou
//
//  Created by qianfeng on 16/10/10.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

#import "CellJBrandCell.h"
@interface CellJBrandCell ()
@property (weak, nonatomic) IBOutlet UIImageView *logoImagv;

@property (weak, nonatomic) IBOutlet UILabel *titlelabel;

@property (weak, nonatomic) IBOutlet UILabel *followerslabel;
@property (weak, nonatomic) IBOutlet UILabel *summaryLabel;

@property (weak, nonatomic) IBOutlet UIButton *buttAction;

@end
@implementation CellJBrandCell
- (void)setModel:(CellBranJumpModel *)model{

    [self.logoImagv sd_setImageWithURL:[NSURL URLWithString:model.logo] placeholderImage:[UIImage imageNamed:@"1"]];
    self.titlelabel.text = model.title;
    self.followerslabel.text = model.followers;
    self.summaryLabel.text = model.summary;
    [self.buttAction setImage:[UIImage imageNamed:@"comment_arrow.png"] forState:UIControlStateNormal];
    [self.buttAction setImage:[UIImage imageNamed:@"comment_arrowbooun.png"] forState:UIControlStateSelected];

}
- (IBAction)buttaction:(UIButton *)sender {
//    self.selected =! self.selected;
    sender.selected =! sender.selected;
    if (sender.selected == YES) {
        self.summaryLabel.numberOfLines = 0;
    }else{
    
    self.summaryLabel.numberOfLines = 4;
    }
    if (self.blockButtclick) {
        self.blockButtclick(sender.selected);
    }
}
- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
