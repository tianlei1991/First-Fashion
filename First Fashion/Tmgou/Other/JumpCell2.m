//
//  JumpCell2.m
//  Tmgou
//
//  Created by hj on 16/9/26.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

#import "JumpCell2.h"
@interface JumpCell2()
@property (weak, nonatomic) IBOutlet UILabel *channelLaber;
@property (weak, nonatomic) IBOutlet UILabel *bloggerLabel;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIImageView *coverImage;
@end
@implementation JumpCell2

- (void)setModel:(JumpModel *)model{
  NSString *newTiemr = [self dataTest:model.time];
    self.channelLaber.text = [NSString stringWithFormat:@"|%@",newTiemr];
    self.bloggerLabel.text = model.bloggerName;
    self.titleLabel.text   = model.title;
    [self.coverImage sd_setImageWithURL:[NSURL URLWithString:model.coverImg] placeholderImage:[UIImage imageNamed:@"1"]];


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

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
