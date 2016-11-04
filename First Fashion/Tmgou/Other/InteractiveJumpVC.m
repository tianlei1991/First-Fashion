//
//  InteractiveJumpVC.m
//  Tmgou
//
//  Created by qianfeng on 16/10/17.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

#import "InteractiveJumpVC.h"
#import "InteractiveJumpModel.h"
#import "InteractivetableiviewCell.h"
#import "interactiveCell2.h"
@interface InteractiveJumpVC ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) NSMutableArray  *dataSource;
@property (nonatomic,strong) UITableView *tableview;
@property (nonatomic,assign) NSInteger page;
@end

@implementation InteractiveJumpVC
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
    self.page =1;
    
    [self downloadData];
    [self CreaetUI];
    [self refresh];
}
- (void)refresh{
    
    self.tableview.mj_header  = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        self.page = 1;
        [self.dataSource removeAllObjects];
        [self downloadData];
        
    }];
    
    self.tableview.mj_footer  = [MJRefreshBackGifFooter footerWithRefreshingBlock:^{
        self.page ++;
        [self downloadData];
        
        
    }];
    
}
- (NSMutableArray *)dataSource{

    if (_dataSource == nil) {
        _dataSource = [NSMutableArray array];
    }
    return _dataSource;

}
- (void)downloadData{
    
    NSString *joinnewurl = [NSString stringWithFormat:BRANDINTERDATAL,self.page];
    
    AFmanage *manage = [AFmanage ShareInstance];
    [manage getDataFormNet:joinnewurl andSuccsee:^(id object) {
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:object options:0 error:0];
        NSArray *datasou =   dict[@"result"][@"list"];
        for (NSDictionary *dic in datasou) {
            InteractiveJumpModel *model = [[InteractiveJumpModel alloc]initWithDictionary:dic error:nil];
            [self.dataSource addObject:model];
        }
        [self.tableview reloadData];
        [self.tableview.mj_header endRefreshing];
        [self.tableview.mj_footer  endRefreshing];
    } and:^(NSError *error) {
        [self.tableview.mj_header endRefreshing];
        [self.tableview.mj_footer  endRefreshing];
    }];


}

-(void)CreaetUI{

    self.tableview = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.tableview .delegate = self;
    self.tableview.dataSource = self;
    self.tableview.scrollsToTop = YES;
    [self.tableview  registerNib:[UINib nibWithNibName:@"InteractivetableiviewCell" bundle:nil] forCellReuseIdentifier:@"InteractivetableiviewCell"];
    self.tableview.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.tableview registerNib:[UINib nibWithNibName:@"interactiveCell2" bundle:nil] forCellReuseIdentifier:@"interactiveCell2"];
    [self.view addSubview:self.tableview];
    



}
- (NSInteger )tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{


    return self.dataSource.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    InteractiveJumpModel *model = self.dataSource[indexPath.row];
    if ([model.showType isEqualToString:@"7"]&& [model.jumpType isEqualToString:@"12"] ) {
       
        interactiveCell2 *cell2 = [tableView dequeueReusableCellWithIdentifier:@"interactiveCell2"];
        
        cell2.model = model;
        [cell2 setBlockaction:^{
            shareWebViewVC2 *vc = [[shareWebViewVC2 alloc]init];
            vc.urlString = model.newsDetailUrl;
            [self.navigationController pushViewController:vc animated:YES];
        }];
        cell2.selectionStyle = UITableViewCellSelectionStyleNone;        return cell2;
    }
        
    InteractivetableiviewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"InteractivetableiviewCell"];
    cell.model = model;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;

}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    InteractiveJumpModel *model = self.dataSource[indexPath.row];
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

    
    
    InteractiveJumpModel *model = self.dataSource[indexPath.row];
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
