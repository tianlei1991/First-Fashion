//
//  intebrand2cell.m
//  Tmgou
//
//  Created by qianfeng on 16/10/20.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

#import "intebrand2cell.h"
@interface intebrand2cell()
@property (weak, nonatomic) IBOutlet UIImageView *coveiamgview;
@property (weak, nonatomic) IBOutlet UILabel *interacCountlabel;
@property (weak, nonatomic) IBOutlet UILabel *titlelabel;
@property (weak, nonatomic) IBOutlet UIButton *leftButt;
@property (weak, nonatomic) IBOutlet UIButton *rigthbutt;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *imgaviewhigth;



@end

@implementation intebrand2cell
- (void)setModel:(InteBrandModel *)model{
    
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
- (IBAction)jumpAction:(id)sender {
    if (self.blockaction) {
        self.blockaction();
        
    }
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
