//
//  ItemViewConjump.m
//  Tmgou
//
//  Created by qianfeng on 16/10/18.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

#import "ItemViewConjump.h"
#import "ButtItemJumpModel.h"
#import "buttItemJumoCell.h"
@interface ItemViewConjump ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (nonatomic,strong) UICollectionView *collectionview;

@property (nonatomic,strong) NSMutableArray *dataSource;

@end

@implementation ItemViewConjump
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.title = @"单品";
    self.navigationController.navigationBar.hidden = false;
    UIButton *butt = [UIButton buttonWithType:UIButtonTypeCustom];
    butt.frame = CGRectMake(0, 0, 20, 20);
    [butt setImage:[UIImage imageNamed:BACKIMG] forState:UIControlStateNormal];
    [butt addTarget:self action:@selector(BackAction) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:butt];
    
    
    
}
- (void)BackAction{
    [self.navigationController popViewControllerAnimated:YES];
    
    
}
-(NSMutableArray *)dataSource{
    if (_dataSource == nil) {
        _dataSource = [NSMutableArray array];
    }
    return _dataSource;


}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self DownloadData];
    [self CreatUI];
}
- (void)DownloadData{

    
    AFmanage *mange = [AFmanage ShareInstance];
    [mange getDataFormNet:self.urlstring andSuccsee:^(id object) {
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:object options:0 error:0];
      NSArray *datas =      dict[@"result"][@"list"];
        for (NSDictionary *dic in datas) {
            ButtItemJumpModel *model = [[ButtItemJumpModel alloc]initWithDictionary:dic error:nil];
            [self.dataSource addObject:model];
            
        }
        [self.collectionview reloadData];
    } and:^(NSError *error) {
        
    }];
    


}
- (void)CreatUI{
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    self.collectionview = [[UICollectionView alloc]initWithFrame:[UIScreen mainScreen].bounds collectionViewLayout:layout];
    self.collectionview.backgroundColor = [UIColor blackColor];
    self.collectionview.delegate = self;
    self.collectionview.dataSource = self;
    self.collectionview.backgroundColor = [UIColor colorWithRed:30/255.0 green:30/255.0 blue:30/255.0 alpha:1];
    self.collectionview.scrollsToTop = YES;

    [self.collectionview registerNib:[UINib nibWithNibName:@"buttItemJumoCell" bundle:nil] forCellWithReuseIdentifier:@"buttItemJumoCell"];
    [self.view addSubview:self.collectionview];


}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{


    return self.dataSource.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{

    buttItemJumoCell *item = [collectionView dequeueReusableCellWithReuseIdentifier:@"buttItemJumoCell" forIndexPath:indexPath];
    
    item.model = self.dataSource[indexPath.row];
    item.backgroundColor = [UIColor colorWithRed:30/255.0 green:30/255.0 blue:30/255.0 alpha:1];

    return item;


}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{


    return CGSizeMake(100, 140);
}
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{



    return UIEdgeInsetsMake(10, 20, 10, 20);
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    ButtItemJumpModel *model = self.dataSource[indexPath.row];
    shareWebViewVC2 *vc = [[shareWebViewVC2 alloc]init];
    vc.urlString = model.sourceUrl;
    [self.navigationController pushViewController:vc animated:YES];


}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
