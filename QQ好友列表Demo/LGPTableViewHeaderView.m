//
//  LGPTableViewHeaderView.m
//  QQ好友列表Demo
//
//  Created by 李广鹏 on 16/6/12.
//  Copyright © 2016年 李广鹏. All rights reserved.
//

#import "LGPTableViewHeaderView.h"
#import "LGPSectionModel.h"

@interface LGPTableViewHeaderView ()

@property (nonatomic, strong) UIButton *btn;

@end

@implementation LGPTableViewHeaderView

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithReuseIdentifier:reuseIdentifier]) {
        
        _btn = [UIButton buttonWithType:UIButtonTypeCustom];
        _btn.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 40);
        [_btn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
        [_btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self addSubview:_btn];
        
    }
    return self;
}

- (void)setSectionModel:(LGPSectionModel *)sectionModel
{
    _sectionModel = sectionModel;
    
    [_btn setTitle:_sectionModel.sectionTitle forState:UIControlStateNormal];
    
}

- (void)btnAction:(UIButton *) sender
{
    _sectionModel.isExpanded = !_sectionModel.isExpanded;
    
    if (self.clickBlock) {
        self.clickBlock(_sectionModel.isExpanded);
    }
}

@end
