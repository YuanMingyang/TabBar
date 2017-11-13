//
//  MyButton.m
//  自定义TabBar
//
//  Created by Yang on 2017/11/13.
//  Copyright © 2017年 A589. All rights reserved.
//

#import "MyButton.h"
@interface MyButton ()
@property(nonatomic,strong)UIImageView *imageView;
@property(nonatomic,strong)UILabel *titleLabel;

@property(nonatomic,strong)UIImage *defaulImage;
@property(nonatomic,strong)UIImage *selectImage;
@property(nonatomic,strong)NSString *title;
@end
@implementation MyButton

-(void)setWithDefaulImage:(UIImage *)defaulImage selectImage:(UIImage *)selectImage title:(NSString *)title{
    self.defaulImage = defaulImage;
    self.selectImage = selectImage;
    self.title = title;
    
    self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, 34)];
    self.imageView.contentMode = UIViewContentModeScaleAspectFit;
    [self addSubview:self.imageView];
    
    self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 34, self.frame.size.width, 15)];
    self.titleLabel.font = [UIFont systemFontOfSize:13];
    self.titleLabel.text = self.title;
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:self.titleLabel];
    
    self.button = [[UIButton alloc] initWithFrame:self.bounds];
    [self addSubview:self.button];
}
-(void)setIsSelect:(BOOL)isSelect{
    _isSelect = isSelect;
    if (isSelect) {
        self.imageView.image = self.selectImage;
        self.titleLabel.textColor = [UIColor darkGrayColor];
    }else{
        self.imageView.image = self.defaulImage;
        self.titleLabel.textColor = [UIColor grayColor];
    }
}


@end
