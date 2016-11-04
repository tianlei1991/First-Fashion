//
//  JumpHeadView.m
//  Tmgou
//
//  Created by qianfeng on 16/9/27.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

#import "JumpHeadView.h"
#import "HeadviewModel.h"
#import "JumpCollectionViewCell.h"
@interface JumpHeadView()<UICollectionViewDelegate ,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property (nonatomic,strong) UICollectionView *CollectionView;
@property (nonatomic,strong) NSArray *Newdatasource;
@end
@implementation JumpHeadView
- (void)CreatUI{
 UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
  layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    layout.itemSize = CGSizeMake(100, 150);

    self.CollectionView = [[UICollectionView alloc]initWithFrame:self.bounds collectionViewLayout:layout];
    self.CollectionView.delegate = self;
    self.CollectionView.dataSource = self;
    self.CollectionView.backgroundColor = [UIColor whiteColor];
    [self.CollectionView registerNib:[UINib nibWithNibName:@"JumpCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"JumpCollectionViewCell"];
    
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
    HeadviewModel *model = self.Newdatasource[indexPath.row];
    
    JumpCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"JumpCollectionViewCell" forIndexPath:indexPath];
    cell.model = model;
    return cell ;

}
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{


    return UIEdgeInsetsMake(10, 10, 10, 10);
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    HeadviewModel *model = self.Newdatasource[indexPath.row];
    if (self.blockCilck) {
        self.blockCilck(model.jumpUrl);
    }


}
@end
