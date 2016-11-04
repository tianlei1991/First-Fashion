//
//  Cell1.m
//  Tmgou
//
//  Created by qianfeng on 16/9/14.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

#import "Cell1.h"
@interface Cell1()
@property (weak, nonatomic) IBOutlet UIView *BjView;
@property (weak, nonatomic) IBOutlet UIImageView *coverImage;

@property (weak, nonatomic) IBOutlet UILabel *channelabel;
@property (weak, nonatomic) IBOutlet UILabel *bloggerlabel;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (nonatomic,copy) NSString *Tiemrlabel;

@property (nonatomic) CGFloat cellheigth;
@end
@implementation Cell1

- (void)awakeFromNib {
    [super awakeFromNib];
    self.BjView.backgroundColor = [UIColor colorWithRed:arc4random()%256/255.0 green:arc4random()%256/255.0 blue:arc4random()%256/255.0 alpha:1.0];
    self.channelabel.backgroundColor = self.BjView.backgroundColor;
    self.channelabel.textColor = [UIColor whiteColor];
    self.bloggerlabel.backgroundColor = self.BjView.backgroundColor;
    self.bloggerlabel.textColor = [UIColor whiteColor];

}
- (void)setModel:(SelecTionModel *)model{


    [self.coverImage sd_setImageWithURL:[NSURL URLWithString:model.coverImg] placeholderImage:[UIImage imageNamed:@"1.jpg"]];
    self.channelabel.text = model.channelName;
    self.bloggerlabel.text = model.bloggerName;
    self.titleLabel.text = model.title;
  
}


@end
