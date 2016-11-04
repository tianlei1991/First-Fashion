//
//  breadCell4.m
//  Tmgou
//
//  Created by qianfeng on 16/9/21.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

#import "breadCell4.h"
@interface breadCell4()
@property (weak, nonatomic) IBOutlet UIImageView *coverImage;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *numberintercactive;
@property (weak, nonatomic) IBOutlet UIButton *leftButt;
@property (weak, nonatomic) IBOutlet UIButton *regthButt;

@end
@implementation breadCell4
- (void)setModel:(Brandmodel *)model{
   
    interactiveModel *model1 = (interactiveModel *)model;
    self.titleLabel.text   = model1.title;
    [self.coverImage sd_setImageWithURL:[NSURL URLWithString:model1.coverImg] placeholderImage:[UIImage imageNamed:@"1"]];
    NSDictionary *leftadic = [model1.interactiveOption firstObject];
    NSDictionary *rigthdic = [model1.interactiveOption lastObject];
    [self.leftButt setTitle:leftadic[@"optionName"] forState:UIControlStateNormal];
    [self.regthButt setTitle:rigthdic[@"optionName"]forState:UIControlStateNormal];

}
- (IBAction)buttAction:(id)sender {
    self.buttblock();
}

- (void)awakeFromNib {
    [super awakeFromNib];
 }

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
