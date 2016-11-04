//
//  UserOptionCollectionViewCell.m
//  Tmgou
//
//  Created by qianfeng on 16/10/12.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

#import "UserOptionCollectionViewCell.h"
@interface UserOptionCollectionViewCell()
@property (weak, nonatomic) IBOutlet UIImageView *iconImagView;
@property (weak, nonatomic) IBOutlet UILabel *contenlabel;
@property (weak, nonatomic) IBOutlet UIButton *liftbutt;
@property (weak, nonatomic) IBOutlet UIView *titleview;
@property (weak, nonatomic) IBOutlet UIButton *regthButt;
@property (weak, nonatomic) IBOutlet UILabel *numberLabel;


//图片的高度
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *viewhigth;





@end
@implementation UserOptionCollectionViewCell
- (void)setModel:(CellinteractiveModel *)model{
    [self.iconImagView sd_setImageWithURL:[NSURL URLWithString:model.coverImg] placeholderImage:[UIImage imageNamed:@"1"]];
    if (model.coverImg.length !=0) {
       
        self.viewhigth.constant = 110;
        
    }else{
       
        self.viewhigth.constant = 0;
    }
    
     NSDictionary *lift =  [model.interactiveOption firstObject];
      NSDictionary *regth =  [model.interactiveOption lastObject];
    self.contenlabel.text = model.title;
    self.numberLabel.text = model.interactiveUserCount;
    [self.liftbutt setTitle:lift[@"optionName"] forState:UIControlStateNormal];
    [self.regthButt setTitle:regth[@"optionName"] forState:UIControlStateNormal];
}
- (void)awakeFromNib {
    [super awakeFromNib];
}
- (IBAction)leftButtAction:(UIButton *)sender {
    if (self.leftblock) {
        self.leftblock();

    }
    
}
- (IBAction)regthButtAction:(UIButton *)sender {
    
    if (self.regthblock) {
        self.regthblock();

    }
    


}

@end
