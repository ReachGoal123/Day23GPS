//
//  ViewController.m
//  Day23GPS
//
//  Created by tarena on 15-4-12.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "ViewController.h"
#import <CoreLocation/CoreLocation.h>
@interface ViewController ()<CLLocationManagerDelegate>
@property (nonatomic, strong)CLLocationManager *manager;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    询问是否开启了位置服务
    if ([CLLocationManager locationServicesEnabled]) {
       self.manager = [[CLLocationManager alloc]init];
//        设置精度
        [self.manager setDesiredAccuracy:kCLLocationAccuracyBest];
//       设置更新距离 距离越小越精准 越费电
        [self.manager setDistanceFilter:20];
        self.manager.delegate = self;
        //开始更新经纬度
        [self.manager startUpdatingLocation];
        //获取方向 陀螺仪的值
        [self.manager startUpdatingHeading];
        
        
    }
}


- (void)locationManager:(CLLocationManager *)manager
    didUpdateToLocation:(CLLocation *)newLocation
           fromLocation:(CLLocation *)oldLocation{
    CLLocationCoordinate2D coord = newLocation.coordinate;
    
    NSLog(@"经度：%lf  维度：%lf",coord.longitude,coord.latitude);
    
}


//获取陀螺仪的值
-(void)locationManager:(CLLocationManager *)manager didUpdateHeading:(CLHeading *)newHeading{
    NSLog(@"角度：%f",newHeading.trueHeading);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
