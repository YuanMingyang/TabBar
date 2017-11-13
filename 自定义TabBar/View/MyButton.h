//
//  MyButton.h
//  自定义TabBar
//
//  Created by Yang on 2017/11/13.
//  Copyright © 2017年 A589. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyButton : UIView

@property(nonatomic,assign)BOOL isSelect;
@property(nonatomic,strong)UIButton *button;

-(void)setWithDefaulImage:(UIImage *)defaulImage selectImage:(UIImage *)selectImage title:(NSString *)title;
@end
