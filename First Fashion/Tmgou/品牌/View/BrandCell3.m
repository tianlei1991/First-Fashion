//
//  BrandCell3.m
//  Tmgou
//
//  Created by qianfeng on 16/9/21.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

#import "BrandCell3.h"
@interface BrandCell3()
@property (weak, nonatomic) IBOutlet UIView *TitleView;
@property (weak, nonatomic) IBOutlet UIImageView *oneimageview;
@property (weak, nonatomic) IBOutlet UIImageView *towImagview;
@property (weak, nonatomic) IBOutlet UILabel *titleimgaV1;
@property (weak, nonatomic) IBOutlet UILabel *titleImagV1tow;
@property (weak, nonatomic) IBOutlet UILabel *titleImagV2;
@property (weak, nonatomic) IBOutlet UILabel *titleIamgV2tow;
@property (nonatomic,copy)  NSString *tempString;
@property (weak, nonatomic) IBOutlet UIButton *butt;

@end
@implementation BrandCell3
-(void)setDataSource:(NSArray *)DataSource{
    _DataSource = DataSource;
    self.butt.layer.cornerRadius = self.butt.layer.cornerRadius = self.butt.frame.size.height/2.0;
    
    self.butt.layer.masksToBounds = YES;
    lookBookModel *model1 = [DataSource firstObject];
    lookBookModel *model2 = [DataSource lastObject];
 NSString *titleNewstring1 = [self CutOUtSubstring:model1.title];
 NSString *titleNewstring2 =[self CutOUtSubstring:model2.title];
    self.titleimgaV1.text = titleNewstring1;
    self.titleImagV1tow.text = model1.title;
    self.titleImagV2.text = titleNewstring2;
    self.titleIamgV2tow.text = model2.title;
    [self.oneimageview sd_setImageWithURL:[NSURL URLWithString:model1.coverImg] placeholderImage:[UIImage imageNamed:@"1"]];
    UITapGestureRecognizer *gesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(jumpACtion)];
    
    [self.oneimageview addGestureRecognizer:gesture];
   
    
    
    
   [self.towImagview sd_setImageWithURL:[NSURL URLWithString:model2.coverImg] placeholderImage:[UIImage imageNamed:@"1"]];
      UITapGestureRecognizer *gesture1 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(jumpACtion2)];
    [self.towImagview addGestureRecognizer:gesture1];
}
- (void)jumpACtion{

    lookBookModel *model1 = self.DataSource[false];
    self.CellJumpblcok(model1.newsId);
    

}
- (void)jumpACtion2{

    lookBookModel *model1 = self.DataSource[1];
    self.CellJumpblcok1(model1.newsId);

}
- (NSString *)CutOUtSubstring:(NSString *)supString{
    NSRegularExpression *regularExpression = [NSRegularExpression regularExpressionWithPattern:@"[a-zA-Z]" options:0 error:nil];
    NSArray *matches = [regularExpression matchesInString:supString options:0 range:NSMakeRange(0, supString.length)];
    NSUInteger lastIdx = 0;
    for (NSTextCheckingResult* match in matches)
        
    {
        
        NSRange range = match.range;
        
        if (range.location > lastIdx)
            
        {
            
            self.tempString = [supString substringWithRange:NSMakeRange(lastIdx, range.location - lastIdx+1)];
          
            
        }
    }

    return self.tempString;


}

- (IBAction)buttjump:(id)sender {
    self.ButtjumpAction();
}

- (void)awakeFromNib {
    [super awakeFromNib];
    }

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}

- (IBAction)InterButtjump:(id)sender {
    
    self.interactivejumoBlock();
}
@end
