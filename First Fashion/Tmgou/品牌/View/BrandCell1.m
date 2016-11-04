//
//  BrandCell1.m
//  Tmgou
//
//  Created by qianfeng on 16/9/21.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

#import "BrandCell1.h"
#import "BrandCollertionCell1.h"
#import "Brandmodel.h"
@interface BrandCell1()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property (weak, nonatomic) IBOutlet UIButton *butt;
@property (weak, nonatomic) IBOutlet UICollectionView *collection;
@end
@implementation BrandCell1

-(void)setDataSource:(NSArray *)DataSource{
    _DataSource = DataSource;
    [self CreatUI];

}
-(void)CreatUI{
    self.collection.dataSource = self;
    self.collection.delegate = self;
    
    self.butt.layer.cornerRadius = self.butt.layer.cornerRadius = self.butt.frame.size.height/2.0;
    
    self.butt.layer.masksToBounds = YES;
    [self.collection registerNib:[UINib nibWithNibName:@"BrandCollertionCell1" bundle:nil] forCellWithReuseIdentifier:@"BrandCollertionCell1"];
    
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    
    return self.DataSource.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    BrandCollertionCell1 *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"BrandCollertionCell1" forIndexPath:indexPath];
    cell.model = self.DataSource[indexPath.row];
    return cell;
    
    
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    brandListModel *model = self.DataSource[indexPath.row];
    
    self.JumpClick(model.brandId);
}
- (void)awakeFromNib {
    [super awakeFromNib];
   
}
- (IBAction)buttclick:(id)sender {
    
    if (self.blockJumpClick) {
        self.blockJumpClick();
    }
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

   
}

@end
