//
//  BrandHeadView.m
//  Tmgou
//
//  Created by qianfeng on 16/9/21.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

#import "BrandHeadView.h"
#import "BrandHeadViewModle.h"
@interface BrandHeadView()
@property (nonatomic,strong) NSArray *dataSourecs;
@end
@implementation BrandHeadView
-(void)setScrollViewPageNumber:(NSArray *)datasourec{
    
    self.dataSourecs = datasourec;
    UIScrollView *scrollview = [[UIScrollView alloc]initWithFrame:self.bounds];
    scrollview.pagingEnabled = YES;
    scrollview.contentSize = CGSizeMake(self.bounds.size.width*datasourec.count, 0);
    scrollview.showsHorizontalScrollIndicator = NO;
    NSInteger i =0;
    for (BrandHeadViewModle * model in datasourec) {
        UIImageView *imgv = [[UIImageView alloc]init];
        
        imgv.frame = CGRectMake(i*SCREEN.width, 0, SCREEN.width, self.bounds.size.height);
        imgv.userInteractionEnabled = YES;
        [imgv sd_setImageWithURL:[NSURL URLWithString:model.picture] placeholderImage:[UIImage imageNamed:@"1.jpg"]];
        [scrollview addSubview:imgv];
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(jumpAction:)];
        
        [imgv addGestureRecognizer:tapGesture];
        tapGesture.view.tag = i;
        i++;
    }
    
    
    [self addSubview:scrollview];
    
    
}
- (void)jumpAction:(UITapGestureRecognizer *)tapgesture
{
    NSInteger index = tapgesture.view.tag;

   BrandHeadViewModle *model =  self.dataSourecs[index];
    
        if (self.jumpBlock) {
        self.jumpBlock(model.ios_url,model.re_id);

    }
    


}


@end
