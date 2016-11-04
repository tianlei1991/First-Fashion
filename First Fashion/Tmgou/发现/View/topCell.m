//
//  topCell.m
//  Tmgou
//
//  Created by qianfeng on 16/9/20.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

#import "topCell.h"
#import "topCollectionCell.h"
#import "TopLestModel.h"
@interface topCell()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property (weak, nonatomic) IBOutlet UICollectionView *TopCollectionView;
@property (nonatomic,strong) NSMutableArray *DataSoucreArr;
@end
@implementation topCell
- (NSMutableArray *)DataSoucreArr{
    if (_DataSoucreArr == nil) {
        _DataSoucreArr = [NSMutableArray array];
    }
    return _DataSoucreArr;
}
- (void)setDataSoucre:(NSArray *)dataSoucre{
    _dataSoucre = dataSoucre;
    self.TopCollectionView.dataSource = self;
    self.TopCollectionView.delegate = self;
    [self.TopCollectionView registerClass:[topCollectionCell class] forCellWithReuseIdentifier:@"topCollectionCell"];

}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{

    return 1;

}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    topCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"topCollectionCell" forIndexPath:indexPath];
    [cell setJumpwebViewblock:^(NSString * url) {
        if (self.jumpwebViewblock) {
            self.jumpwebViewblock(url);
        }

        
    }];
   NSInteger arrcount= self.dataSoucre.count;
    [self.DataSoucreArr removeAllObjects];

    for (NSInteger i = 0; i<5; i++) {
        NSInteger count = (arc4random() % arrcount);

        TopLestModel *modle = self.dataSoucre[count];
        [self.DataSoucreArr addObject:modle];

    }
    
    [cell setWithdataSoucre:self.DataSoucreArr];
    
    return cell;

}
//- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
//    TopLestModel *model = self.dataSoucre[indexPath.row];
// 
//
//}

- (IBAction)exchange:(id)sender {
    [self.TopCollectionView reloadData];
}

@end
