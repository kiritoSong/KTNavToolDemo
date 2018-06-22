//
//  NavView.m
//  KTNavViewDemo
//
//  Created by 刘嵩野 on 2018/6/22.
//  Copyright © 2018年 kirito_song. All rights reserved.
//

#import "NavView.h"
#import "Masonry.h"
#import "UIView+LayoutMethods.h"

@interface NavView ()
@property (nonatomic,readwrite) NSMutableArray<UILabel *> * titleLabMArr;
@property (nonatomic,readwrite) UIView * line;
@end

@implementation NavView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.titleLabMArr = [NSMutableArray new];
    }
    return self;
}

- (void)setTitleCount:(NSInteger)titleCount {
    NSMutableString * str = [NSMutableString new];
    for (NSInteger i = 0; i < titleCount; i++) {
        [str appendString:@": "];
    }
    
    for (NSInteger i = 0; i < titleCount; i++) {
        UILabel * lab = [UILabel new];
        
        
        if (i%2) {
            lab.text = [NSString stringWithFormat:@"%zd %@",i,str];
        }else {
            lab.text = [NSString stringWithFormat:@"%@%zd %@",str,i,str];
        }
        [self addSubview:lab];
        [self.titleLabMArr addObject:lab];
        
        if (i == 0) {
            [lab mas_makeConstraints:^(MASConstraintMaker *make) {
                make.centerY.equalTo(self);
                make.left.equalTo(self).offset(20);
            }];
        }else {
            [lab mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.mas_equalTo(self.titleLabMArr[i-1].mas_right).offset(20);
                make.centerY.equalTo(self);
            }];
        }
    }
    
    
    [self setNeedsLayout];
    [self layoutIfNeeded];
    
    [self addSubview:self.line];
    self.line.frame = CGRectMake(self.titleLabMArr[0].left, self.height, self.titleLabMArr[0].width, 3);
    
}


- (UIView *)line {
    if (!_line) {
        _line = [UIView new];
        _line.backgroundColor = [UIColor greenColor];
    }
    return _line;
}

@end
