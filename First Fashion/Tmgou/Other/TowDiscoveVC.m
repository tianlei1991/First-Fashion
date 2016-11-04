//
//  TowDiscoveVC.m
//  Tmgou
//
//  Created by qianfeng on 16/9/28.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

#import "TowDiscoveVC.h"
#import "CellShopModel.h"
#import "TowJnmpCell.h"
@interface TowDiscoveVC ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView *tableview;
@property (nonatomic,copy) NSString *mpage;//上啦加载
@property (nonatomic,strong) NSMutableArray *DataSource;
@property (nonatomic) NSInteger page;
@end

@implementation TowDiscoveVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = YES;
    UIButton *butt = [UIButton buttonWithType:UIButtonTypeCustom];
    butt.frame = CGRectMake(0, 0, 20, 20);
    [butt addTarget:self action:@selector(PoAction) forControlEvents:UIControlEventTouchUpInside];
    [butt setImage:[UIImage imageNamed:@"lefi2"] forState:UIControlStateNormal];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:butt];
    [self DownLoadData:TOWDISCOVEVC];
    [self CreatUI];
    [self refresh];
}
- (void)PoAction{

    [self.navigationController popViewControllerAnimated:YES];

}
- (void)refresh{
    self.tableview.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        self.page = 0;
        [self refiechData];
    }];
    
    
    self.tableview.mj_footer  = [MJRefreshBackGifFooter footerWithRefreshingBlock:^{
        self.page ++;
        [self refiechData];
        
    }];
    
    
    
}
- (void)refiechData{
    
    if (self.page==0) {
        [self.DataSource  removeAllObjects];
        [self DownLoadData:TOWDISCOVEVC];
    }else{
        
        NSString *Topdata = [NSString stringWithFormat:TOWDOWNURL,self.mpage];
        [self DownLoadData:Topdata];
        
    }
    
}
- (NSMutableArray *)DataSource{

    if (_DataSource ==nil) {
        _DataSource = [NSMutableArray array];
    }

    return _DataSource;
}
- (void)DownLoadData:(NSString *)url{

    AFmanage *manage = [AFmanage ShareInstance];
    [manage getDataFormNet:url andSuccsee:^(id object) {
        NSDictionary *datadict = [NSJSONSerialization JSONObjectWithData:object options:0 error:0];
        self.mpage =  datadict[@"result"][@"mpage"];

        NSArray *ListArr = datadict[@"result"][@"list"];
        
        for (NSDictionary * dict in ListArr) {
            CellShopModel *model = [[CellShopModel alloc]initWithDictionary:dict error:nil];
            [self. DataSource addObject:model];
           
        }
        [self.tableview reloadData];
        [self.tableview.mj_header endRefreshing];
        [self.tableview.mj_footer endRefreshing];
    } and:^(NSError *error) {
        [self.tableview.mj_header endRefreshing];
        [self.tableview.mj_footer endRefreshing];
    }];

}

- (void)CreatUI{

    self.tableview = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.tableview.delegate = self;
    self.tableview.dataSource = self;
    [self.tableview registerNib:[UINib nibWithNibName:@"TowJnmpCell" bundle:nil] forCellReuseIdentifier:@"TowJnmpCell"];
    self.tableview.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:self.tableview];
   

}
- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.DataSource.count;

}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    CellShopModel *model = self.DataSource[indexPath.row];

    TowJnmpCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TowJnmpCell"];
    cell.model = model;
    cell.selected = UITableViewCellSelectionStyleNone;
    
    [cell setJumpBlock:^(NSString *urlstring) {
       
        
        ShareWebViewController *webvc = [[ShareWebViewController alloc]init];
        webvc.urlString = urlstring;
        [self.navigationController pushViewController:webvc animated:YES];
        
        
    }];
    [cell setBlockReload:^{
        
        [self.tableview reloadRowsAtIndexPaths:[NSArray arrayWithObjects:indexPath,nil] withRowAnimation:UITableViewRowAnimationNone];
    }];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    CellShopModel *model = self.DataSource[indexPath.row];

 if (model.summary.length >0) {
        return 320;
        
    }
    else
        return 250;
    
    

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = NO;
    self.automaticallyAdjustsScrollViewInsets = YES;
    self.navigationController.hidesBarsOnSwipe = NO;
    self.title = @"单品";
    
}

@end
