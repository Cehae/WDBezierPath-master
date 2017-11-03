//
//  UIBezierPath+WDTools.h
//  WDBezierPathDemo
//
//  Created by apple on 2017/10/31.
//  Copyright © 2017年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WDBezierPathMaker : NSObject
/**
 *  @author gitKong
 *
 *  设置path的颜色
 
 *  color：path的颜色（stroke为线的颜色，fill则为填充颜色）
 */
@property (nonatomic,weak,readonly)WDBezierPathMaker *(^WD_color)(UIColor *color);
/**
 *  @author gitKong
 *
 *  设置path的线宽
 
 *  lineWidth：线宽，默认1
 */
@property (nonatomic,weak,readonly)WDBezierPathMaker *(^WD_lineWidth)(CGFloat lineWidth);
/**
 *  @author gitKong
 *
 *  线条拐角类型
 
 *  lineCapStyle：拐角类型宽，默认kCGLineCapButt（无端点），其他对应圆形端点、方形端点
 */
@property (nonatomic,weak,readonly)WDBezierPathMaker *(^WD_lineCapStyle)(CGLineCap lineCapStyle);
/**
 *  @author gitKong
 *
 *  线条终点处理
 
 *  lineJoinStyle：终点处理，默认kCGLineJoinMiter（尖角），其他对应圆角、缺角
 */
@property (nonatomic,weak,readonly)WDBezierPathMaker *(^WD_lineJoinStyle)(CGLineJoin lineJoinStyle);
/**
 *  @author gitKong
 *
 *  最大斜接长度（只有在使用kCGLineJoinMiter是才有效）， 边角的角度越小，斜接长度就会越大
 
 *  为了避免斜接长度过长，使用lineLimit属性限制，如果斜接长度超过miterLimit，边角就会以KCALineJoinBevel类型来显示
 */
@property (nonatomic,weak,readonly)WDBezierPathMaker *(^WD_miterLimit)(CGFloat miterLimit);
/**
 *  @author gitKong
 *
 *  弯曲路径的渲染精度，默认为0.6，越小精度越高，相应的更加消耗性能。
 */
@property (nonatomic,weak,readonly)WDBezierPathMaker *(^WD_flatness)(CGFloat flatness);
/**
 *  @author gitKong
 *
 *  单双数圈规则是否用于绘制路径，默认是NO。
 */
@property (nonatomic,weak,readonly)WDBezierPathMaker *(^WD_usesEvenOddFillRule)(BOOL usesEvenOddFillRule);
/**
 *  @author gitKong
 *
 *  绘制虚线
 
 *  参数：pattern：指针类型线性数据 count：pattern中数据个数 phase：起始位置
 */
@property (nonatomic,weak,readonly)WDBezierPathMaker *(^WD_setLineDash)(CGFloat *pattern,NSInteger count,CGFloat phase);
@property (nonatomic,weak,readonly)WDBezierPathMaker *(^WD_getLineDash)(CGFloat *pattern,NSInteger *count,CGFloat *phase);
/**
 *  @author gitKong
 *
 *  起点
 
 *  x：起点的x值；y：起点的y值
 */
@property (nonatomic,weak,readonly)WDBezierPathMaker *(^WD_moveTo)(CGFloat x,CGFloat y);
/**
 *  @author gitKong
 *
 *  添加线
 
 *  x：结束点的x值；y：结束点的y值
 */
@property (nonatomic,weak,readonly)WDBezierPathMaker *(^WD_addLineTo)(CGFloat x,CGFloat y);
/**
 *  @author gitKong
 *
 *  二次贝塞尔
 
 *  endPoint：结束点；controlPoint：控制点，就是对应的峰值位置
 */
@property (nonatomic,weak,readonly)WDBezierPathMaker *(^WD_addQuadCurveTo)(CGPoint endPoint,CGPoint controlPoint);
/**
 *  @author gitKong
 *
 *  绘制三次贝塞尔曲线
 
 *  endPoint：结束点；controlPoint：控制点，就是对应的峰值位置
 */
@property (nonatomic,weak,readonly)WDBezierPathMaker *(^WD_addCurveTo)(CGPoint endPoint,CGPoint controlPoint1,CGPoint controlPoint2);
/**
 *  @author gitKong
 *
 *  绘制圆弧曲线
 
 *  centerPoint：圆弧的中心，radius：半径，startAngle：开始角度（角度表示），endAngle：结束角度（角度表示），clockwise：是否顺时针方向（YES为顺时针）。
 */
@property (nonatomic,weak,readonly)WDBezierPathMaker *(^WD_addArcWith)(CGPoint centerPoint,CGFloat radius,CGFloat startAngle,CGFloat endAngle,BOOL clockwise);
/**
 *  @author gitKong
 *
 *  闭合起始点，连成线
 */
@property (nonatomic,weak,readonly)WDBezierPathMaker *WD_closePath;
/**
 *  @author gitKong
 *
 *  移除当前path的所有点
 */
@property (nonatomic,weak,readonly)WDBezierPathMaker *WD_removeAllPoints;
/**
 *  @author gitKong
 *
 *  拼接path
 
 *  bezierPath：需要拼接的path
 */
@property (nonatomic,weak,readonly)WDBezierPathMaker *(^WD_appendPath)(UIBezierPath *bezierPath);
/**
 *  @author gitKong
 *
 *  扭转路径，即起点变成终点，终点变成起点
 */
@property (nonatomic,weak,readonly)WDBezierPathMaker *WD_reverse;
/**
 *  @author gitKong
 *
 *  路径进行仿射变换
 */
@property (nonatomic,weak,readonly)WDBezierPathMaker *(^WD_transform)(CGAffineTransform transform);
/**
 *  @author gitKong
 *
 *  修改当前图形上下文的绘图区域可见,随后的绘图操作导致呈现内容只有发生在指定路径的填充区域
 */
@property (nonatomic,weak,readonly)WDBezierPathMaker *WD_addClip;
/**
 *  @author gitKong
 *
 *  描边，默认绘制颜色为UIColor.blackColor
 */
@property (nonatomic,weak,readonly)UIBezierPath * (^WD_stroke)();
/**
 *  @author gitKong
 *
 *  填充，默认填充颜色为UIColor.blackColor
 */
@property (nonatomic,weak,readonly)UIBezierPath * (^WD_fill)();

/**
 *  @author gitKong
 *
 *  设置描边的混合模式，默认绘制颜色为UIColor.blackColor
 
 *  blendMode：混合模式，默认为kCGBlendModeNormal；alpha：透明度
 */
@property (nonatomic,weak,readonly)UIBezierPath * (^WD_strokeWith)(CGBlendMode blendMode,CGFloat alpha);
/**
 *  @author gitKong
 *
 *  设置填充的混合模式，默认填充颜色为UIColor.blackColor
 
 *  blendMode：混合模式，默认为kCGBlendModeNormal；alpha：透明度
 */
@property (nonatomic,weak,readonly)UIBezierPath * (^WD_fillWith)(CGBlendMode blendMode,CGFloat alpha);

@end




#pragma mark - UIBezierPath分类
@interface UIBezierPath (WDTools)
/**
 *  @author gitKong
 *
 *  对外提供的 中间类对象，设置中间类的对象属性
 */
@property (nonatomic,weak,readonly)WDBezierPathMaker *WD_maker;
/**
 *  @author gitKong
 *
 *  类属性，创建UIBezierPath实例
 */
@property (class,nonatomic,weak,readonly)UIBezierPath *WD_path;

/**
 *  @author gitKong
 *
 *  绘制矩形
 */
@property (class,nonatomic,weak,readonly)UIBezierPath *(^WD_rect)(CGRect rect);
/**
 *  @author gitKong
 *
 *  绘制圆形或者椭圆形（取决于传入的rect）
 */
@property (class,nonatomic,weak,readonly)UIBezierPath *(^WD_ovalInRect)(CGRect rect);
/**
 *  @author gitKong
 *
 *  创建带有圆角的矩形，当矩形变成正圆的时候，Radius就不再起作用
 
 *  rect：矩形的Frame；cornerRadius：圆角的大小
 */
@property (class,nonatomic,weak,readonly)UIBezierPath *(^WD_roundedRect)(CGRect rect,CGFloat cornerRadius);
/**
 *  @author gitKong
 *
 *  设定特定的角为圆角的矩形
 
 *  rect：矩形的Frame；corners：指定的圆角；cornerRadius：圆角的大小
 */
@property (class,nonatomic,weak,readonly)UIBezierPath *(^WD_roundingCorners)(CGRect rect,UIRectCorner corners,CGSize cornerRadius);
/**
 *  @author gitKong
 *
 *  绘制圆弧
 
 *  center:圆点; radius:半径; startAngle:起始位置; endAngle:结束为止; clockwise:是否顺时针方向
 */
@property (class,nonatomic,weak,readonly)UIBezierPath *(^WD_arcCenter)(CGPoint center,CGFloat radius,CGFloat startAngle,CGFloat endAngle,BOOL clockwise);
/**
 *  @author gitKong
 *
 *  通过已有路径创建路径
 
 *  CGPath:已有路径,可以通过方法 UIBezierPath对象.CGPath 转换为 CGPath
 */
@property (class,nonatomic,weak,readonly)UIBezierPath *(^WD_CGPath)(CGPathRef CGPath);

@end
