//
//  NewViewCell.m
//  Tmgou
//
//  Created by qianfeng on 16/10/13.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

#import "NewViewCell.h"
#import "NewsCollectionViewCell.h"
#import "CellBranJumpModel.h"
@interface NewViewCell()<UICollectionViewDelegate,UICollectionViewDataSource>
@property (weak, nonatomic) IBOutlet UICollectionView *uicollertionView;

@end
@implementation NewViewCell
-(void)setDataSource:(NSArray *)DataSource{
    _DataSource = DataSource;
    self.uicollertionView.dataSource = self;
    self.uicollertionView.delegate = self;
    [self.uicollertionView registerNib:[UINib nibWithNibName:@"NewsCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"NewsCollectionViewCell"];

}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{

    return self.DataSource.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    NewsCollectionViewCell *item = [collectionView dequeueReusableCellWithReuseIdentifier:@"NewsCollectionViewCell" forIndexPath:indexPath];

    item.model = self.DataSource[indexPath.row];
    return item;


}
- (IBAction)ButtACtion:(id)sender {
    self.ButtJumpblock();
    
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    newsListModel *model = self.DataSource[indexPath.row];
    if (model.source.length == 0) {
        self.CellblockJump(model.newsId);
        
    }else{
        self.CellblockJump(model.source);
    
    
    }


}

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end
