//
//  CLLocation+LXH.m
//
//  Created by honey on 16/8/29.
//  Copyright © 2016年 Honey. All rights reserved.
//  火星坐标系转换扩展
//
//  earth（国外 WGS84）, mars（国内 GCJ-02）, baidu（百度 BD-09） 坐标系间相互转换
//

#import "CLLocation+LXH.h"

void transform_earth_from_mars(double lat, double lng, double* tarLat, double* tarLng);
void transform_mars_from_baidu(double lat, double lng, double* tarLat, double* tarLng);
void transform_baidu_from_mars(double lat, double lng, double* tarLat, double* tarLng);


@implementation CLLocation (LXH)

const double a = 6378245.0;
const double ee = 0.00669342162296594323;

- (CLLocation*)locationMarsFromEarth
{
    double lat = 0.0;
    double lng = 0.0;
    transform_earth_from_mars(self.coordinate.latitude, self.coordinate.longitude, &lat, &lng);
    return [[CLLocation alloc] initWithCoordinate:CLLocationCoordinate2DMake(lat, lng)
                                         altitude:self.altitude
                               horizontalAccuracy:self.horizontalAccuracy
                                 verticalAccuracy:self.verticalAccuracy
                                           course:self.course
                                            speed:self.speed
                                        timestamp:self.timestamp];
}

- (CLLocation*)locationEarthFromMars
{
    CLLocationCoordinate2D coordinate = [self toNormalPoint:self.coordinate];
    return [[CLLocation alloc] initWithCoordinate:coordinate
                                         altitude:self.altitude
                               horizontalAccuracy:self.horizontalAccuracy
                                 verticalAccuracy:self.verticalAccuracy
                                           course:self.course
                                            speed:self.speed
                                        timestamp:self.timestamp];
}

- (CLLocationCoordinate2D)toNormalPoint:(CLLocationCoordinate2D) coordinate {
    // 由于相邻坐标的偏移结果接近，将火星坐标再火星一次，获取偏移量反推回来，就能得到一个很接近的结果
    double tarLat = 0.0;
    double tarLng = 0.0;
    transform_earth_from_mars(coordinate.latitude, coordinate.longitude, &tarLat, &tarLng);
    double lat_res = coordinate.latitude  + (coordinate.latitude  - tarLat);
    double lon_res = coordinate.longitude + (coordinate.longitude - tarLng);
    // 对这个结果周围再做试探，可试出一个更为精确的结果
    double min = 100;
    for (int i = -10; i <= 10; i++) {
        double lat_guess = lat_res + 0.000001 * i;
        double tarLat1 = 0.0;
        double tarLng1 = 0.0;
        transform_earth_from_mars(lat_guess, lon_res, &tarLat1, &tarLng1);
        double dist = [self distanceCoordinate:coordinate fromCoordinate:CLLocationCoordinate2DMake(tarLat1, tarLng1)];
        
        if (dist < min) {
            min = dist;
            lat_res = lat_guess;
        }
    }
    for (int i = -10; i <= 10; i++) {
        double lon_guess = lon_res + 0.000001 * i;
        double tarLat2 = 0.0;
        double tarLng2 = 0.0;
        transform_earth_from_mars(lat_res, lon_guess, &tarLat2, &tarLng2);
        double dist = [self distanceCoordinate:coordinate fromCoordinate:CLLocationCoordinate2DMake(tarLat2, tarLng2)];
        if (dist < min) {
            min = dist;
            lon_res = lon_guess;
        }
    }
    return CLLocationCoordinate2DMake(lat_res, lon_res);
}

// 获取两点之间距离
- (CLLocationDistance)distanceCoordinate:(CLLocationCoordinate2D)coordinate fromCoordinate:(CLLocationCoordinate2D)fromCoordinate
{
    //第一个坐标
    CLLocation *current=[[CLLocation alloc] initWithLatitude:coordinate.latitude longitude:coordinate.latitude];
    //第二个坐标
    CLLocation *before=[[CLLocation alloc] initWithLatitude:fromCoordinate.latitude longitude:fromCoordinate.longitude];
    // 计算距离
    return [current distanceFromLocation:before];
}

- (CLLocation*)locationBaiduFromMars
{
    double lat = 0.0;
    double lng = 0.0;
    transform_mars_from_baidu(self.coordinate.latitude, self.coordinate.longitude, &lat, &lng);
    return [[CLLocation alloc] initWithCoordinate:CLLocationCoordinate2DMake(lat, lng)
                                         altitude:self.altitude
                               horizontalAccuracy:self.horizontalAccuracy
                                 verticalAccuracy:self.verticalAccuracy
                                           course:self.course
                                            speed:self.speed
                                        timestamp:self.timestamp];
}

- (CLLocation*)locationMarsFromBaidu
{
    double lat = 0.0;
    double lng = 0.0;
    transform_baidu_from_mars(self.coordinate.latitude, self.coordinate.longitude, &lat, &lng);
    return [[CLLocation alloc] initWithCoordinate:CLLocationCoordinate2DMake(lat, lng)
                                         altitude:self.altitude
                               horizontalAccuracy:self.horizontalAccuracy
                                 verticalAccuracy:self.verticalAccuracy
                                           course:self.course
                                            speed:self.speed
                                        timestamp:self.timestamp];
}

+ (CLLocationCoordinate2D)coorMarsFromEarth:(CLLocationCoordinate2D)coor
{
    CLLocation *loc = [[CLLocation alloc] initWithLatitude:coor.latitude longitude:coor.longitude];
    
    CLLocation *result = [loc locationMarsFromEarth];
    
    return result.coordinate;
}

+ (CLLocationCoordinate2D)coorBaiduFromMars:(CLLocationCoordinate2D)coor
{
    CLLocation *loc = [[CLLocation alloc] initWithLatitude:coor.latitude longitude:coor.longitude];
    
    CLLocation *result = [loc locationBaiduFromMars];
    
    return result.coordinate;
}

+ (CLLocationCoordinate2D)coorMarsFromBaidu:(CLLocationCoordinate2D)coor
{
    CLLocation *loc = [[CLLocation alloc] initWithLatitude:coor.latitude longitude:coor.longitude];
    
    CLLocation *result = [loc locationMarsFromBaidu];
    
    return result.coordinate;
}



@end



bool transform_sino_out_china(double lat, double lon)
{
    if (lon < 72.004 || lon > 137.8347)
        return true;
    if (lat < 0.8293 || lat > 55.8271)
        return true;
    return false;
}

double transform_earth_from_mars_lat(double x, double y)
{
    double ret = -100.0 + 2.0 * x + 3.0 * y + 0.2 * y * y + 0.1 * x * y + 0.2 * sqrt(fabs(x));
    ret += (20.0 * sin(6.0 * x * M_PI) + 20.0 * sin(2.0 * x * M_PI)) * 2.0 / 3.0;
    ret += (20.0 * sin(y * M_PI) + 40.0 * sin(y / 3.0 * M_PI)) * 2.0 / 3.0;
    ret += (160.0 * sin(y / 12.0 * M_PI) + 320 * sin(y * M_PI / 30.0)) * 2.0 / 3.0;
    return ret;
}

double transform_earth_from_mars_lng(double x, double y)
{
    double ret = 300.0 + x + 2.0 * y + 0.1 * x * x + 0.1 * x * y + 0.1 * sqrt(fabs(x));
    ret += (20.0 * sin(6.0 * x * M_PI) + 20.0 * sin(2.0 * x * M_PI)) * 2.0 / 3.0;
    ret += (20.0 * sin(x * M_PI) + 40.0 * sin(x / 3.0 * M_PI)) * 2.0 / 3.0;
    ret += (150.0 * sin(x / 12.0 * M_PI) + 300.0 * sin(x / 30.0 * M_PI)) * 2.0 / 3.0;
    return ret;
}

void transform_earth_from_mars(double lat, double lng, double* tarLat, double* tarLng)
{
    if (transform_sino_out_china(lat, lng))
    {
        *tarLat = lat;
        *tarLng = lng;
        return;
    }
    double dLat = transform_earth_from_mars_lat(lng - 105.0, lat - 35.0);
    double dLon = transform_earth_from_mars_lng(lng - 105.0, lat - 35.0);
    double radLat = lat / 180.0 * M_PI;
    double magic = sin(radLat);
    magic = 1 - ee * magic * magic;
    double sqrtMagic = sqrt(magic);
    dLat = (dLat * 180.0) / ((a * (1 - ee)) / (magic * sqrtMagic) * M_PI);
    dLon = (dLon * 180.0) / (a / sqrtMagic * cos(radLat) * M_PI);
    *tarLat = lat + dLat;
    *tarLng = lng + dLon;
}

// --- transform_earth_from_mars end ---
// --- transform_mars_vs_bear_paw ---
// 参考来源：http://blog.woodbunny.com/post-68.html
const double x_pi = M_PI * 3000.0 / 180.0;

void transform_mars_from_baidu(double gg_lat, double gg_lon, double *bd_lat, double *bd_lon)
{
    double x = gg_lon, y = gg_lat;
    double z = sqrt(x * x + y * y) + 0.00002 * sin(y * x_pi);
    double theta = atan2(y, x) + 0.000003 * cos(x * x_pi);
    *bd_lon = z * cos(theta) + 0.0065;
    *bd_lat = z * sin(theta) + 0.006;
}

void transform_baidu_from_mars(double bd_lat, double bd_lon, double *gg_lat, double *gg_lon)
{
    double x = bd_lon - 0.0065, y = bd_lat - 0.006;
    double z = sqrt(x * x + y * y) - 0.00002 * sin(y * x_pi);
    double theta = atan2(y, x) - 0.000003 * cos(x * x_pi);
    *gg_lon = z * cos(theta);
    *gg_lat = z * sin(theta);
}
