//
//  MyTabBar.m
//  自定义TabBar
//
//  Created by Yang on 2017/11/13.
//  Copyright © 2017年 A589. All rights reserved.
//

#import "MyTabBar.h"
#import "MyButton.h"

@interface MyTabBar ()
@property(nonatomic,strong)NSMutableArray *items;
@end

@implementation MyTabBar
-(void)setWithSelectImages:(NSArray *)selectImages defaulImage:(NSArray *)defaulImage titles:(NSArray *)titles{
    CGFloat itemWidth = self.bounds.size.width/(selectImages.count+1);
    CGFloat itemHeight = self.bounds.size.height;
    
    self.items = [NSMutableArray array];
    
    UIButton *addBtn = [[UIButton alloc] initWithFrame:CGRectMake(itemWidth * 2, 0, itemWidth, 49)];
    
    addBtn.contentMode = UIViewContentModeTop;
    [addBtn setImage:[UIImage imageNamed:@"tabBar_publish_icon"] forState:UIControlStateNormal];
    [addBtn setImage:[UIImage imageNamed:@"tabBar_publish_click_icon"] forState:UIControlStateHighlighted];
    [addBtn addTarget:self action:@selector(addBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:addBtn];
    
    for (int i = 0; i < selectImages.count; i++) {
        MyButton *item;
        if (i<2) {
           item = [[MyButton alloc] initWithFrame:CGRectMake(itemWidth*i, 0, itemWidth, itemHeight)];
        }else{
            item = [[MyButton alloc] initWithFrame:CGRectMake(itemWidth*(i+1), 0, itemWidth, itemHeight)];
        }
        [item setWithDefaulImage:[UIImage imageNamed:defaulImage[i]] selectImage:[UIImage imageNamed:selectImages[i]] title:[titles objectAtIndex:i]];
        item.button.tag = i+100;
        [item.button addTarget:self action:@selector(selectBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        if (i==0) {
            item.isSelect = YES;
        }else{
            item.isSelect = NO;
        }
        [self.items addObject:item];
        [self addSubview:item];
    }
}
-(void)addBtnClick{
    
}

-(void)selectBtnClick:(UIButton *)sender{
    NSInteger index = sender.tag-100;
    MyButton *item = self.items[index];
    if (item.isSelect) {
        return;
    }
    for (NSInteger i = 0; i < self.items.count; i++) {
        MyButton *button = self.items[i];
        if (i == index) {
            button.isSelect = YES;
        }else{
            button.isSelect = NO;
        }
    }
    [self.delegate selectWith:index];
}

@end
