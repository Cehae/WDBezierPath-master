//
//  UIBezierPath+WDTools.m
//  WDBezierPathDemo
//
//  Created by apple on 2017/10/31.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "UIBezierPath+WDTools.h"

@interface WDBezierPathMaker ()

@property (nonatomic,weak)UIBezierPath *WD_path;

@property (nonatomic,strong)UIColor *currentLineColor;

@end

@implementation WDBezierPathMaker

CGFloat angle(CGFloat value){
    double pi = 3.14159265359;
    return (pi * value) / 180;
}

- (WDBezierPathMaker *(^)(UIColor *))WD_color{
    return ^(UIColor *color){
        self.currentLineColor = color;
        return self;
    };
}

- (WDBezierPathMaker *(^)(CGFloat))WD_lineWidth{
    return ^(CGFloat lineWidth){
        self.WD_path.lineWidth = lineWidth;
        return self;
    };
}

- (WDBezierPathMaker *(^)(CGLineCap))WD_lineCapStyle{
    return ^(CGLineCap lineCapStyle){
        self.WD_path.lineCapStyle = lineCapStyle;
        return self;
    };
}

- (WDBezierPathMaker *(^)(CGLineJoin))WD_lineJoinStyle{
    return ^(CGLineJoin lineJoinStyle){
        self.WD_path.lineJoinStyle = lineJoinStyle;
        return self;
    };
}

- (WDBezierPathMaker *(^)(CGFloat))WD_miterLimit{
    return ^(CGFloat miterLimit){
        self.WD_path.miterLimit = miterLimit;
        return self;
    };
}

- (WDBezierPathMaker *(^)(CGFloat))WD_flatness{
    return ^(CGFloat flatness){
        self.WD_path.flatness = flatness;
        return self;
    };
}

- (WDBezierPathMaker *(^)(BOOL))WD_usesEvenOddFillRule{
    return ^(BOOL usesEvenOddFillRule){
        self.WD_path.usesEvenOddFillRule = usesEvenOddFillRule;
        return self;
    };
}

- (WDBezierPathMaker *(^)(CGFloat *, NSInteger, CGFloat))WD_setLineDash{
    return ^(CGFloat *pattern,NSInteger count,CGFloat phase){
        [self.WD_path setLineDash:pattern count:count phase:phase];
        return self;
    };
}

- (WDBezierPathMaker *(^)(CGFloat *, NSInteger *, CGFloat *))WD_getLineDash{
    return ^(CGFloat *pattern,NSInteger *count,CGFloat *phase){
        [self.WD_path getLineDash:pattern count:count phase:phase];
        return self;
    };
}


- (WDBezierPathMaker *(^)(CGFloat x, CGFloat y))WD_moveTo{
    return ^(CGFloat x, CGFloat y){
        [self.WD_path moveToPoint:CGPointMake(x, y)];
        return self;
    };
}

- (WDBezierPathMaker *(^)(CGFloat, CGFloat))WD_addLineTo{
    return ^(CGFloat x, CGFloat y){
        [self.WD_path addLineToPoint:CGPointMake(x, y)];
        return self;
    };
}

- (WDBezierPathMaker *(^)(CGPoint, CGPoint))WD_addQuadCurveTo{
    return ^(CGPoint endPoint, CGPoint controlPoint){
        [self.WD_path addQuadCurveToPoint:endPoint controlPoint:controlPoint];
        return self;
    };
}

- (WDBezierPathMaker *(^)(CGPoint, CGPoint, CGPoint))WD_addCurveTo{
    return ^(CGPoint endPoint, CGPoint controlPoint1, CGPoint controlPoint2){
        [self.WD_path addCurveToPoint:endPoint controlPoint1:controlPoint1 controlPoint2:controlPoint2];
        return self;
    };
}

- (WDBezierPathMaker *(^)(CGPoint, CGFloat, CGFloat, CGFloat, BOOL))WD_addArcWith{
    return ^(CGPoint centerPoint,CGFloat radius,CGFloat startAngle,CGFloat endAngle,BOOL clockwise){
        
        [self.WD_path addArcWithCenter:centerPoint radius:radius startAngle:angle(startAngle) endAngle:angle(endAngle) clockwise:clockwise];
        return self;
    };
}


- (WDBezierPathMaker *)WD_closePath{
    [self.WD_path closePath];
    return self;
}

- (WDBezierPathMaker *)WD_removeAllPoints{
    [self.WD_path removeAllPoints];
    return self;
}

- (WDBezierPathMaker *(^)(UIBezierPath *))WD_appendPath{
    return ^(UIBezierPath *path){
        [self.WD_path appendPath:path];
        return self;
    };
}

- (WDBezierPathMaker *)reverse{
    CGPoint reversePoint = [self.WD_path bezierPathByReversingPath].currentPoint;
    self.WD_moveTo(reversePoint.x,reversePoint.y);
    return self;
}

- (WDBezierPathMaker *(^)(CGAffineTransform))WD_transform{
    return ^(CGAffineTransform transform){
        [self.WD_path applyTransform:transform];
        return self;
    };
}

- (WDBezierPathMaker *)WD_addClip{
    [self.WD_path addClip];
    return self;
}

- (UIBezierPath * (^)())WD_stroke{
    return ^{
        if (self.currentLineColor) {
            
            [self.currentLineColor setStroke];
        }
        else{
           
            [[UIColor blackColor] setStroke];
            
        }
        
        [self.WD_path stroke];
        
        return self.WD_path;
    };
}

- (UIBezierPath * (^)())WD_fill{
    return ^{
        if (self.currentLineColor) {
            [self.currentLineColor setFill];
        }
        else{
            [[UIColor blackColor] setFill];
        }
        [self.WD_path fill];
        return self.WD_path;
    };
}

- (UIBezierPath *(^)(CGBlendMode, CGFloat))WD_strokeWith{
    return ^(CGBlendMode blendMode, CGFloat alpha){
        if (self.currentLineColor) {
            [self.currentLineColor setStroke];
        }
        else{
            [[UIColor blackColor] setStroke];
        }
        [self.WD_path strokeWithBlendMode:blendMode alpha:alpha];
        
        return self.WD_path;
    };
}

- (UIBezierPath *(^)(CGBlendMode, CGFloat))WD_fillWith{
    return ^(CGBlendMode blendMode, CGFloat alpha){
        if (self.currentLineColor) {
            [self.currentLineColor setFill];
        }
        else{
            [[UIColor blackColor] setFill];
        }
        [self.WD_path fillWithBlendMode:blendMode alpha:alpha];
        
        return self.WD_path;
    };
}

@end

@implementation UIBezierPath (WDTools)

static WDBezierPathMaker *_WD_maker = nil;

- (WDBezierPathMaker *)WD_maker
{
    return _WD_maker;
}

+ (UIBezierPath *)WD_path{
    return FLCreatePath([UIBezierPath bezierPath]);
}

UIBezierPath * FLCreatePath(UIBezierPath *path){
    WDBezierPathMaker *maker = [[WDBezierPathMaker alloc] init];
    maker.WD_path = path;
    _WD_maker = maker;
    return path;
}


+ (UIBezierPath * (^)(CGRect))WD_rect{
    return ^(CGRect rect){
        return FLCreatePath([UIBezierPath bezierPathWithRect:rect]);
    };
}

+ (UIBezierPath * (^)(CGRect))WD_ovalInRect{
    return ^(CGRect rect){
        return FLCreatePath([UIBezierPath bezierPathWithOvalInRect:rect]);
    };
}

+(UIBezierPath * (^)(CGRect, CGFloat))WD_roundedRect{
    return ^(CGRect rect,CGFloat cornerRadius){
        return FLCreatePath([UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:cornerRadius]);
    };
}

+(UIBezierPath * (^)(CGRect, UIRectCorner, CGSize))WD_roundingCorners{
    return ^(CGRect rect,UIRectCorner corners,CGSize cornerRadii){
        return FLCreatePath([UIBezierPath bezierPathWithRoundedRect:rect byRoundingCorners:corners cornerRadii:cornerRadii]);
    };
}

+(UIBezierPath * (^)(CGPoint, CGFloat, CGFloat, CGFloat, BOOL))WD_arcCenter{
    return ^(CGPoint center,CGFloat radius,CGFloat startAngle,CGFloat endAngle,BOOL clockwise){
        return FLCreatePath([UIBezierPath bezierPathWithArcCenter:center radius:radius startAngle:angle(startAngle) endAngle:angle(endAngle) clockwise:clockwise]);
    };
}

+ (UIBezierPath * (^)(CGPathRef))WD_CGPath{
    return ^(CGPathRef CGPath){
        return FLCreatePath([UIBezierPath bezierPathWithCGPath:CGPath]);
    };
}

@end

