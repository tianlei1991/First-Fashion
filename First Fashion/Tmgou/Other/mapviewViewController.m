//
//  mapviewViewController.m
//  Tmgou
//
//  Created by hj on 16/10/18.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

#import "mapviewViewController.h"
#import <MapKit/MapKit.h>
#import "CLLocation+LXH.h"

@interface mapviewViewController () <CLLocationManagerDelegate,MKMapViewDelegate>
{
    CLLocationManager *_manager;
    MKMapView *_mapView;
    CLLocationCoordinate2D _location2;
    MKLocalSearch *_search; //发送请求对象
    MKLocalSearchRequest *_request; //要搜索的请求
}

@end

@implementation mapviewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _mapView.delegate = self;
    _mapView = [[MKMapView alloc] initWithFrame:self.view.bounds];
    
    _mapView.showsUserLocation = YES;
    
    
    [self.view addSubview:_mapView];
    
    
    _manager = [[CLLocationManager alloc] init];
    
    //1.设置更新频率 distanceFilter
    _manager.distanceFilter = 1000;//以米为单位
    
    //2.设置精度  desiredAccuracy(精度越高越耗电)
    _manager.desiredAccuracy = kCLLocationAccuracyBestForNavigation;
    
    _manager.delegate = self;
    
    //请求用户同意定位
    //并且需要在info.plist中添加请求说明
    [_manager requestWhenInUseAuthorization];
    
    //开始定位
    [_manager startUpdatingLocation];
    CLLocationCoordinate2D coord = _location2;
    //创建范围
    MKCoordinateSpan span = MKCoordinateSpanMake(0.02, 0.02);
    
    //经纬度和范围合成区域
    MKCoordinateRegion region = MKCoordinateRegionMake(coord, span);
    
    //让地图显示这个区域
    [_mapView setRegion:region animated:YES];
    [self mapview];
    
}

- (void)mapview{
    
    CLGeocoder *coder = [[CLGeocoder alloc]init];
    [coder geocodeAddressString:self.loction completionHandler:^(NSArray *placemarks, NSError *error) {
        if (error) {
            NSLog(@"%@",error);
        }else{
            for (CLPlacemark *place in placemarks) {
//                NSLog(@"%@ - %@ - %@",place.locality,place.name,place.thoroughfare);
//                NSLog(@"地理坐标经纬度: %f, %f", place.location.coordinate.latitude, place.location.coordinate.longitude);
                [_mapView setRegion:MKCoordinateRegionMake(place.location.coordinate, _mapView.region.span) animated:YES];
                //添加大头针
                MKPointAnnotation *point = [[MKPointAnnotation alloc]init];
                point.coordinate = place.location.coordinate;
                point.title = place.name;
                point.subtitle = place.thoroughfare;
                [_mapView addAnnotation:point];
                
                
            }
        }
        
    }];
    
    
}
#pragma mark - 定位结果
- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations
{
    //取出最新的结果
    CLLocation *myLocation = [locations lastObject];
    myLocation =    [myLocation locationMarsFromEarth];
    _location2 = myLocation.coordinate;
    
    //移动地图
    MKCoordinateSpan span = MKCoordinateSpanMake(0.1, 0.1);
    
    MKCoordinateRegion region = MKCoordinateRegionMake(_location2, span);
    
    [_mapView setRegion:region animated:YES];
    
    //POI检索  point of insert
    _request = [[MKLocalSearchRequest alloc] init];
    //设置关键字
    _request.naturalLanguageQuery = self.loction;
    _request.region = region; //设置搜索范围
    
    //请求结果
    _search = [[MKLocalSearch alloc] initWithRequest:_request];
    
    //获取结果
    [_search startWithCompletionHandler:^(MKLocalSearchResponse * _Nullable response, NSError * _Nullable error) {
        
        if (error) {
            return ;
        }
        
        //获取结果,位置信息数组
        NSArray<MKMapItem *> *items = response.mapItems;
        for (MKMapItem *item in items) {
//            NSLog(@"%@", item.placemark.name); //位置名称
//            NSLog(@"%@", item.placemark.thoroughfare);//街道名称
//            NSLog(@"%@", item.placemark.locality);//城市
//            NSLog(@"%@", item.placemark.subLocality);//区
            NSLog(@"%@", item.placemark.administrativeArea);//省
//            NSLog(@"---------------");
        }
    }];
    
    MKPointAnnotation *point = [[MKPointAnnotation alloc]init];
    [_mapView addAnnotation:point];
    
    
    
    
    //停止定位
    [_manager stopUpdatingLocation];
    
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.title = @"地址";
    self.navigationController.navigationBar.hidden = false;
    UIButton *butt = [UIButton buttonWithType:UIButtonTypeCustom];
    butt.frame = CGRectMake(0, 0, 20, 20);
    [butt setImage:[UIImage imageNamed:BACKIMG] forState:UIControlStateNormal];
    [butt addTarget:self action:@selector(BackAction) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:butt];
    
    
    
}
- (void)BackAction{
    [self.navigationController popViewControllerAnimated:YES];
    
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
