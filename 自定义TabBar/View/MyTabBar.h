//
//  MyTabBar.h
//  自定义TabBar
//
//  Created by Yang on 2017/11/13.
//  Copyright © 2017年 A589. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol MyTabBarDelegate <NSObject>
-(void)selectWith:(NSInteger)index;
@end

@interface MyTabBar : UIView

@property(nonatomic,assign)id<MyTabBarDelegate>delegate;

-(void)setWithSelectImages:(NSArray *)selectImages defaulImage:(NSArray *)defaulImage titles:(NSArray *)titles;
@end
