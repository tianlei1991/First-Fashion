//
//  CellJbrandCell3.m
//  Tmgou
//
//  Created by qianfeng on 16/10/11.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

#import "CellJbrandCell3.h"
#import "CellCollertionCell1.h"
#import "CellBranJumpModel.h"
#import "UserOptionCollectionViewCell.h"
@interface CellJbrandCell3()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (nonatomic,strong) UICollectionView *collectionview;

@end

@implementation CellJbrandCell3
- (void)setDataSource:(NSArray *)DataSource{
    _DataSource = DataSource;
    CellinteractiveModel *model = [self.DataSource firstObject];
UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    self.collectionview = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, SCREEN.width ,model.cellheigth) collectionViewLayout:layout ];
    self.collectionview.backgroundColor = [UIColor whiteColor];
    self.collectionview.delegate = self;
    self.collectionview.dataSource = self;
    self.collectionview.scrollEnabled = false;
    [self.collectionview registerNib:[UINib nibWithNibName:@"CellCollertionCell1" bundle:nil] forCellWithReuseIdentifier:@"CellCollertionCell1"];
    [self.collectionview registerNib:[UINib nibWithNibName:@"UserOptionCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"UserOptionCollectionViewCell"];
    
    [self addSubview:self.collectionview];
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{

    return self.DataSource.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    CellinteractiveModel *model = self.DataSource[indexPath.row];
    if ([model.showType isEqualToString:@"7"] && [model.jumpType isEqualToString:@"12"]) {
        UserOptionCollectionViewCell * itme = [collectionView dequeueReusableCellWithReuseIdentifier:@"UserOptionCollectionViewCell" forIndexPath:indexPath];
        itme.model = model;
        [itme setLeftblock:^{
            self.blockJump(model.newsDetailUrl);
            
            
        }];
        [itme setRegthblock:^{
            self.blockJump(model.newsDetailUrl);
        }];
        return itme;
    }

    CellCollertionCell1 *item = [collectionView dequeueReusableCellWithReuseIdentifier:@"CellCollertionCell1" forIndexPath:indexPath];
    
    item.model = self.DataSource[indexPath.item];
    return item;

}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    CellinteractiveModel *model = self.DataSource[indexPath.row];
    if ([model.showType isEqualToString:@"7"] && [model.jumpType isEqualToString:@"12"]) {
        if (model.coverImg.length == 0) {
            return CGSizeMake(SCREEN.width, 120);
        }
        return CGSizeMake(SCREEN.width, 225);
    }
    return CGSizeMake(SCREEN.width, 100);

}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    CellinteractiveModel *model = self.DataSource[indexPath.row];
    self.blockJump(model.newsDetailUrl);




}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

@end
