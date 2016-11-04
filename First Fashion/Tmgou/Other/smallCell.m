//
//  smallCell.m
//  Tmgou
//
//  Created by hj on 16/10/11.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

#import "smallCell.h"
@interface smallCell()
@property (weak, nonatomic) IBOutlet UILabel *NowtitleLabel;
@property (weak, nonatomic) IBOutlet UIButton *butt;

@property (weak, nonatomic) IBOutlet UILabel *clickLabel;

@end
@implementation smallCell
- (void)setMytitle:(NSString *)mytitle{

    if (mytitle.length ==0) {
        self.clickLabel.text = @"搜索中，请稍后";
        self.clickLabel.text = @"抱歉没有发现这个地方";
    }else{
    
        self.clickLabel.text = mytitle;
    }
    
    UITapGestureRecognizer *gusture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(LabeLAcTion )];
    self.clickLabel.userInteractionEnabled = YES;
    [self.clickLabel addGestureRecognizer:gusture];
    
}



//跳转Map
- (void)LabeLAcTion{
    self.blockActionAddview(self.clickLabel.text);
    
}
//跳转tableview界面
- (IBAction)jumpMap:(id)sender {
    self.blcokActionJumptableiview();
}

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


@end
