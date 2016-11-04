//
//  BrandCell2.m
//  Tmgou
//
//  Created by qianfeng on 16/9/21.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

#import "BrandCell2.h"
#import "Brand2CollectionCell.h"
@interface BrandCell2()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property (weak, nonatomic) IBOutlet UIButton *jumpAction;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;



@end
@implementation BrandCell2
-(void)setDataSource:(NSArray *)DataSource{
    _DataSource = DataSource;
    [self CreatUI];
    
}
- (void)CreatUI{
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
    [self.collectionView registerNib:[UINib nibWithNibName:@"Brand2CollectionCell" bundle:nil] forCellWithReuseIdentifier:@"Brand2CollectionCell"];

}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    
    return self.DataSource.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    Brand2CollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Brand2CollectionCell" forIndexPath:indexPath];
    cell.model = self.DataSource[indexPath.row];
    
    return cell;
}
- (IBAction)jumpAction:(id)sender {
    
    self.jumpbolckButt();
    
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    brandStoryModel *model = self.DataSource[indexPath.row];
    NSString *newid =  model.ios_url ;
   NSString *str1 =   [newid componentsSeparatedByString:@"="][1];
    self.jumpblockCell(str1);

}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
