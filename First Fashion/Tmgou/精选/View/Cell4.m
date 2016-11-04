//
//  Cell4.m
//  Tmgou
//
//  Created by qianfeng on 16/9/18.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

#import "Cell4.h"
#import "JSONModel.h"
#import "CollectionViewCell.h"
@class CellfiveModel;
@interface Cell4()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIButton *button;
@property (nonatomic ,copy)  NSString *jumpString;
@property (nonatomic,strong) NSMutableArray *datasource;
@end
@implementation Cell4
- (void)awakeFromNib {
    [super awakeFromNib];
   
}
- (void)setDataSource:(NSArray *)DataSource{
    _DataSource = DataSource;
    self.titleLabel.text = @"超真实测评报告";
    self.button.layer.masksToBounds = true;

    self.button.layer.cornerRadius = self.button.frame.size.height/2.0;
    if ([[DataSource objectAtIndex:false] isKindOfClass:[CellfiveModel class]]) {
        self.datasource = [[NSMutableArray alloc]initWithArray:DataSource];
    }else{
        self.datasource = [NSMutableArray array];
        for (NSDictionary *dic in DataSource) {
            CellfiveModel *model = [[CellfiveModel alloc]initWithDictionary:dic error:nil];
            [self.datasource addObject:model];
        }
    
    
    }
   

    [self CreatUI];

}

-(void)CreatUI{
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
    [self.collectionView registerNib:[UINib nibWithNibName:@"CollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"CollectionViewCell"];
    
}
//跳转！拼接
- (IBAction)jumpButtAction:(id)sender {
    NSString *title = self.titleLabel.text;
    if (self.jumpVC) {
        self.jumpVC(title);
    }
    
    
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{

    return self.datasource.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{

    CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CollectionViewCell" forIndexPath:indexPath];
    
    cell.model =  self.datasource [indexPath.row];
    return cell;


}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
   
    if (self.jumpblock) {
        self.jumpblock(self.DataSource[indexPath.row]);
    }

}

@end
