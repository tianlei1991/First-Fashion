//
//  CellJbrandCell2.m
//  Tmgou
//
//  Created by qianfeng on 16/10/11.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

#import "CellJbrandCell2.h"
#import "Cell2CollectionCell.h"
#import "CellBranJumpModel.h"
@interface CellJbrandCell2()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property (weak, nonatomic) IBOutlet UICollectionView *collertionView;


@end

@implementation CellJbrandCell2
-(void)setDataSource:(NSArray *)dataSource{
    _dataSource = dataSource;
    self.collertionView.dataSource = self;
    self.collertionView.delegate = self;
    [self.collertionView registerNib:[UINib nibWithNibName:@"Cell2CollectionCell" bundle:nil] forCellWithReuseIdentifier:@"Cell2CollectionCell"];


}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{

    return self.dataSource.count;

}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
  
    Cell2CollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell2CollectionCell" forIndexPath:indexPath];
    cell.model = self.dataSource[indexPath.row];
    return cell;

}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    CellbrandStoryModel *model = self.dataSource[indexPath.row];
    self.blockaction(model.newsId);



}
//- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
//
//
//    return CGSizeMake(SCREEN.width, SCREEN.height-32);
//}


@end
