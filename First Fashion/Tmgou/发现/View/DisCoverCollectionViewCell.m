//
//  DisCoverCollectionViewCell.m
//  Tmgou
//
//  Created by qianfeng on 16/9/20.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

#import "DisCoverCollectionViewCell.h"
@interface DisCoverCollectionViewCell()
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIImageView *UrliconImage;
@end
@implementation DisCoverCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
}
- (void)setModel:(DisCoverModel *)model{
    newsListModle *modellist =(newsListModle *) model;
  
    self.titleLabel.text = modellist.title;
    if ([modellist.coverImg rangeOfString:@"v1cOC.webp"].location != NSNotFound) {
        
        NSString *str =  [modellist.coverImg substringWithRange:NSMakeRange(0, modellist.coverImg.length-19)];
         [self.UrliconImage sd_setImageWithURL:[NSURL URLWithString:str] placeholderImage:[UIImage imageNamed:@"453_79800_140864.jpg"]];
        
    }else
    {
        //条件为假，表示不包含要检查的字符串
         [self.UrliconImage sd_setImageWithURL:[NSURL URLWithString:modellist.coverImg] placeholderImage:[UIImage imageNamed:@"453_79800_140864.jpg"]];
    }
    
   
    
    
    
    
    
}

@end
