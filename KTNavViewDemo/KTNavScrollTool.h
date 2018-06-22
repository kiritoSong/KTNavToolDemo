//
//  KTNavScrollTool.h
//  KTNavViewDemo
//
//  Created by 刘嵩野 on 2018/6/22.
//  Copyright © 2018年 kirito_song. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface KTNavScrollTool : NSObject


/**
 初始化

 @param titleArr 按钮数组
 @param line 需要移动的横线
 @return 实例对象
 */
- (instancetype)initWithTitleArr:(NSArray<UIView *> *)titleArr line:(UIView *)line;


/**
 移动的函数

 @param offsetRate scrollview滚动式的偏移量的比例
 */
- (void)configLingWithOffsetRate:(CGFloat)offsetRate;
@end
