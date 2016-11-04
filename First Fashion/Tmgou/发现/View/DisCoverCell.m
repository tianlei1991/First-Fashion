//
//  DisCoverCell.m
//  Tmgou
//
//  Created by qianfeng on 16/9/19.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

#import "DisCoverCell.h"
#import "DisCoverCollectionViewCell.h"
#import "DisCoverModel.h"
@interface DisCoverCell()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UICollectionView *DisCoverCollectionCell;
@property (weak, nonatomic) IBOutlet UIButton *Button;
@property (nonatomic,strong) NSArray *DataSource;
@end
@implementation DisCoverCell


- (void)awakeFromNib {
    [super awakeFromNib];
    self.Button.layer.cornerRadius = self.Button.layer.cornerRadius = self.Button.frame.size.height/2.0;
    
    self.Button.layer.masksToBounds = YES;
}

- (void)setModel:(DisCoverModel *)model{
    self.DataSource = model.newsList;
    
    self.titleLabel.text = model.title;
    [self CreatUI];
     [self.DisCoverCollectionCell reloadData];
}
-(void)CreatUI{
    self.DisCoverCollectionCell.dataSource = self;
    self.DisCoverCollectionCell.delegate = self;
    [self.DisCoverCollectionCell registerNib:[UINib nibWithNibName:@"DisCoverCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"DisCoverCollectionViewCell"];
    
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    
    return self.DataSource.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    
    DisCoverCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"DisCoverCollectionViewCell" forIndexPath:indexPath];
    cell.model = self.DataSource[indexPath.row];
    return cell;
    
    
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{

    if(self.jumpwebViewblock){
       self.jumpwebViewblock(self.DataSource[indexPath.row]);
    }


}
- (IBAction)buttjumpAction:(UIButton *)sender {
    newsListModle *model = self.DataSource[false];
    NSString * name = self.titleLabel.text;
    if (self.jumpVCblock) {
        NSString *str = [NSString stringWithFormat:VCJUMPURL,model.channelId];
        self.jumpVCblock(str,name);
    }
    
}
@end
