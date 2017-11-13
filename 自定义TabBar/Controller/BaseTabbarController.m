//
//  BaseTabbarController.m
//  自定义TabBar
//
//  Created by Yang on 2017/11/13.
//  Copyright © 2017年 A589. All rights reserved.
//

#import "BaseTabbarController.h"
#import "MyTabBar.h"
#import "WJViewController.h"
@interface BaseTabbarController ()<MyTabBarDelegate>
@property(nonatomic,strong)MyTabBar *myTabBar;
@end

@implementation BaseTabbarController
/**
 iPhone X tabbar高度比较高  按49来算
 */
- (void)viewDidLoad {
    [super viewDidLoad];
    for (int i = 0; i < 4; i++) {
        WJViewController *vc = [[WJViewController alloc] init];
        [self addChildViewController:vc];
    }
}
-(MyTabBar *)myTabBar{
    if (!_myTabBar) {
        _myTabBar = [[MyTabBar alloc] initWithFrame:self.tabBar.bounds];
        NSArray *selectImage =@[@"tabBar_essence_click_icon",@"tabBar_new_click_icon",@"tabBar_friendTrends_click_icon",@"tabBar_me_click_icon"];
        NSArray *defaulImage = @[@"tabBar_essence_icon",@"tabBar_new_icon",@"tabBar_friendTrends_icon",@"tabBar_me_icon"];
        NSArray *titles =@[@"精华",@"新帖",@"朋友",@"我的"];
        [_myTabBar setWithSelectImages: selectImage defaulImage:defaulImage titles:titles];
        _myTabBar.delegate = self;
    }
    return _myTabBar;
}
-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    for (UIView *view in self.tabBar.subviews) {
        [view removeFromSuperview];
    }
    [self.tabBar addSubview:self.myTabBar];
}


-(void)selectWith:(NSInteger)index{
    self.selectedIndex = index;
}

@end
