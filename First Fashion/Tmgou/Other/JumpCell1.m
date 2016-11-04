//
//  JumpCell1.m
//  Tmgou
//
//  Created by hj on 16/9/26.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

#import "JumpCell1.h"
@interface JumpCell1()
@property (weak, nonatomic) IBOutlet UIView *BjView;
@property (weak, nonatomic) IBOutlet UIImageView *coverImage;

@property (weak, nonatomic) IBOutlet UILabel *channelabel;
@property (weak, nonatomic) IBOutlet UILabel *bloggerlabel;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (nonatomic,copy) NSString *Tiemrlabel;
@end
@implementation JumpCell1


- (void)setModel:(JumpModel *)model{

    [self.coverImage sd_setImageWithURL:[NSURL URLWithString:model.coverImg] placeholderImage:[UIImage imageNamed:@"1.jpg"]];
    self.titleLabel.text = model.title;
    self.bloggerlabel.text = model.bloggerName;
     NSString * newtiemr =  [self dataTest:model.time];
    self.channelabel.text = [NSString stringWithFormat:@"|%@",newtiemr];

}
- (void)awakeFromNib {
    [super awakeFromNib];
    self.BjView.backgroundColor = [UIColor colorWithRed:arc4random()%256/255.0 green:arc4random()%256/255.0 blue:arc4random()%256/255.0 alpha:1.0];
    self.channelabel.backgroundColor = self.BjView.backgroundColor;
    self.channelabel.textColor = [UIColor whiteColor];
    self.bloggerlabel.backgroundColor = self.BjView.backgroundColor;
    self.bloggerlabel.textColor = [UIColor whiteColor];

}
- (NSString *)dataTest:(NSString *)timer{
    
    NSRange range = NSMakeRange(0, 10);
    NSString *result = [timer substringWithRange:range];
    NSString *ret = @"";
    NSCalendar *cal = [NSCalendar currentCalendar];
    NSDate *pubtime = [NSDate dateWithTimeIntervalSince1970:result.doubleValue];
    NSDate *now = [NSDate date ];
    NSDateComponents *pubComponents = [cal components:NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitHour | NSCalendarUnitMinute fromDate:pubtime];
    NSDateComponents *nowCompents = [cal components:NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitHour | NSCalendarUnitMinute fromDate:now];
    if (pubComponents.day - nowCompents.day!=0) {
        ret = [NSString stringWithFormat:@"%02ld-%02ld", pubComponents.month, pubComponents.day];
        
    }
    else
    {
        ret = [NSString stringWithFormat:@"%02ld:%02ld", pubComponents.hour, pubComponents.minute];
    }
    
    
    return ret;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
