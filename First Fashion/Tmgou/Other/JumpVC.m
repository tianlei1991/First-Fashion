//
//  JumpVC.m
//  Tmgou
//
//  Created by qianfeng on 16/9/26.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

#import "JumpVC.h"
#import "JumpModel.h"
#import "JumpCell1.h"
#import "JumpCell2.h"
#import "HeadviewModel.h"
#import "JumpHeadView.h"
@interface JumpVC ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView *tableview;

@property (nonatomic,strong) NSMutableArray *JumpDataSource;

@property (nonatomic) NSInteger Page;

@property (nonatomic,copy) NSString *mpage;//上啦加载

@property (nonatomic,strong) NSMutableArray *HeadViewdataSource;

@property (nonatomic,strong) JumpHeadView *headView;

@end

@implementation JumpVC
-(NSMutableArray *)HeadViewdataSource{

    if (_HeadViewdataSource== nil) {
        _HeadViewdataSource = [NSMutableArray array];
    }
    return _HeadViewdataSource;

}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = NO;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    UIButton *butt = [UIButton buttonWithType:UIButtonTypeCustom];
    butt.frame = CGRectMake(0, 0, 20, 20);
    [butt setImage:[UIImage imageNamed:@"lefi2.png"] forState:UIControlStateNormal];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    [butt addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];
    self.title = self. JumpTitle;
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:butt];
    self.automaticallyAdjustsScrollViewInsets = YES;
    self.view.backgroundColor = [UIColor whiteColor];
    NSString *NewUrl = [NSString stringWithFormat:VCJUMPURL,self.jsindataSourceString];
    [self downLoadData:NewUrl];
    if ([self.JumpTitle isEqualToString:@"教你聪明的变美丽"]) {
        [self HeadViewdownLoadData];
    }
    [self CreatUI];
    [self refresh ];
    
    
}
- (void)backAction{

    [self.navigationController popViewControllerAnimated:YES ];

}
- (void)HeadViewdownLoadData{
    AFmanage *manage = [AFmanage ShareInstance];
    [manage getDataFormNet:JUMPHEADVIEWURL andSuccsee:^(id object) {
        NSDictionary *hedrDict = [NSJSONSerialization JSONObjectWithData:object options:0 error:0];
        NSArray *DataArr = hedrDict[@"result"][@"data"];
        for (NSDictionary *dic in DataArr) {
            HeadviewModel *headmodel = [[HeadviewModel alloc]initWithDictionary:dic error:nil];
            [self.HeadViewdataSource addObject:headmodel];
        }
        self.headView = [[JumpHeadView  alloc]init];
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
- (NSMutableArray *)JumpDataSource{
    if (_JumpDataSource == nil) {
        _JumpDataSource = [NSMutableArray array];
    }

    return _JumpDataSource;

}

- (void)refiechData{

    if (self.Page==0) {
        [self.JumpDataSource  removeAllObjects];
         NSString *NewUrl = [NSString stringWithFormat:VCJUMPURL,self.jsindataSourceString];
        [self downLoadData:NewUrl];
    }else{
    
        NSString *Topdata = [NSString stringWithFormat:JUMPDOWNURL,self.mpage];
        [self downLoadData:Topdata];
        
    }
        
}
- (void)downLoadData:(NSString *)data{
    AFmanage *mange = [AFmanage ShareInstance];
     NSString *NewString =  [data  stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    [mange getDataFormNet:NewString andSuccsee:^(id object) {
        NSDictionary *dictSource = [NSJSONSerialization JSONObjectWithData:object options:0 error:0];
   self.mpage =  dictSource[@"result"][@"mpage"];
        NSArray *listSource = dictSource[@"result"][@"list"];
        
        for (NSDictionary *ListDic in listSource) {
            JumpModel *model = [[JumpModel alloc]initWithDictionary:ListDic error:nil];
            [self.JumpDataSource addObject:model];
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
    self.tableview.dataSource = self;
    self.tableview.delegate = self;
    [self.tableview registerNib:[UINib nibWithNibName:@"JumpCell1" bundle:nil] forCellReuseIdentifier:@"JumpCell1"];
    [self.tableview registerNib:[UINib nibWithNibName:@"JumpCell2" bundle:nil] forCellReuseIdentifier:@"JumpCell2"];
       [self.view addSubview:self.tableview];
    self.tableview.separatorStyle = UITableViewCellSeparatorStyleNone;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.JumpDataSource.count;

}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    JumpModel *model = self.JumpDataSource[indexPath.row];
    if ([model.showType isEqualToString:@"1"]&&[model.jumpType isEqualToString:@"1"]) {
        JumpCell1 *cell1 = [tableView dequeueReusableCellWithIdentifier:@"JumpCell1"];
        cell1.selectionStyle = UITableViewCellSelectionStyleNone;
        cell1.model = model;
        
        return cell1;
    }
    JumpCell2 *cell2 = [tableView dequeueReusableCellWithIdentifier:@"JumpCell2"];
    cell2.model = model;
    cell2.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell2;

}
- (CGFloat )tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
 JumpModel *model = self.JumpDataSource[indexPath.row];
    if ([model.showType isEqualToString:@"1"]&&[model.jumpType isEqualToString:@"1"]) {
    
        return 292;
    }
    return 125;

}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    JumpModel *model = self.JumpDataSource[indexPath.row];
    if ([model.showType isEqualToString:@"1"]&&[model.jumpType isEqualToString:@"1"]) {
        NSString *NewUrl = [NSString stringWithFormat:BRANDHEADIMGJUMP,model.newsId];
        ShareWebViewController *vc = [[ShareWebViewController alloc]init];
        
        vc.urlString = NewUrl;
        [self.navigationController pushViewController:vc animated:YES];
    
    }else{
    
        NSString *NewUrl = [NSString stringWithFormat:BRANDHEADIMGJUMP,model.newsId];
        ShareWebViewController *vc = [[ShareWebViewController alloc]init];
        
        vc.urlString = NewUrl;
        [self.navigationController pushViewController:vc animated:YES];

    }


}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
