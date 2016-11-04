//
//  CLLocation+LXH.h
//
//  Created by honey on 16/8/29.
//  Copyright © 2016年 Honey. All rights reserved.
//  火星坐标系转换扩展
//
//  earth（国外 WGS84）, mars（国内 GCJ-02）, baidu（百度 BD-09） 坐标系间相互转换
//

#import <CoreLocation/CoreLocation.h>

@interface CLLocation (LXH)

- (CLLocation*)locationMarsFromEarth;
- (CLLocation*)locationEarthFromMars;


- (CLLocation*)locationBaiduFromMars;
- (CLLocation*)locationMarsFromBaidu;


@end
