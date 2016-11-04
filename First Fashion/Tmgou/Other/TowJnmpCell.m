//
//  TowJnmpCell.m
//  Tmgou
//
//  Created by qianfeng on 16/9/28.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

#import "TowJnmpCell.h"
#import "TowJumpCollectionCell.h"

@interface TowJnmpCell()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property (weak, nonatomic) IBOutlet UILabel *contentlabel;
@property (weak, nonatomic) IBOutlet UIButton *buttselet;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *viewlayou;
@property (weak, nonatomic) IBOutlet UILabel *TitleLabel;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *litteview;
@property (weak, nonatomic) IBOutlet UIView *litleView;
@property (nonatomic,strong) NSArray *dataSource;
@property (nonatomic) BOOL selets;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@end
@implementation TowJnmpCell

-(void)setModel:(CellShopModel *)model{
    self.dataSource = model.list;
    self.TitleLabel.text = model.title;
    self.TitleLabel.numberOfLines = 2;
    self.contentlabel.text = model.summary;
    self.contentlabel.numberOfLines = 1;
    if (model.summary.length > 0) {
        self.contentlabel.hidden = NO;
        self.litleView.hidden = NO;
        self.viewlayou.constant = 80;
        self.litteview.constant = 9;
    }else{
        self.contentlabel.hidden = YES;
        self.litleView.hidden = YES;
        self.viewlayou.constant = 50;
        self.litteview.constant = 0;
    }
    [self CreatUI];
    [self.collectionView reloadData];

}
- (void)CreatUI{
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
    [self.collectionView registerNib:[UINib nibWithNibName:@"TowJumpCollectionCell" bundle:nil] forCellWithReuseIdentifier:@"TowJumpCollectionCell"];
    [self.buttselet setImage:[UIImage imageNamed:@"comment_arrow.png"] forState:UIControlStateNormal];
    [self.buttselet setImage:[UIImage imageNamed:@"comment_arrowbooun.png"] forState:UIControlStateSelected];
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{

    return self.dataSource.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    TowJumpCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"TowJumpCollectionCell" forIndexPath:indexPath];

    cell.model = self.dataSource[indexPath.row];
    return cell;
}
   




- (void)awakeFromNib {
    [super awakeFromNib];
}
- (IBAction)buttHegthCilek:(UIButton *)sender {
   
    self.selected =! self.selected;
    sender.selected = self.selected;
        if (sender.selected==0) {
            if (self.blockReload) {
                self.blockReload();
            }
        }else
            self.viewlayou.constant = 120;
    self.contentlabel.numberOfLines = 0;

}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    Cellcontens *model = self.dataSource[indexPath.row];
    if (self.jumpBlock) {
        self.jumpBlock(model.sourceUrl);
    }


}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}

@end
