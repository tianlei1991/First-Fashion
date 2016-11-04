//
//  NewListVC.m
//  Tmgou
//
//  Created by qianfeng on 16/10/18.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

#import "NewListVC.h"
#import "NewsListModel.h"
#import "NewlistTabelCell.h"
@interface NewListVC ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView *tableiview;

@property (nonatomic,strong) NSMutableArray *dataSource;

@end

@implementation NewListVC
-(NSMutableArray *)dataSource{
    if (_dataSource == nil) {
        _dataSource = [NSMutableArray array];
    }
    return _dataSource;

}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self downloadData];
    [self CreartUI];
}
- (void)viewWillAppear:(BOOL)animated{
    self.title = self.mytitle;
    [super viewWillAppear:animated];
    UIButton *navbutt = [UIButton buttonWithType:UIButtonTypeCustom];
    navbutt.frame = CGRectMake(0, 0, 20, 20);
    [navbutt addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];
    [navbutt setImage:[UIImage imageNamed:@"arrow_black_back.png"] forState:UIControlStateNormal];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:navbutt];



}
- (void)backAction{

    [self. navigationController popViewControllerAnimated:YES];

}
- (void)downloadData{
    AFmanage  *manage = [AFmanage ShareInstance];
    [manage getDataFormNet:self.urlstring andSuccsee:^(id object) {
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:object options:0 error:0];
      NSArray *datasou =  dict[@"result"][@"list"];
        for (NSDictionary *dit in datasou) {
            NewsListModel *model = [[NewsListModel alloc]initWithDictionary:dit error:nil];
            [self.dataSource addObject:model];
        }
        
        [self.tableiview reloadData];
        
    } and:^(NSError *error) {
        
    }];



}
- (void)CreartUI{
    self.tableiview = [[UITableView alloc]initWithFrame:[UIScreen mainScreen].bounds style:UITableViewStylePlain];
    self.tableiview.delegate = self;
    self.tableiview.dataSource = self;
    [self.tableiview registerNib:[UINib nibWithNibName:@"NewlistTabelCell" bundle:nil] forCellReuseIdentifier:@"NewlistTabelCell"];
    self.tableiview.scrollsToTop = YES;

    [self.view addSubview:self.tableiview];





}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{


    return self.dataSource.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    NewlistTabelCell *cell = [tableView dequeueReusableCellWithIdentifier:@"NewlistTabelCell"];
    cell.model = self.dataSource[indexPath.row];
    return cell;


}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    return 106;
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
