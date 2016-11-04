//
//  JumptitleCell.m
//  Tmgou
//
//  Created by qianfeng on 16/10/13.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

#import "JumptitleCell.h"
@interface JumptitleCell()
@property (weak, nonatomic) IBOutlet UIButton *butthidder;

@end
@implementation JumptitleCell
-(void)setModel:(CellBranJumpModel *)model{
    if (model.enSummary.length!=0) {
        self.butthidder.hidden = YES;

    }else{
        self.butthidder.hidden = NO;

    }

}
//跳转url
- (IBAction)JumpButt:(id)sender {
    
    self.blockJumpintercativoVC();
    
}
- (void)awakeFromNib {
    [super awakeFromNib];
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
