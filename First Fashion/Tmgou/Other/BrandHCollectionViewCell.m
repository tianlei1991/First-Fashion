//
//  BrandHCollectionViewCell.m
//  Tmgou
//
//  Created by hj on 16/10/2.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

#import "BrandHCollectionViewCell.h"
@interface BrandHCollectionViewCell()
@property (weak, nonatomic) IBOutlet UIImageView *iconImagview;
@property (nonatomic) NSInteger cont;
@property (nonatomic) CGRect ImagviewstartFrame;
@property (nonatomic) BOOL islarge;
@end
@implementation BrandHCollectionViewCell
-(void)setModel:(BrandHModel *)model{
    
    self.cont++;
    [self.iconImagview sd_setImageWithURL:[NSURL URLWithString:model.imgUrl] placeholderImage:[UIImage imageNamed:@"453_80055_427885.jpg"]];
    UITapGestureRecognizer *icomGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(Blowimgav:)];
    

    self.iconImagview.userInteractionEnabled =YES;
    [self.iconImagview addGestureRecognizer:icomGesture];
    self.iconImagview.tag = self.cont;
    
}
- (void)Blowimgav:(UITapGestureRecognizer *)Gesture{
    UIImageView *imgView = (UIImageView *)[self viewWithTag:self.tag];

    if (self.islarge == NO) {
        self.ImagviewstartFrame = CGRectMake(imgView.frame.origin.x, imgView.frame.origin.y+64, imgView.frame.size.width, imgView.frame.size.height);
        [UIView animateWithDuration:0.5 animations:^{
            imgView.frame = CGRectMake(0,30, SCREEN.width, SCREEN.height);
            UIWindow *window =   [[UIApplication sharedApplication].delegate window];
            window.backgroundColor = [UIColor blackColor];
            [window addSubview:imgView];
        }];
       

    }else{
        imgView.hidden =YES;

        if (self.reloadCell) {
            self.reloadCell();
        }
    
    }
    
    imgView.hidden = NO;

    self.islarge = !self.islarge;


}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

@end
