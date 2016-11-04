//
//  BrandCell5.m
//  Tmgou
//
//  Created by qianfeng on 16/9/22.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

#import "BrandCell5.h"
@interface BrandCell5()
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIImageView *coverImage;
@property (weak, nonatomic) IBOutlet UILabel *numberCountlabel;
@property (weak, nonatomic) IBOutlet UILabel *timerLabel;


@end
@implementation BrandCell5
- (void)setModel:(Brandmodel *)model{
    interactiveModel *model1 = (interactiveModel *)model;
    self.titleLabel.text = model1.title;
    [self.coverImage sd_setImageWithURL:[NSURL URLWithString:model1.coverImg] placeholderImage:[UIImage imageNamed:@"1"]];
    self.numberCountlabel.text = [NSString stringWithFormat:@"%@",model1.interactiveUserCount];
    self.numberCountlabel.font=[UIFont fontWithName:@"Helvetica"size:21];

     NSString *newtimer =  [self dataTest:model1.time];
    self.timerLabel.text = newtimer;
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

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

@end
