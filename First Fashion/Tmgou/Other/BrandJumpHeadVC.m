//
//  BrandJumpHeadVC.m
//  Tmgou
//
//  Created by hj on 16/10/2.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

#import "BrandJumpHeadVC.h"
#import "BrandHModel.h"
#import "BrandHCollectionViewCell.h"
@interface BrandJumpHeadVC ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property (nonatomic,strong) NSMutableArray *DataSource;
@property (nonatomic,strong) UICollectionView *Collertion;

@end

@implementation BrandJumpHeadVC
- (NSMutableArray *)DataSource{
    if (_DataSource == nil) {
        _DataSource = [NSMutableArray array];
    }
    return _DataSource;


}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self CreatUI];
    [self DownLoadDataSource];
    [self CreatNavLiftButt];
}
- (void)CreatUI{
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
    self.Collertion = [[UICollectionView alloc]initWithFrame:self.view.bounds collectionViewLayout:flowLayout];
    self.Collertion.dataSource = self;
    self.Collertion.delegate = self;
    [self.Collertion registerNib:[UINib nibWithNibName:@"BrandHCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"BrandHCollectionViewCell"];
    self.Collertion.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.Collertion];
    
    
    
    


}
- (void)DownLoadDataSource{

    AFmanage *mange = [AFmanage ShareInstance];
    [mange getDataFormNet:self.Urlstring andSuccsee:^(id object) {
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:object options:0 error:0];
        NSArray *newimgalast = dict[@"result"][@"newImgList"];
        for (NSDictionary *dict in newimgalast) {
            BrandHModel *model = [[BrandHModel alloc]initWithDictionary:dict error:nil];
            [self.DataSource addObject:model];
        }
        [self.Collertion reloadData];
    } and:^(NSError *error) {
        NSLog(@"%@",error);
    }];


}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{


    return self.DataSource.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    BrandHCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"BrandHCollectionViewCell" forIndexPath:indexPath];
    cell.model = self.DataSource[indexPath.row];
    [cell setReloadCell:^{
        [self.Collertion reloadData];
    }];
    return cell;

}
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)sectio{

    return UIEdgeInsetsMake(10, 10, 10, 10);
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{

 
    return CGSizeMake(130, 150);
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
-(void)CreatNavLiftButt{
    UIButton *butt = [UIButton buttonWithType:UIButtonTypeCustom];
    butt.frame = CGRectMake(0, 0, 20, 20);
    [butt setImage:[UIImage imageNamed:@"brandstoryback.png"] forState:UIControlStateNormal];
    [butt addTarget:self action:@selector(ActionPop) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:butt];

}
- (void)ActionPop{

    [self.navigationController popViewControllerAnimated:YES];

}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = NO;
    
}



@end
