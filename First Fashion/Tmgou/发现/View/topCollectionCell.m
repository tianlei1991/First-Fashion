//
//  topCollectionCell.m
//  Tmgou
//
//  Created by qianfeng on 16/9/20.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

#import "topCollectionCell.h"
#import "iCarousel.h"
#import "TopLestModel.h"

@interface topCollectionCell()<iCarouselDataSource,iCarouselDelegate>

@property (nonatomic,strong) NSMutableArray *dataSoucre;
@property (nonatomic,strong) iCarousel *carousel;

@end
@implementation topCollectionCell

-(NSMutableArray *)dataSoucre{

    if (_dataSoucre == nil) {
        _dataSoucre = [NSMutableArray array];
    }
    return _dataSoucre;
}
-(void)setWithdataSoucre:(NSArray *)Datasoucre{
    
    [self.dataSoucre removeAllObjects];
    [self.carousel reloadData];
    for (TopLestModel *model in Datasoucre) {
        [self.dataSoucre  addObject:model];
    }
    
     [self CreatUI];
}
-(void)CreatUI{
      self.carousel = nil;
    self.carousel = [[iCarousel alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
  

    self.carousel.delegate = self;
    self.carousel.dataSource = self;
    [self addSubview:self.carousel];
    self.carousel.type = iCarouselTypeCoverFlow2;
    
    
}
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}
- (NSInteger)numberOfItemsInCarousel:(iCarousel *)carousel
{
    //return the total number of items in the carousel
    return self.dataSoucre.count;
}

- (UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSInteger)index reusingView:(nullable UIImageView *)view

{
    if (view == nil)
    {
        view = [[UIImageView alloc] initWithFrame:CGRectMake(self.frame.origin.x, 0, carousel.frame.size.width , self.frame.size.height)];
        //赋值
        

        
    }
    TopLestModel *model =  self.dataSoucre[index];
    
    [view sd_setImageWithURL:[NSURL URLWithString:model.cover] placeholderImage:[UIImage imageNamed:@"453_80055_427885.jpg"]];

       return view;
    
}
- (CGFloat)carousel:(iCarousel *)carousel valueForOption:(iCarouselOption)option withDefault:(CGFloat)value
{
    if (option == iCarouselOptionSpacing)
    {
        return value * 1.1;
    }
    return value;
}

- (void)carousel:(iCarousel *)carousel didSelectItemAtIndex:(NSInteger)index
{
    TopLestModel *model = self.dataSoucre[index];
    if (self.jumpwebViewblock) {
        self.jumpwebViewblock(model.shareUrl);
    }
    
}

@end
