//
//  CustmView.m
//  Tmgou
//
//  Created by qianfeng on 16/9/20.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

#import "CustmView.h"
#import "iCarousel.h"
#import "TopLestModel.h"
@interface CustmView()<iCarouselDataSource,iCarouselDelegate>
@property (nonatomic,strong) NSArray *dataSoucre;
@property (nonatomic,strong) iCarousel *carousel;
@end
@implementation CustmView
- (instancetype)init
{
    self = [super init];
    if (self) {
        [self CreatUI];
    }
    return self;
}

- (void)setWithdataSoucre:(NSArray *)Datasoucre{

    self.dataSoucre = Datasoucre;
    [self.carousel reloadData];
}
-(void)CreatUI{

    self.carousel = [[iCarousel alloc] initWithFrame:CGRectMake(SCREEN.width/2, 0, self.frame.size.width, SCREEN.height)];

    self.carousel.delegate = self;
    self.carousel.dataSource = self;
    [self addSubview:self.carousel];
    self.carousel.type = iCarouselTypeRotary;
  

}
- (NSInteger)numberOfItemsInCarousel:(iCarousel *)carousel
{
    return self.dataSoucre.count;
}

- (UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSInteger)index reusingView:(nullable UIImageView *)view
{
    if (view == nil)
    {
        view = [[UIImageView alloc] initWithFrame:CGRectMake(self.frame.origin.x, 0, carousel.frame.size.width+SCREEN.width , carousel.frame.size.height)];
      

    }
    
    //赋值
    TopLestModel *model =  self.dataSoucre[index];
    [view sd_setImageWithURL:[NSURL URLWithString:model.cover] placeholderImage:[UIImage imageNamed:@"453_80055_427885.jpg"]];
    
    return view;

}

@end
