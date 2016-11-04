//
//  HeadView.m
//  Tmgou
//
//  Created by qianfeng on 16/9/13.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

#import "HeadView.h"
@interface HeadView()
@property (nonatomic,strong) NSArray *DataSources;
@end
@implementation HeadView

-(void)setScrollViewPageNumber:(NSArray *)datasourec{

    static int j ;
    j ++;
    if (j==1) {
        self.DataSources = datasourec;
        UIScrollView *scrollview = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height-70)];
        scrollview.scrollsToTop = NO;
        scrollview.pagingEnabled = YES;
        scrollview.contentSize = CGSizeMake(self.bounds.size.width*datasourec.count, 0);
        NSInteger i =0;
        for (SelctHeadModel * model in datasourec) {
            UIImageView *imgv = [[UIImageView alloc]init];
            
            imgv.frame = CGRectMake(i*SCREEN.width, 0, SCREEN.width, self.bounds.size.height-70);
            imgv.userInteractionEnabled = YES;
            UITapGestureRecognizer *tapgesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(jumpAction:)];
            [imgv addGestureRecognizer:tapgesture];
            tapgesture.view.tag = i;
            [imgv sd_setImageWithURL:[NSURL URLWithString:model.picture] placeholderImage:[UIImage imageNamed:@"1.jpg"]];
            [scrollview addSubview:imgv];
            i++;
        }
        UIView * topview = [[UIView alloc]initWithFrame:CGRectMake(SCREEN.width/2-100, CGRectGetMaxY(scrollview.frame)+10, 200, 50)];
        topview.backgroundColor = [UIColor blackColor];
        UILabel *labe = [[UILabel alloc]initWithFrame:CGRectMake(2, 2, 196, 46)];
        labe.backgroundColor = [UIColor whiteColor];
        labe.textAlignment = NSTextAlignmentCenter;
        NSString *str = [self gatDatetimer];
        NSString *timer =    [str  stringByAppendingString:@"精选"];
        labe.text = timer;
        
        
        labe.font = [UIFont systemFontOfSize:20];
        [topview addSubview:labe];
        [self addSubview:topview];
        scrollview.showsHorizontalScrollIndicator = NO;
        [self addSubview:scrollview];
    }



}
- (void)jumpAction:(UITapGestureRecognizer *)tapgesture
{
    SelctHeadModel * model = self.DataSources[tapgesture.view.tag];
    if (self.jumpblock) {
        self.jumpblock(model.ios_url);

    }
    


}
- (NSString *)gatDatetimer{
    NSDate *date = [NSDate date];
    NSCalendar *cal= [NSCalendar currentCalendar];
    NSDateComponents *compoente = [cal components:NSYearCalendarUnit |NSMonthCalendarUnit |NSDayCalendarUnit |NSHourCalendarUnit |NSMinuteCalendarUnit |NSSecondCalendarUnit
                                         fromDate:date];
    NSDateFormatter *deteformatter = [[NSDateFormatter alloc]init];
    [deteformatter setDateFormat:@"YYYY-MM-dd"];
    NSString *timer = [deteformatter stringFromDate:date];
    return timer;
    
    
    
}

@end
