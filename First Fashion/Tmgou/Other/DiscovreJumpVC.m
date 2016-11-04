//
//  DiscovreJumpVC.m
//  Tmgou
//
//  Created by qianfeng on 16/9/27.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

#import "DiscovreJumpVC.h"
#import "DisJumpModel.h"
#import "discovJumpCell.h"
#import "discovJumpCell2.h"
#import "FistHeadView.h"
#import "DisfistHeadModel.h"
@interface DiscovreJumpVC ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView *tableview;

@property (nonatomic) NSInteger Page;

@property (nonatomic,strong) NSMutableArray *dataSource;

@property (nonatomic,copy) NSString *mpage;//上啦加载

@property (nonatomic,strong) FistHeadView *headView;

@property (nonatomic,strong) NSMutableArray *HeadViewdataSource;
@end

@implementation DiscovreJumpVC
-(NSMutableArray *)HeadViewdataSource{

    if (_HeadViewdataSource==nil) {
        _HeadViewdataSource = [NSMutableArray array];
    }
    return _HeadViewdataSource;
}
- (void)viewDidLoad {
    [super viewDidLoad];
   
    if ([self.Navtitle isEqualToString:@"聊聊“时尚”那些事儿"]) {
        [self headViewLownDataSource:FIDURL];
        self.title = @"时尚";
    }else if([self.Navtitle isEqualToString:@"教你聪明的变美"]){
          self.title = @"美容";
        [self headViewLownDataSource:JUMPHEADVIEWURL];
    }else if([self.Navtitle isEqualToString:@"拥有时髦体面的生活态度"]){
        [self headViewLownDataSource:HAPPYURL];
       self.title = @"乐活";
    }else if([self.Navtitle isEqualToString:@"窥探“明星”生活哲学"]){
        [self headViewLownDataSource:STARSURL];
        self.title = @"明星";
    }else if([self.Navtitle isEqualToString:@"有颜有品的生活私享地"]){
    
    self.title = @"探店";
    }else if ([self.Navtitle isEqualToString:@"超真实的测评报告"]){
    self.title = @"测评";
    
    }else
        self.title = @"推荐";
    
    UIButton *butt = [UIButton buttonWithType:UIButtonTypeCustom];
    butt.frame = CGRectMake(0, 0, 20, 20);
    [butt setImage:[UIImage imageNamed:@"arrow_black_back.png"] forState:UIControlStateNormal];
    [butt addTarget:self action:@selector(PopACtion) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:butt];
    
    [self downLoadData:self.urlString];
      [self CreatUI];
      [self refresh];
    self.automaticallyAdjustsScrollViewInsets = YES;

}
- (void)PopACtion{

    [self.navigationController popViewControllerAnimated:YES ];

}
- (void)headViewLownDataSource:(NSString *)url{
    AFmanage *manage = [AFmanage ShareInstance];
    [manage getDataFormNet:JUMPHEADVIEWURL andSuccsee:^(id object) {
        NSDictionary *hedrDict = [NSJSONSerialization JSONObjectWithData:object options:0 error:0];
        NSArray *DataArr = hedrDict[@"result"][@"data"];
        for (NSDictionary *dic in DataArr) {
            DisfistHeadModel *headmodel = [[DisfistHeadModel alloc]initWithDictionary:dic error:nil];
            [self.HeadViewdataSource addObject:headmodel];
        }
        self.headView = [[FistHeadView  alloc]init];
        self.headView.frame = CGRectMake(0, 0, SCREEN.width, 180);
        self.headView.backgroundColor  = [UIColor whiteColor];
        self.tableview.tableHeaderView = self.headView;
        self.headView.dataSource  = self.HeadViewdataSource;
        __weak typeof (self) weakself = self;
        [self.headView setBlockCilck:^(NSString * webViewUrl) {
            ShareWebViewController *webvc = [[ShareWebViewController alloc]init];
            webvc.urlString = webViewUrl;
            [weakself.navigationController pushViewController:webvc animated:YES];
        }];
        
        
        
    } and:^(NSError *error) {
        
    }];



}
    

-(NSMutableArray *)dataSource{
    if (_dataSource == nil) {
        _dataSource = [NSMutableArray array];
    }

    return _dataSource;

}
- (void)refresh{
    self.tableview.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        self.Page = 0;
        [self refiechData];
    }];
    
    
    self.tableview.mj_footer  = [MJRefreshBackGifFooter footerWithRefreshingBlock:^{
        self.Page ++;
        [self refiechData];
        
    }];
    
    
    
}
- (void)refiechData{
    
    if (self.Page==0) {
        [self.dataSource  removeAllObjects];
        [self downLoadData:self.urlString];
    }else{
        
        NSString *Topdata = [NSString stringWithFormat:JUMPDOWNURL,self.mpage];
        [self downLoadData:Topdata];
        
    }
    
}
- (void)downLoadData:(NSString *)data{
    AFmanage *mange = [AFmanage ShareInstance];
    NSString *NewString =  [data stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    [mange getDataFormNet:NewString andSuccsee:^(id object) {
        NSDictionary *dictSource = [NSJSONSerialization JSONObjectWithData:object options:0 error:0];
        self.mpage =  dictSource[@"result"][@"mpage"];
        NSArray *listSource = dictSource[@"result"][@"list"];
        
        for (NSDictionary *ListDic in listSource) {
            DisJumpModel *model = [[DisJumpModel alloc]initWithDictionary:ListDic error:nil];
            
            [self.dataSource addObject:model];
            
        }
        
        [self.tableview reloadData];
        [self.tableview.mj_header endRefreshing];
        [self.tableview.mj_footer endRefreshing];
    } and:^(NSError *error) {
        NSLog(@"%@",error);
        [self.tableview.mj_header endRefreshing];
        [self.tableview.mj_footer endRefreshing];
    }];
}
- (void)CreatUI{

    self.tableview = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.tableview.delegate = self;
    self.tableview.dataSource = self;
    self.tableview.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.tableview registerNib:[UINib nibWithNibName:@"discovJumpCell" bundle:nil] forCellReuseIdentifier:@"discovJumpCell"];
    [self.tableview registerNib:[UINib nibWithNibName:@"discovJumpCell2" bundle:nil] forCellReuseIdentifier:@"discovJumpCell2"];
    [self.view addSubview:self.tableview  ];
    

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{


    return self.dataSource.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    DisJumpModel *model = self.dataSource[indexPath.row];
    if ([model.showType isEqualToString:@"1"] && [model.jumpType isEqualToString:@"1"]) {
        discovJumpCell * cell = [tableView dequeueReusableCellWithIdentifier:@"discovJumpCell"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.model = model;
        return cell;
    }
    discovJumpCell2 *cell1 = [tableView dequeueReusableCellWithIdentifier:@"discovJumpCell2"];
    cell1.selectionStyle = UITableViewCellSelectionStyleNone;

    cell1.model = model;
    return cell1;
   
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    DisJumpModel *model = self.dataSource[indexPath.row];
    if ([model.showType isEqualToString:@"1"] && [model.jumpType isEqualToString:@"1"]) {
        
        return 293;
    }
    return 153;


}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    DisJumpModel *model = self.dataSource[indexPath.row];
    ShareWebViewController * webvc = [[ShareWebViewController alloc]init];
     NSString *NewUrl = [NSString stringWithFormat:BRANDHEADIMGJUMP,model.newsId];
    webvc.urlString = NewUrl;
    [self.navigationController pushViewController:webvc animated:YES];



}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = NO;
    self.navigationController.hidesBarsOnSwipe = NO;
    

}

@end
