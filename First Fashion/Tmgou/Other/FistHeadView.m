//
//  FistHeadView.m
//  Tmgou
//
//  Created by qianfeng on 16/9/29.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

#import "FistHeadView.h"
#import "DisfistHeadModel.h"
#import "fistCollectionViewCell.h"
@interface FistHeadView()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property (nonatomic,strong) UICollectionView *CollectionView;
@property (nonatomic,strong) NSArray *Newdatasource;

@end
@implementation FistHeadView
- (void)CreatUI{
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    layout.itemSize = CGSizeMake(100, 150);
    self.CollectionView = [[UICollectionView alloc]initWithFrame:self.bounds collectionViewLayout:layout];
    self.CollectionView.showsHorizontalScrollIndicator = NO;
    self.CollectionView.delegate = self;
    self.CollectionView.dataSource = self;
    self.CollectionView.backgroundColor = [UIColor whiteColor];
    [self.CollectionView registerNib:[UINib nibWithNibName:@"fistCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"fistCollectionViewCell"];

    [self addSubview:self.CollectionView];
    
}
- (void)setDataSource:(NSArray *)dataSource{
    _dataSource  = dataSource;
    self.Newdatasource = dataSource;
    [self CreatUI];
    [self.CollectionView reloadData];
}

- (NSInteger) collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    
    return  self.Newdatasource.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    DisfistHeadModel *model = self.Newdatasource[indexPath.row];
    
    fistCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"fistCollectionViewCell" forIndexPath:indexPath];
    cell.model = model;
    return cell ;
    
}
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    
    
    return UIEdgeInsetsMake(10, 10, 10, 10);
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    DisfistHeadModel *model = self.Newdatasource[indexPath.row];
    if (self.blockCilck) {
        self.blockCilck(model.jumpUrl);
    }
    
    
}



@end
