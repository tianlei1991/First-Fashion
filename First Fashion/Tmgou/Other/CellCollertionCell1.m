//
//  CellCollertionCell1.m
//  Tmgou
//
//  Created by qianfeng on 16/10/12.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

#import "CellCollertionCell1.h"
@interface CellCollertionCell1()
@property (weak, nonatomic) IBOutlet UIImageView *iconImagview;
@property (weak, nonatomic) IBOutlet UILabel *contenLabel;
@property (weak, nonatomic) IBOutlet UILabel *timerLabel;
@property (weak, nonatomic) IBOutlet UILabel *changelabel;
@property (weak, nonatomic) IBOutlet UIImageView *smallImagview;
@property (weak, nonatomic) IBOutlet UILabel *NumberLabel;

@end
@implementation CellCollertionCell1
- (void)setModel:(CellinteractiveModel *)model{
    [self.iconImagview sd_setImageWithURL:[NSURL URLWithString:model.coverImg] placeholderImage:[UIImage imageNamed:@"1"]];
    if ([model.showType isEqualToString:@"5"] && [model.jumpType isEqualToString:@"5"]) {
        self.changelabel.text = @"话题";

    }
    self.contenLabel.text = model.title;
   NSString *newtime =  [self dataTest:model.time];
    self.timerLabel.text = newtime;
    self.NumberLabel.text = model.interactiveUserCount;

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
