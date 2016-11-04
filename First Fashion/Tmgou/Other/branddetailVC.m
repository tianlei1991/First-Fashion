///Users/hj/Desktop/Tmgou副本29/Tmgou
//  branddetailVC.m
//  Tmgou
//
//  Created by hj on 16/10/3.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

#import "branddetailVC.h"
#import "BandetailsDModel.h"
#import "BrandDetailCell.h"
#import "childViewController.h"
#import "CellJumpdetaliVC.h"
@interface branddetailVC ()<UIScrollViewDelegate>

@property (nonatomic) NSInteger index;

@property (nonatomic,strong) NSMutableArray *DataSource;

@property (nonatomic,strong) NSArray *TypeListarr;

@property (nonatomic,strong) NSMutableArray *TempArr;

@property (nonatomic,strong) NSMutableArray *arr;

@property (nonatomic,strong) UIView  *Toprollview;

@property (nonatomic,strong) UIScrollView *scrollview;
@end

@implementation branddetailVC
- (NSMutableArray *)TempArr{
    if (_TempArr == nil) {
        _TempArr = [NSMutableArray array];
    }
    return _TempArr;

}

- (NSMutableArray *)DataSource{
    if (_DataSource == nil) {
        _DataSource = [NSMutableArray array];
    }
    return _DataSource;


}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self Creatui];
    [self  downloadDaTa];
}
- (void)Creatui{
    self.automaticallyAdjustsScrollViewInsets = false;
    self.scrollview  = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 94, SCREEN.width, SCREEN.height)];
    self.scrollview.contentSize = CGSizeMake(SCREEN.width*5, 0);
    self.scrollview.backgroundColor = [UIColor blackColor];
    self.scrollview.delegate = self;
    self.scrollview.pagingEnabled = YES;
    self.Toprollview = [[UIView alloc]initWithFrame:CGRectMake(((SCREEN.width/5)/2)-10, 89, 20,4)];
    self.Toprollview.backgroundColor = [UIColor blueColor];

    [self.view addSubview:self.scrollview];
    self.title = @"品牌库";
    
    UIButton *butt = [UIButton buttonWithType:UIButtonTypeCustom];
    butt.frame = CGRectMake(0, 0, 20, 20);
    [butt setImage:[UIImage imageNamed:@"brandstoryback.png"] forState:UIControlStateNormal];
    [butt addTarget:self action:@selector(ButtBackAction) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:butt];

}
-(void)downloadDaTa{
    AFmanage *manage = [AFmanage ShareInstance];
    [manage getDataFormNet:self.Urlstring andSuccsee:^(id object) {
        NSDictionary *Datadict = [NSJSONSerialization JSONObjectWithData:object options:0 error:0];
        self.TypeListarr =  Datadict[@"result"][@"brandTypeList"];
        NSArray *allListarr  =  Datadict[@"result"][@"brandList"];
        for (NSDictionary *dict in allListarr) {
            BandetailsDModel *model = [[BandetailsDModel alloc]initWithDictionary:dict error:nil];
            NSMutableDictionary *Tempdic = [NSMutableDictionary dictionary];
            [Tempdic setObject:model forKey:model.typeId];
            [self.TempArr addObject:Tempdic];
        
            [self.DataSource addObject:model];
            
        }

        
        //创建butt..
             NSInteger count =  self.TypeListarr.count;
        for (NSInteger i = 0; i<self.TypeListarr.count; i++) {
            NSDictionary *dic = self.TypeListarr[i];
            UIButton *butt = [UIButton buttonWithType:UIButtonTypeCustom];
            [butt setTitle:dic[@"typeName"] forState:UIControlStateNormal];
            butt.frame = CGRectMake(i*SCREEN.width/count, 64, SCREEN.width/count, 30);

            NSString *typeid =    dic[@"typeId"];
            childViewController *vc = [[childViewController alloc]init];
            [vc setBlock:^(NSString * BrandId,NSString *title) {
                NSString *newUrl = [NSString stringWithFormat:BRANDTETALURL,BrandId];
                CellJumpdetaliVC *cellvc = [[CellJumpdetaliVC alloc]init];
                cellvc.urlString = newUrl;
                cellvc.mytetle = title;
                [self.navigationController pushViewController:cellvc animated:YES];
                
                
            }];
            [self addChildViewController:vc];
            NSMutableArray *teparr = [NSMutableArray array];
                for (NSDictionary *dic in self.TempArr) {
                BandetailsDModel *model    = [dic objectForKey:typeid];
                if (model != nil) {
                    [teparr addObject:model];
                    
                }
                
            }
            if (i == 0) {
                vc.DataSource = [NSMutableArray arrayWithArray:self.DataSource];
                vc.count = i;
            }else{
                vc.DataSource = [NSMutableArray arrayWithArray:teparr];
                vc.count = i;
            }
            vc.view.frame = CGRectMake(i*SCREEN.width,0, SCREEN.width, SCREEN.height);
            [self.scrollview addSubview:vc.view];
            
            butt.font  = [UIFont systemFontOfSize:14];
            butt.tag = i + 100;
            butt.backgroundColor = [UIColor  whiteColor];
            [butt setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            
            [butt addTarget:self action:@selector(ButtonClickedSource:) forControlEvents:UIControlEventTouchUpInside];
           
            [self.view addSubview:butt];
            [self.view addSubview:self.Toprollview];

        }
    } and:^(NSError *error) {
        
    }];


}
#pragma mark--滑块  // 记录逻辑。。！
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat index =   self.scrollview.contentOffset.x;
    NSInteger count = index/SCREEN.width;

    UIButton   *butt =  [self.view viewWithTag:count + 100];
    [butt     setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    if (count<self.index) {
        [butt     setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
         UIButton   *butt =  [self.view viewWithTag:self.index + 100];
        [butt     setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
      
    }else{
    
        [butt     setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        UIButton   *butt =  [self.view viewWithTag:self.index + 100];
        [butt     setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];

    }
    
    self.index = count;

    

       [UIView animateWithDuration:0.2 animations:^{
          self.Toprollview.frame = CGRectMake(((SCREEN.width/5)/2)+(index/5)-10, 89, 20,4);
     }];

}



-(void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView{
    UIButton   *butt =  [self.view viewWithTag:self.index + 100];
    [butt     setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
}


//
- (void)ButtonClickedSource:(UIButton *)sendr{
    [sendr setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    if (sendr.tag==100) {
        self.scrollview.contentOffset = CGPointMake(0, 0);
        [UIView animateWithDuration:0.2 animations:^{
            self.Toprollview.frame = CGRectMake(((SCREEN.width/5)/2)-10, 89, 20,4);
        }];


    }else if (sendr.tag == 101) {
        self.scrollview.contentOffset = CGPointMake(SCREEN.width, 0);
        [UIView animateWithDuration:0.2 animations:^{
            self.Toprollview.frame = CGRectMake(((SCREEN.width/5)/2)-10+(SCREEN.width*1/5), 89, 20,4);
        }];


        
    }else if(sendr.tag == 102){
    
        self.scrollview.contentOffset = CGPointMake(SCREEN.width*2, 0);
        [UIView animateWithDuration:0.2 animations:^{
            self.Toprollview.frame = CGRectMake(((SCREEN.width/5)/2)-10+(SCREEN.width*2/5), 89, 20,4);
        }];

        

    }else if(sendr.tag == 103 ){
        self.scrollview.contentOffset = CGPointMake(SCREEN.width*3, 0);
        [UIView animateWithDuration:0.2 animations:^{
            self.Toprollview.frame = CGRectMake(((SCREEN.width/5)/2)-10+(SCREEN.width*3/5), 89, 20,4);
        }];

    }else if(sendr.tag == 104 ){
        self.scrollview.contentOffset = CGPointMake(SCREEN.width*4, 0);
        [UIView animateWithDuration:0.2 animations:^{
            self.Toprollview.frame = CGRectMake(((SCREEN.width/5)/2)-10+(SCREEN.width*4/5), 89, 20,4);
        }];

    }
    

    }




#pragma mark --导航栏
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = NO;
    self.navigationController.hidesBarsOnSwipe = NO;
  

}
- (void)ButtBackAction{

    [self.navigationController popViewControllerAnimated:YES];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
