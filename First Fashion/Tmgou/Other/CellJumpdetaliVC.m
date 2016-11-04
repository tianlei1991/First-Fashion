//
//  CellJumpdetaliVC.m
//  Tmgou
//
//  Created by qianfeng on 16/10/10.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

#import "CellJumpdetaliVC.h"
#import "CellBranJumpModel.h"
#import "CellJBrandCell.h"
#import "CellJbrandCell2.h"
#import "smallCell.h"
#import "CellJbrandCell3.h"
#import "JumptitleCell.h"
#import "NewViewCell.h"
#import "ItemCellTableViewCell.h"
#import "SimilarTableViewCell.h"
#import <MapKit/MapKit.h>
#import "mapviewViewController.h"
#import "MapTableiviewVC.h"
#import "MaPModel.h"
#import "BrandStoryCelljump.h"
#import "InteractiveJumpVC.h"
#import "NewListVC.h"
#import "ItemViewConjump.h"
#import "inteBrandVCViewController.h"
#import "CLLocation+LXH.h"
@interface CellJumpdetaliVC ()<UITableViewDelegate,UITableViewDataSource,CLLocationManagerDelegate,MKMapViewDelegate>
{
    CLLocationCoordinate2D _CLLocation;



}
@property (nonatomic,strong) UITableView *tableview;

@property (nonatomic,strong) NSMutableArray *DataSource;

@property (nonatomic,strong) NSMutableArray *TempDataSource;

@property (nonatomic,assign) CGFloat   recordCellHeigth;

@property (nonatomic,assign) CGFloat  cellHeigth;

@property (nonatomic,assign) CGFloat intecactionCellheigth;

@property (nonatomic,strong)  UIImageView  *headView;

@property (nonatomic,strong)  UIView *navigationBackgroundView;

@property (nonatomic,strong) CLLocationManager *locationManager;

@property (nonatomic,strong) MKMapView *mapview;

@property (nonatomic,strong) MKLocalSearch *search;

@property (nonatomic,strong) MKLocalSearchRequest *request;

@property (nonatomic,strong) NSMutableArray <MKMapItem *>*mapTempArr;

@property (nonatomic,copy) NSString *maptitle;

@property (nonatomic,assign) CGFloat itemheigth;

@property (nonatomic,assign) NSInteger  record;

@property (nonatomic,copy) NSString *recordbrandID;

@property (nonatomic,copy) NSString *mystringtitle;
@end


@implementation CellJumpdetaliVC
-(NSMutableArray<MKMapItem *> *)mapTempArr{
    if (_mapTempArr == nil) {
        _mapTempArr = [NSMutableArray array];
    }
    return _mapTempArr;


}
- (NSMutableArray *)TempDataSource{
    if (_TempDataSource == nil) {
        _TempDataSource = [NSMutableArray array];
    }
    return _TempDataSource;


}

-(NSMutableArray *)DataSource{
    if (_DataSource == nil) {
        _DataSource = [NSMutableArray array];
    }
    return _DataSource;

}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self DownloadDataSource];
    [self CreatUI];
}
- (void)CreatUI{
   self.record = 0;
    UIButton *navbutt = [UIButton buttonWithType:UIButtonTypeCustom];
    navbutt.frame = CGRectMake(0, 0, 20, 20);
    [navbutt addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];
    [navbutt setImage:[UIImage imageNamed:@"arrow_black_back.png"] forState:UIControlStateNormal];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:navbutt];
    self.tableview = [[UITableView alloc]initWithFrame:[UIScreen mainScreen].bounds style:UITableViewStylePlain];
    self.tableview.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableview.delegate = self;
    self.tableview.dataSource = self;
        [self.view addSubview:self.tableview];
    self.tableview.scrollsToTop = YES;

#pragma mark 导航栏放大图片
    self.tableview.contentInset = UIEdgeInsetsMake(SCREEN.height-200, 0, 0, 0);
    UIBlurEffect *blur = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
    
    UIVisualEffectView *effectView = [[UIVisualEffectView alloc] initWithEffect:blur];
    effectView.frame = self.headView.bounds;
    effectView.transform = CGAffineTransformMakeScale(2, 2);
    NSArray *subs = self.navigationController.navigationBar.subviews;
    for (UIView *v in subs) {
        
        NSString *className = NSStringFromClass([v class]);
        
        if ([className isEqualToString:@"_UINavigationBarBackground"]) {
            self.navigationBackgroundView = v;
        }
        
  
        
    }

    self.navigationBackgroundView.alpha = 0;
#pragma mark 地图

    self.locationManager = [[CLLocationManager alloc]init];
    self.locationManager.distanceFilter = 1000;
    self.locationManager.desiredAccuracy = kCLLocationAccuracyBestForNavigation;
    [self.locationManager requestWhenInUseAuthorization];
    [self.locationManager startUpdatingHeading];
    self.locationManager.delegate = self;
    [self.locationManager startUpdatingLocation];
    self.mapview = [[MKMapView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    MKCoordinateSpan span = MKCoordinateSpanMake(0.1, 0.1);
    MKCoordinateRegion region = MKCoordinateRegionMake(_CLLocation, span);
    [self.mapview    setRegion:region animated:YES];
    self.mapview .delegate = self;
    self.mapview .showsUserLocation = YES;
    self.mapview.delegate = self;
    self.mapview.showsUserLocation = YES;
    [self.mapview reloadInputViews];
#pragma mark Cell 注册
    
    [self.tableview registerNib:[UINib nibWithNibName:@"CellJBrandCell" bundle:nil] forCellReuseIdentifier:@"CellJBrandCell"];
    
    [self.tableview registerNib:[UINib  nibWithNibName:@"CellJbrandCell2" bundle:nil] forCellReuseIdentifier:@"CellJbrandCell2"];
    
   [self.tableview registerNib:[UINib nibWithNibName:@"smallCell" bundle:nil] forCellReuseIdentifier:@"smallCell"];
    
    
    [self.tableview registerNib:[UINib nibWithNibName:@"JumptitleCell" bundle:nil] forCellReuseIdentifier:@"JumptitleCell"];
    

       [self.tableview registerNib:[UINib  nibWithNibName:@"NewViewCell" bundle:nil] forCellReuseIdentifier:@"NewViewCell"];
   
    
    [self.tableview registerClass:[CellJbrandCell3 class] forCellReuseIdentifier:@"CellJbrandCell3"];
    
       [self.tableview registerClass:[ItemCellTableViewCell class] forCellReuseIdentifier:@"ItemCellTableViewCell"];

     [self.tableview registerNib:[UINib nibWithNibName:@"SimilarTableViewCell" bundle:nil] forCellReuseIdentifier:@"SimilarTableViewCell"];
    
}

-(void)backAction{

    [self. navigationController popViewControllerAnimated:YES];

}
#pragma mark Cell 数据下载
- (void)DownloadDataSource{
    
    
    AFmanage *mange = [AFmanage ShareInstance];
    [mange getDataFormNet:self.urlString andSuccsee:^(id object) {
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:object options:0 error:0];
            CellBranJumpModel *model = [[CellBranJumpModel alloc] initWithDictionary: dict[@"result"] error:nil];
        self.title = model.title;
        self.mystringtitle = model.title;
        self.recordbrandID = model.brandId;
        //创建Headview放大
        self.headView = [[UIImageView alloc]initWithFrame:CGRectMake(0, -(SCREEN.height-200), SCREEN.width, SCREEN.height-200)];
        [self.headView sd_setImageWithURL:[NSURL URLWithString:model.background] placeholderImage:[UIImage imageNamed:@"1"]];
        self.headView.contentMode = UIViewContentModeScaleAspectFill;
        [self.tableview insertSubview:self.headView atIndex:0];
        
       
            
            
       
     
        
        
#pragma mark Cell返回高度
        
        
        
        
        NSInteger count = model.interactive.count;
        for (CellinteractiveModel *model1 in model.interactive) {
             if ([model1.showType isEqualToString:@"7"] && [model1.jumpType isEqualToString:@"12"]) {
               self.record ++;
                 
             if (model1.coverImg.length ==0) {
                self.record --;
                 }
             }
          
            
        }
#pragma mark--------interactivecell返回高度
        
        if (model.interactive.count !=0) {
            self.intecactionCellheigth = count * 115 +(115*self.record);
        }
        CellinteractiveModel *model2 =[model.interactive firstObject ];
        model2.cellheigth = self.intecactionCellheigth;
        

        
        NSInteger itemcount = model.itemList.count;
        for (itemListModel *itemmodel in model.itemList) {
            itemmodel.ItemHeigth = itemcount/2 *160;
        }
                //算出高度
     CGFloat tempindex =  [Helper  heightOfString:model.summary font:[UIFont systemFontOfSize:17] width:SCREEN.width-16];
        self.cellHeigth = 220;
        
        //算出多余的高度
   self.recordCellHeigth = tempindex -(220 -130) ;
#pragma mark--------其他cell返回高度
      if (model.itemList.count !=0) {
            self.itemheigth = itemcount/2 *140+120;

        }
        

        [self.DataSource addObject:model];//0
  
        [self.tableview reloadData];
        
    } and:^(NSError *error) {
        
    }];
    


}
#pragma mark tableview代理方法

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 8;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    CellBranJumpModel *model = [self.DataSource firstObject];
    if (indexPath.row == 0) {
        CellJBrandCell *cell1 = [tableView dequeueReusableCellWithIdentifier:@"CellJBrandCell"];
        cell1.model = model;
        [cell1 setBlockButtclick:^(NSInteger  count) {
            if (count == 0) {
                self.cellHeigth = 220;
                
                [self.tableview reloadData];
                
            }else{
                self.cellHeigth+=self.recordCellHeigth;
                [self.tableview reloadData];
            }
            
            
        }];
        cell1.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell1;
    } if (indexPath.row == 1 ){//1品牌故事
        if ( model.brandStory.count!=0) {
            CellJbrandCell2 *cell2 = [tableView dequeueReusableCellWithIdentifier:@"CellJbrandCell2"];
            cell2.dataSource = model.brandStory;
            [cell2 setBlockaction:^(NSString *newid) {
                BrandStoryCelljump *brandstoryvc = [[BrandStoryCelljump alloc]init];
                brandstoryvc.MyurlString = [NSString stringWithFormat:BRANDSTORYCELL,newid];
                [self.navigationController pushViewController:brandstoryvc animated:YES];
            }];
            cell2.selectionStyle = UITableViewCellSelectionStyleNone;

            return cell2;
            
        }else{
            UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"tempcell"];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            

            return cell;
        }
        
        }if (indexPath.row == 2 ){//2互动的头
            if (model.interactive.count != 0) {
                JumptitleCell *jumpcell = [tableView dequeueReusableCellWithIdentifier:@"JumptitleCell"];
                jumpcell.model = model;
                [jumpcell setBlockJumpintercativoVC:^{
                    inteBrandVCViewController  *intevc = [[inteBrandVCViewController  alloc]init];
                    intevc.urlstring = [NSString stringWithFormat:BRANDINTERJOINJUMP,self.recordbrandID];
                    [self.navigationController pushViewController:intevc animated:YES];
                    
                    
                }];
                jumpcell.selectionStyle = UITableViewCellSelectionStyleNone;

                return jumpcell;
                
            }else{
            
                UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"tempcell"];
                cell.selectionStyle = UITableViewCellSelectionStyleNone;
                

                return cell;

        }
        }if (indexPath.row == 3) {//3互动
                if ( model.interactive.count != 0) {
                    CellJbrandCell3 *intecell3 = [tableView dequeueReusableCellWithIdentifier:@"CellJbrandCell3"];
                    intecell3.DataSource =model.interactive;
                    [intecell3 setBlockJump:^(NSString * url) {
                        shareWebViewVC2 *webvc = [[shareWebViewVC2 alloc]init];
                        webvc.urlString = url;
                        [self.navigationController pushViewController:webvc animated:YES];
                    }];
                    intecell3.selectionStyle = UITableViewCellSelectionStyleNone;
                    
                    return intecell3;
                    
                }else{
                    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"tempcell"];
                    cell.selectionStyle = UITableViewCellSelectionStyleNone;
                    

                    return cell;
                }
                
        }if (indexPath.row == 4) {//4 品牌资讯
            if (model.newsList.count != 0 ) {
                NewViewCell *newcell = [tableView dequeueReusableCellWithIdentifier:@"NewViewCell"];
                newcell.DataSource = model.newsList;
                [newcell setCellblockJump:^(NSString * url) {
                    shareWebViewVC2 *shavc = [[shareWebViewVC2 alloc]init];
                    shavc.urlString = url;
                    [self.navigationController pushViewController:shavc animated:YES];
                
                }];
                  [newcell setButtJumpblock:^{
                      NewListVC * vc = [[NewListVC alloc]init];
                      vc.urlstring = [NSString stringWithFormat:BRANDBNEWLISTJUMPCELL,self.recordbrandID];
                      vc.mytitle = self.title;
                      [self.navigationController pushViewController:vc animated:YES];
                      
                  }];
                newcell.selectionStyle = UITableViewCellSelectionStyleNone;

                return newcell;
            }else{
            
                UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"tempcell"];
                cell.selectionStyle = UITableViewCellSelectionStyleNone;
                

                return cell;
            }
        }if (indexPath.row ==5) {
            if (model.itemList.count != 0) {
                ItemCellTableViewCell *Itemcell = [tableView dequeueReusableCellWithIdentifier:@"ItemCellTableViewCell"];
                Itemcell.DataSource = model.itemList;
                [Itemcell setButtblock:^{
                    ItemViewConjump *vc = [[ItemViewConjump alloc]init];
                    vc.urlstring = [NSString stringWithFormat:BRANDITEMJUMP,self.recordbrandID];
                    [self.navigationController pushViewController:vc animated:YES];
                    
                }];
                [Itemcell setCellBlcok:^(NSString *url) {
                    shareWebViewVC2 *shavc = [[shareWebViewVC2 alloc]init];
                    shavc.urlString =url;
                    [self.navigationController pushViewController:shavc animated:YES];
                    
                }];
                Itemcell.selectionStyle = UITableViewCellSelectionStyleNone;

                return Itemcell;
                
            }else{
            
                UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"tempcell"];
                cell.selectionStyle = UITableViewCellSelectionStyleNone;
                

                return cell;
            
            }
        } if (indexPath.row == 7) {
            if (model.similarBrand.count!= 0) {
                SimilarTableViewCell *similcell = [tableView dequeueReusableCellWithIdentifier:@"SimilarTableViewCell"];
                similcell.dataSource = model.similarBrand;
                [similcell setBlockJump:^(NSString *url,NSString *totitle) {
                    CellJumpdetaliVC *selfvc = [[CellJumpdetaliVC alloc]init];
                    selfvc.urlString = [NSString stringWithFormat:BRANDTETALURL,url];
                    selfvc.mytetle = totitle;
                    [self.navigationController pushViewController:selfvc animated:YES];
                }];
                similcell.selectionStyle = UITableViewCellSelectionStyleNone;

                return similcell;
            }else{
                UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"tempcell"];
                cell.selectionStyle = UITableViewCellSelectionStyleNone;

                return cell;
            
            }
        }
    
#pragma  mark --跳转地图
    smallCell *mapCell = [tableView dequeueReusableCellWithIdentifier:@"smallCell"];
    mapCell.selectionStyle = UITableViewCellSelectionStyleNone;
    [mapCell setBlockActionAddview:^(NSString * location) {
        mapviewViewController *vc = [[mapviewViewController alloc]init];
        vc.loction = location;
        [self.navigationController pushViewController:vc animated:YES];

        
    }];
    
 
        
   
#pragma  mark --跳转maptableview

    [mapCell setBlcokActionJumptableiview:^{
        
        MapTableiviewVC *mtabv = [[MapTableiviewVC alloc]init];
        
        for (MKMapItem *item in self.mapTempArr) {
            
            [mtabv.DataSourec addObject:item.placemark.thoroughfare];
        }
        [self.navigationController pushViewController:mtabv animated:YES];

        
    }];
   MKMapItem *item =  [self.mapTempArr firstObject];
    mapCell.mytitle =item.placemark.thoroughfare;
    return mapCell;
    

    
    
    
   
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    CellBranJumpModel *model = [self.DataSource firstObject];
    if (indexPath.row ==0) {
        return self.cellHeigth;
    } if (indexPath.row == 1 ){
        if (model.brandStory.count != 0) {
            return 330;
        }else{
            return 0;
        }
    } if(indexPath.row == 2 ){
        if (model.interactive.count !=0) {
            return 55;
        }else{
        
            return 0;
        }
    } if (indexPath.row ==3 ) {
            if (model.interactive.count != 0) {
                return self.intecactionCellheigth;
            }else{
                
                return 0;
            }

        }if (indexPath.row ==4) {
            if (model.newsList.count != 0) {
            return 260;
        }else{
        
            return 0 ;
        }
    } if (indexPath.row == 5) {
        if (model.itemList.count != 0) {
            return self.itemheigth;
        }else{
        
            return 0;
        }
       
    } if (indexPath.row == 7 ) {
        if (model.similarBrand.count != 0) {
            return 180;
        }
            return 0;
        
    }
        return 150;
    


}
#pragma mark 图片放大逻辑
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat offsetY = scrollView.contentOffset.y;
    
  
    
    // 计算导航透明度
    CGFloat p = (offsetY + SCREEN.height-200) / (SCREEN.height-200 - 64);
    self.navigationBackgroundView.alpha = p;
    // 判断是否往下拖拽
    if (offsetY < -(SCREEN.height-200)) {
        CGFloat scale = (-offsetY - (SCREEN.height-200)) * 0.01;
        
        self.headView.transform = CGAffineTransformMakeScale(scale + 1, scale + 1);
    }
}
#pragma mark locationManager 返回位置的方法
- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations{
    CLLocation *mylocatuion = [locations lastObject];
    mylocatuion = [mylocatuion locationMarsFromEarth];
    _CLLocation =mylocatuion.coordinate;
    MKCoordinateSpan span = MKCoordinateSpanMake(0.1, 0.1);
    MKCoordinateRegion region = MKCoordinateRegionMake(_CLLocation, span);
    self.request = [[MKLocalSearchRequest alloc]init];
    if (self.mystringtitle.length == 0) {
        self.request.naturalLanguageQuery =  self.mytetle;
        self.request.region = region;

    }else{
        self.request.naturalLanguageQuery = self.mystringtitle;
        self.request.region = region;
    
    }
    
    self.search = [[MKLocalSearch alloc]initWithRequest:self.request];
    [self.search startWithCompletionHandler:^(MKLocalSearchResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            return ;
        }
        NSArray<MKMapItem *> *items = response.mapItems;
        
        for (MKMapItem *item in items) {
         
            [self.mapTempArr addObject:item];
            
        }

        
    }];
    MKMapItem *item = [self.mapTempArr   firstObject];
    MaPModel *point = [[MaPModel alloc]init];
    point.title =    item.placemark.thoroughfare;
    point.coordinate = _CLLocation;
    [self.mapview addAnnotation:point];


}
- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation{
    MKAnnotationView *v = [mapView dequeueReusableAnnotationViewWithIdentifier:@"x"];
    if (v==nil) {
        v = [[MKPinAnnotationView alloc]initWithAnnotation:annotation reuseIdentifier:@"x"];
    }
    v.canShowCallout = true;
    MKPinAnnotationView *pin = (MKPinAnnotationView *)v;
    pin.animatesDrop = YES;
    pin.pinColor = MKPinAnnotationColorRed;
    pin.canShowCallout =YES;

    return v;

}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = NO;


}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}



@end
