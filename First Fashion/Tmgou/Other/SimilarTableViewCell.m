//
//  SimilarTableViewCell.m
//  Tmgou
//
//  Created by qianfeng on 16/10/13.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

#import "SimilarTableViewCell.h"
#import "smallCollectionViewCell.h"
#import "CellBranJumpModel.h"

@interface SimilarTableViewCell()<UICollectionViewDataSource,UICollectionViewDelegate>
@property (weak, nonatomic) IBOutlet UICollectionView *collectionview;


@end
@implementation SimilarTableViewCell
- (void)setDataSource:(NSArray *)dataSource{
    _dataSource = dataSource;
    self.collectionview.delegate = self;
    self.collectionview.dataSource = self;
    [self.collectionview registerNib:[UINib nibWithNibName:@"smallCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"smallCollectionViewCell"];
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{

    return self.dataSource.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{

    smallCollectionViewCell *item = [collectionView dequeueReusableCellWithReuseIdentifier:@"smallCollectionViewCell" forIndexPath:indexPath];
    item.model = self.dataSource[indexPath.row];
    return item;


}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    similarBrandModel *model = self.dataSource[indexPath.row];
    
    self.blockJump(model.brandId,model.title);


}
 
- (void)awakeFromNib {
    [super awakeFromNib];
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
