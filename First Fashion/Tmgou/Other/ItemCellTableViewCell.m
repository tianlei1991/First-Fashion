//
//  ItemCellTableViewCell.m
//  Tmgou
//
//  Created by qianfeng on 16/10/13.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

#import "ItemCellTableViewCell.h"
#import "CellBranJumpModel.h"
#import "ItemCollectionViewCell.h"
@interface ItemCellTableViewCell()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property (nonatomic,strong) UICollectionView *collectionview;
@end
@implementation ItemCellTableViewCell
- (void)setDataSource:(NSArray *)DataSource{
    _DataSource = DataSource;
    self.contentView.backgroundColor = [UIColor colorWithRed:30/255.0 green:30/255.0 blue:30/255.0 alpha:1];
    
    itemListModel *model = self.DataSource[0];
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    self.collectionview = [[UICollectionView alloc]initWithFrame:CGRectMake(SCREEN.width/2-130, 40, 260 ,model.ItemHeigth) collectionViewLayout:layout ];
    self.collectionview.backgroundColor = [UIColor colorWithRed:30/255.0 green:30/255.0 blue:30/255.0 alpha:1];
    self.collectionview.delegate = self;
    self.collectionview.dataSource = self;
    [self.collectionview registerNib:[UINib nibWithNibName:@"ItemCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"ItemCollectionViewCell"];
    [self.contentView addSubview:self.collectionview];


    [self creatUI];
    
}
- (void)creatUI{
    UIView *topview = [[UIView alloc]initWithFrame:CGRectMake(10, 0, 260, 40)];
    
    UIView *littleview= [[UIView alloc]initWithFrame:CGRectMake(0, 20,5, 10)];
     littleview.backgroundColor = [UIColor whiteColor];
    [topview addSubview:littleview];
   
    UILabel *labe = [[UILabel alloc]initWithFrame:CGRectMake(25, 15, 100, 20)];
    labe.textColor = [UIColor whiteColor];
    labe.text = @"单品集合";
    [topview addSubview:labe];
    UIButton *butt = [UIButton buttonWithType:UIButtonTypeCustom];
    butt.frame = CGRectMake(CGRectGetMaxX(topview.frame)-20, 15, 20, 20);
    
    [butt setImage:[UIImage imageNamed:@"title_more_white.png"] forState:UIControlStateNormal];
    
    [butt addTarget:self action:@selector(ButtAction) forControlEvents:UIControlEventTouchUpInside];
    
    [topview addSubview:butt];
    [self.contentView addSubview:topview];

}
- (void)ButtAction{

    self.Buttblock();


}
- (NSInteger) collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{

    return self.DataSource.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{

    ItemCollectionViewCell *item = [collectionView dequeueReusableCellWithReuseIdentifier:@"ItemCollectionViewCell" forIndexPath:indexPath];
    item.model = self.DataSource[indexPath.row];
    return item;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{


    return CGSizeMake(110, 150);
}
- (UIEdgeInsets) collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{


    return UIEdgeInsetsMake(5, 5, 5, 5);
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    itemListModel *model = self.DataSource[indexPath.row];
    self.cellBlcok(model.sourceUrl);


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
