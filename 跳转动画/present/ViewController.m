//
//  ViewController.m
//  present
//
//  Created by 张永强 on 16/10/10.
//  Copyright © 2016年 张永强. All rights reserved.
//

#import "ViewController.h"
#import "MyViewController.h"

@interface ViewController ()<UITableViewDelegate , UITableViewDataSource>
/** 所有动画文字数组 */
@property (nonatomic , strong)NSArray *dataSources;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    tableView.delegate = self;
    tableView.dataSource = self;
    [self.view addSubview:tableView];
    self.dataSources = @[@"系统支持动画一",@"系统支持动画二",@"系统支持动画三",@"系统支持动画四" , @"自定义动画一", @"自定义动画二", @"自定义动画三", @"自定义动画四", @"自定义动画五", @"自定义动画六", @"自定义动画七", @"自定义动画八", @"自定义动画九", @"自定义动画十" ];
    
}
#pragma 系统默认的跳转动画
- (void)systemPresentWith:(UIModalTransitionStyle)style {
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:[MyViewController new]];
    [nav setModalTransitionStyle:style];
    [self presentViewController:nav animated:YES completion:nil];
}
- (void)customPresentWith:(NSString *)type {
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:[MyViewController new]];
    CATransition *animation = [CATransition animation];
    animation.duration = 1.0;
    animation.timingFunction = UIViewAnimationCurveEaseInOut;
    animation.type = type;
    //可以改变subtype的类型
    animation.subtype = kCATransitionFromLeft;
    [self.view.window.layer addAnimation:animation forKey:nil];
    [self presentViewController:nav animated:YES completion:nil];
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSources.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.textLabel.text = self.dataSources[indexPath.row];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.row) {
        case 0:
            //默认方式，竖向上推
            [self systemPresentWith:UIModalTransitionStyleCoverVertical];
            break;
        case 1:
            //水平反转
            [self systemPresentWith:UIModalTransitionStyleFlipHorizontal];
            break;
        case 2:
            //隐出隐现
              [self systemPresentWith:UIModalTransitionStyleCrossDissolve];
            break;
        case 3:
            //翻页
            [self systemPresentWith:UIModalTransitionStylePartialCurl];
            break;
        case 4:
            //淡出
            [self customPresentWith:kCATransitionFade];
            break;
        case 5:
            //覆盖原图
            [self customPresentWith:kCATransitionMoveIn];
            break;
        case 6:
            //推出
            [self customPresentWith:kCATransitionPush];
            break;
        case 7:
           //底部显出来
            [self customPresentWith:kCATransitionReveal];
            break;
        case 8:
             //向上翻一页
            [self customPresentWith:@"pageCurl"];
            break;
        case 9:
            //向下翻一页
            [self customPresentWith:@"pageUnCurl"];
            break;
        case 10:
            //滴水效果
            [self customPresentWith:@"rippleEffect"];
            break;
        case 11:
            //收缩效果，如一块布被抽走
            [self customPresentWith:@"suckEffect"];
            break;
        case 12:
            //立方体效果
            [self customPresentWith:@"cube"];
            break;
        case 13:
            //上下翻转效果
            [self customPresentWith:@"oglFlip"];
            break;
            
        default:
            break;
    }
}

@end
