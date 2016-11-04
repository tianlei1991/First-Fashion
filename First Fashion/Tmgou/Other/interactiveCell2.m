//
//  interactiveCell2.m
//  Tmgou
//
//  Created by qianfeng on 16/10/17.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

#import "interactiveCell2.h"
@interface interactiveCell2()
@property (weak, nonatomic) IBOutlet UIImageView *coveiamgview;
@property (weak, nonatomic) IBOutlet UILabel *interacCountlabel;
@property (weak, nonatomic) IBOutlet UILabel *titlelabel;
@property (weak, nonatomic) IBOutlet UIButton *leftButt;
@property (weak, nonatomic) IBOutlet UIButton *rigthbutt;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *imgaviewhigth;




@end
@implementation interactiveCell2
- (void)setModel:(InteractiveJumpModel *)model{

    if (model.coverImg.length == 0) {
        self.imgaviewhigth.constant = 0;
    }else{
        self.imgaviewhigth .constant = 110;
    
    }
    
    
    [self.coveiamgview sd_setImageWithURL:[NSURL URLWithString:model.coverImg]];
    self.interacCountlabel.text = [NSString stringWithFormat:@"%@",model.interactiveUserCount];
    self.titlelabel.text = model.title;
    NSDictionary *leftadic = [model.interactiveOption firstObject];
    NSDictionary *rigthdic = [model.interactiveOption lastObject];
    [self.leftButt setTitle:leftadic[@"optionName"] forState:UIControlStateNormal];
    [self.rigthbutt setTitle:rigthdic[@"optionName"]forState:UIControlStateNormal];

}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
- (IBAction)jumpAction:(id)sender {
    if (self.blockaction) {
        self.blockaction();

    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
