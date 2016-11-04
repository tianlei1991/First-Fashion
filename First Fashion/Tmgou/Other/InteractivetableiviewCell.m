//
//  InteractivetableiviewCell.m
//  Tmgou
//
//  Created by qianfeng on 16/10/17.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

#import "InteractivetableiviewCell.h"
@interface InteractivetableiviewCell()
@property (weak, nonatomic) IBOutlet UIImageView *coverimage;
@property (weak, nonatomic) IBOutlet UILabel *titlelabel;
@property (weak, nonatomic) IBOutlet UILabel *interarctiveCont;
@property (weak, nonatomic) IBOutlet UILabel *timerLabel;



@end
@implementation InteractivetableiviewCell
- (void)setModel:(InteractiveJumpModel *)model{
    [self.coverimage sd_setImageWithURL:[NSURL URLWithString:model.coverImg]];
    self.titlelabel.text = model.title;
    self.interarctiveCont.text = [NSString stringWithFormat:@"%@",model.interactiveUserCount];
    self.interarctiveCont.font=[UIFont fontWithName:@"Helvetica"size:21];

    NSString *newtimer =   [self dataTest:model.time];
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
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}

@end
