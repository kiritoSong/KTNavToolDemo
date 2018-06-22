# KTNavToolDemo

只封装了移动的动画、并没封装按钮变色等等一系列功能。

![KTNavDemo.gif](https://upload-images.jianshu.io/upload_images/1552225-9c30e243093bb339.gif?imageMogr2/auto-orient/strip)

用起来也挺简单的、只要将`按钮的数组`、`下方横线`交付、在屏幕滑动的时候把`偏移量`传递进去、就能自动工作了。宽度啊什么都会自己算:
```
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

```

## [简书链接](https://www.jianshu.com/p/456a63c3b402)
