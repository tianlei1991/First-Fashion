//
//  NewlistTabelCell.m
//  Tmgou
//
//  Created by qianfeng on 16/10/18.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

#import "NewlistTabelCell.h"
@interface NewlistTabelCell()
@property (weak, nonatomic) IBOutlet UIImageView *coveImage;
@property (weak, nonatomic) IBOutlet UILabel *titlelabel;

@property (weak, nonatomic) IBOutlet UILabel *timerlabel;



@end
@implementation NewlistTabelCell
- (void)setModel:(NewsListModel *)model{
    [self.coveImage sd_setImageWithURL:[NSURL  URLWithString:model.coverImg]];
    self.titlelabel.text = model.title;
    NSString *timer = [self dataTest:model.time];
    self.timerlabel.text = timer;
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
