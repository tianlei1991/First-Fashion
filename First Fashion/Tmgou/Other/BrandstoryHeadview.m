//
//  BrandstoryHeadview.m
//  Tmgou
//
//  Created by qianfeng on 16/10/15.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

#import "BrandstoryHeadview.h"

@implementation BrandstoryHeadview
- (instancetype)initWithTitle:(NSString *)Mytitle AndIamgview:(NSString *)Urlstring AndarrCount:(NSInteger) count;
{
    self = [super init];
    if (self) {
        UIImageView *imagview = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, SCREEN.width, SCREEN.height)];
        imagview.backgroundColor = [UIColor orangeColor];
        [imagview sd_setImageWithURL:[NSURL URLWithString:Urlstring] placeholderImage:[UIImage imageNamed:@"453_79800_140864.jpg"]];
        
        UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, imagview.frame.size.height-200, SCREEN.width, 200)];
        view.backgroundColor = [UIColor whiteColor];
        [imagview addSubview:view];
        
        
        UILabel *labe = [[UILabel alloc]initWithFrame:CGRectMake(view.frame.size.width/2-50, 30, 100, 30)];
        labe.text = @"[品牌故事]";
        labe.textAlignment = NSTextAlignmentCenter;
        labe.font = [UIFont systemFontOfSize:16];
        
        [view addSubview:labe];
        UILabel *titlelabe = [[UILabel alloc]initWithFrame:CGRectMake(10, CGRectGetMaxY(labe.frame)+10, SCREEN.width-20, 30)];
        titlelabe.font = [UIFont systemFontOfSize:18];
        titlelabe.numberOfLines = 2;
        titlelabe.textAlignment = NSTextAlignmentCenter;
       CGRect frame = [Mytitle boundingRectWithSize:CGSizeMake(SCREEN.width-20, 1000) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:titlelabe.font} context:nil];
        CGRect rect = titlelabe.frame;
        rect.size.height = frame.size.height;
        titlelabe.frame = rect;
        titlelabe.text = Mytitle;
        [view addSubview:titlelabe];
        UILabel *numberlabe = [[UILabel alloc]initWithFrame:CGRectMake(view.frame.size.width-30, view.frame.size.height-70, 30, 30)];
        
        numberlabe.font = [UIFont systemFontOfSize:16];
        
        numberlabe.text = [NSString stringWithFormat:@"%ld",count];
        [view addSubview:numberlabe];
      
        [self addSubview:imagview];
    }
    return self;
}


@end
