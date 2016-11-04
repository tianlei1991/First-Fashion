//
//  CellBrandBookVC.m
//  Tmgou
//
//  Created by qianfeng on 16/10/17.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

#import "CellBrandBookVC.h"
#import "CHTCollectionViewWaterfallLayout.h"
#import "CellBrandBookCell.h"
#import "CellBrandBookModel.h"
#import "showImagviewVc.h"
@interface CellBrandBookVC ()<UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, CHTCollectionViewDelegateWaterfallLayout>
@property (nonatomic,strong) NSMutableArray *DataSource;

@property (nonatomic,strong) UICollectionView *collectionView;
@end

@implementation CellBrandBookVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self CraeteUI];
    [self DownloadData];
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = false;
    self.automaticallyAdjustsScrollViewInsets = YES;
    UIButton *butt = [UIButton buttonWithType:UIButtonTypeCustom];
    butt.frame = CGRectMake(0, 0, 20, 20);
    [butt setImage:[UIImage imageNamed:BACKIMG] forState:UIControlStateNormal];
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
    [manga getDataFormNet:self.Myurlstring andSuccsee:^(id object) {
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:object options:0 error:0];
        NSArray *dataArr =  dict[@"result"][@"newImgList"];
        self.title = dict[@"result"][@"title"];
        for (NSDictionary *dic in dataArr) {
            CellBrandBookModel *model = [[CellBrandBookModel alloc]initWithDictionary:dic error:nil];
            [self.DataSource addObject:model];
        }
        
        [self.collectionView reloadData];
    } and:^(NSError *error) {
        NSLog(@"%@",error);
    }];
    
    
    
}
- (void)CraeteUI{
    CHTCollectionViewWaterfallLayout *flow =    [[CHTCollectionViewWaterfallLayout alloc] init];
    flow.columnCount = 3;
    flow.minimumColumnSpacing = 10;
    flow.minimumInteritemSpacing = 10;
    flow.sectionInset = UIEdgeInsetsMake(10, 20, 10, 20);
    self.collectionView = [[UICollectionView alloc]initWithFrame:[UIScreen mainScreen].bounds collectionViewLayout:flow];
    self.collectionView.delegate = self;
    self.collectionView.backgroundColor = [UIColor whiteColor];
    self.collectionView.dataSource = self;
    [self.collectionView registerNib:[UINib nibWithNibName:@"CellBrandBookCell" bundle:nil] forCellWithReuseIdentifier:@"CellBrandBookCell"];
    [self.view addSubview:self.collectionView];



}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    
    return self.DataSource.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    CellBrandBookCell *item = [collectionView dequeueReusableCellWithReuseIdentifier:@"CellBrandBookCell" forIndexPath:indexPath];
    item.model = self.DataSource[indexPath.row];
    return item;
}


- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    return CGSizeMake(100, 130);
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{

    showImagviewVc *showimag = [[showImagviewVc alloc]init];
    showimag.Datasource = self.DataSource;
    showimag.showstartImagview = indexPath.row;
    [self.navigationController pushViewController:showimag animated:YES];
    


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
