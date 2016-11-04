//
//  inteBrandVCViewController.m
//  Tmgou
//
//  Created by qianfeng on 16/10/20.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

#import "inteBrandVCViewController.h"
#import "InteBrandModel.h"
#import "inreBrandTableViewCell.h"
#import "intebrand2cell.h"

@interface inteBrandVCViewController ()<UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate>
@property (nonatomic,strong) NSMutableArray  *dataSource;
@property (nonatomic,strong) UITableView *tableview;
@property (nonatomic,assign) NSInteger page;

@end

@implementation inteBrandVCViewController
-(NSMutableArray *)dataSource{
    if (_dataSource == nil) {
        _dataSource = [NSMutableArray array];
    }
    return _dataSource;

}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = false;
    self.automaticallyAdjustsScrollViewInsets = YES;
    self.title = @"互动";
    UIButton *butt = [UIButton buttonWithType:UIButtonTypeCustom];
    butt.frame = CGRectMake(0, 0, 20, 20);
    [butt setImage:[UIImage imageNamed:BACKIMG] forState:UIControlStateNormal];
    [butt addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:butt];
}
- (void)backAction{
    [self.navigationController popViewControllerAnimated:YES];
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.page = 0;
    [self downloadData];
    [self CreaetUI];
    [self refresh];
}
- (void)refresh{
    
    self.tableview.mj_header  = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self downloadData];
        
    }];
    
}
- (void)downloadData{
    
    [self.dataSource removeAllObjects];

    AFmanage *manage = [AFmanage ShareInstance];
    [manage getDataFormNet:self.urlstring andSuccsee:^(id object) {
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:object options:0 error:0];
        NSArray *datasou =   dict[@"result"][@"list"];
        for (NSDictionary *dic in datasou) {
            InteBrandModel *model = [[InteBrandModel alloc]initWithDictionary:dic error:nil];
            [self.dataSource addObject:model];
        }
        
        [self.tableview reloadData];
        [self.tableview.mj_header endRefreshing];
    } and:^(NSError *error) {
        
    }];
    
    
}

-(void)CreaetUI{
    
    self.tableview = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.tableview .delegate = self;
    self.tableview.dataSource = self;
    [self.tableview  registerNib:[UINib nibWithNibName:@"inreBrandTableViewCell" bundle:nil] forCellReuseIdentifier:@"inreBrandTableViewCell"];
    self.tableview.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.tableview registerNib:[UINib nibWithNibName:@"intebrand2cell" bundle:nil] forCellReuseIdentifier:@"intebrand2cell"];
    self.tableview.scrollsToTop = YES;

    [self.view addSubview:self.tableview];
    
    
    
    
}

- (NSInteger )tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    
    return self.dataSource.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    InteBrandModel *model = self.dataSource[indexPath.row];
    if ([model.showType isEqualToString:@"7"]&& [model.jumpType isEqualToString:@"12"] ) {
        
        intebrand2cell *cell2 = [tableView dequeueReusableCellWithIdentifier:@"intebrand2cell"];
        
        cell2.model = model;
        [cell2 setBlockaction:^{
            shareWebViewVC2 *vc = [[shareWebViewVC2 alloc]init];
            vc.urlString = model.newsDetailUrl;
            [self.navigationController pushViewController:vc animated:YES];
        }];
        cell2.selectionStyle = UITableViewCellSelectionStyleNone;        return cell2;
    }
    
    inreBrandTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"inreBrandTableViewCell"];
    cell.model = model;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
    
    
    
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    InteBrandModel *model = self.dataSource[indexPath.row];
    if ([model.showType isEqualToString:@"7"]&& [model.jumpType isEqualToString:@"12"] ) {
        if (model.coverImg.length ==0) {
            return 119;
        }else{
            
            return 230;
            
        }
    }
    
        
 
    return 123;
    
    
}

  




-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    
    InteBrandModel *model = self.dataSource[indexPath.row];
    shareWebViewVC2 *webview = [[shareWebViewVC2 alloc]init];
    webview.urlString = model.newsDetailUrl;
    [self.navigationController pushViewController:webview animated:YES];
    
    
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
