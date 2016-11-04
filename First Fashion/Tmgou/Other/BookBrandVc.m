//
//  BookBrandVc.m
//  Tmgou
//
//  Created by qianfeng on 16/10/17.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

#import "BookBrandVc.h"
#import "CHTCollectionViewWaterfallLayout.h"
#import "BookBrandModel.h"
#import "BookBrandCollerCell.h"
#import "CellBrandBookVC.h"
@interface BookBrandVc () <UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, CHTCollectionViewDelegateWaterfallLayout>

@property (nonatomic,strong) NSMutableArray *DataSource;

@property (nonatomic,strong) UICollectionView *collectionView;


@end

@implementation BookBrandVc

- (void)viewDidLoad {
    [super viewDidLoad];
    [self CraeteUI];
    [self DownloadData];
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = false;
    self.automaticallyAdjustsScrollViewInsets = YES;
    self.title = @"图库";
    UIButton *butt = [UIButton buttonWithType:UIButtonTypeCustom];
    [butt setImage:[UIImage imageNamed:BACKIMG] forState:UIControlStateNormal];
    butt.frame = CGRectMake(0, 0, 20, 20);
    [butt addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:butt];
}
- (void)backAction{
    [self.navigationController popViewControllerAnimated:YES];


}
- (NSMutableArray *)DataSource{
    if (_DataSource == nil) {
        _DataSource = [NSMutableArray array];
    }
    return _DataSource;

}
- (void)DownloadData{
    AFmanage *manga = [AFmanage ShareInstance];
    [manga getDataFormNet:self.myurlstring andSuccsee:^(id object) {
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:object options:0 error:0];
        NSArray *dataArr =  dict[@"result"][@"list"];
        for (NSDictionary *dic in dataArr) {
            BookBrandModel *model = [[BookBrandModel alloc]initWithDictionary:dic error:nil];
            [self.DataSource addObject:model];
        }
        
        [self.collectionView reloadData];
    } and:^(NSError *error) {
        NSLog(@"%@",error);
    }];



}
- (void)CraeteUI{
CHTCollectionViewWaterfallLayout *flow =    [[CHTCollectionViewWaterfallLayout alloc] init];
 flow.columnCount = 2;
 flow.minimumColumnSpacing = 10;
 flow.minimumInteritemSpacing = 10;
 flow.sectionInset = UIEdgeInsetsMake(10, 10, 20, 20);
    self.collectionView = [[UICollectionView alloc]initWithFrame:[UIScreen mainScreen].bounds collectionViewLayout:flow];
    self.collectionView.delegate = self;
    self.collectionView.backgroundColor = [UIColor whiteColor];
    self.collectionView.dataSource = self;
    [self.collectionView registerNib:[UINib nibWithNibName:@"BookBrandCollerCell" bundle:nil] forCellWithReuseIdentifier:@"BookBrandCollerCell"];
    [self.view addSubview:self.collectionView];

    



}
- (void)BackController{

    [self.navigationController popViewControllerAnimated:YES];

}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{


    return self.DataSource.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    BookBrandCollerCell *item = [collectionView dequeueReusableCellWithReuseIdentifier:@"BookBrandCollerCell" forIndexPath:indexPath];
    item.model = self.DataSource[indexPath.row];
    return item;
}


- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{

    return CGSizeMake(100, 200);
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{

    BookBrandModel *model = self.DataSource[indexPath.row];
    
    CellBrandBookVC *celljumpbookvc = [[CellBrandBookVC alloc]init];
    celljumpbookvc.Myurlstring = [NSString stringWithFormat:BRANDBOOKCELLJUMP,model.newsId];
    [self.navigationController pushViewController:celljumpbookvc animated:YES];
    

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
