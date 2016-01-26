//
//  RotateView.m
//  RotatePractice
//
//  Created by Xuan on 1/26/16.
//  Copyright © 2016 Wingzero. All rights reserved.
//

#import "RotateView.h"

@implementation RotateView


/**
 *  draw translate, translate+rotate, and normal text
 *
 *  @param rect CGRect
 *
 */
- (void)drawRect:(CGRect)rect {
    // Drawing code
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSaveGState(context);
    
    NSMutableParagraphStyle *paraStyle = [[NSParagraphStyle defaultParagraphStyle] mutableCopy];
    paraStyle.alignment = NSTextAlignmentCenter;
    
    NSDictionary *labelAttrs = @{NSFontAttributeName: [UIFont systemFontOfSize:17],
                                 NSForegroundColorAttributeName: [UIColor blackColor],
                                 NSParagraphStyleAttributeName: paraStyle};
    
    CGRect boundRect = [self.text boundingRectWithSize:rect.size
                                              options:NSStringDrawingUsesLineFragmentOrigin
                                           attributes:labelAttrs context:nil];
    CGSize textSize = boundRect.size;
    
    [self drawTranslateText:context size:textSize inRect:boundRect attributes:labelAttrs];
    
    [self drawTranslateAndRotateText:context size:textSize inRect:boundRect attributes:labelAttrs];
    
    [self drawNormalText:context size:textSize inRect:boundRect attributes:labelAttrs];
    
    CGContextRestoreGState(context);
}

-(void)drawTranslateText:(CGContextRef)context size:(CGSize)textSize inRect:(CGRect)boundRect attributes:(NSDictionary *)labelAttrs {
    CGContextSaveGState(context);
    [self translate:context size:textSize];
    
    CGContextSetFillColorWithColor(context, UIColor.greenColor.CGColor);
    CGContextFillRect(context, boundRect);
    
    [self.text drawWithRect:boundRect
                    options:NSStringDrawingUsesLineFragmentOrigin
                 attributes:labelAttrs context:nil];
    
    CGContextRestoreGState(context);
}

-(void)drawTranslateAndRotateText:(CGContextRef)context size:(CGSize)textSize inRect:(CGRect)boundRect attributes:(NSDictionary *)labelAttrs {
    CGContextSaveGState(context);
    
    [self translate:context size:textSize];
    [self rotate:context size:textSize];
    
    CGContextSetFillColorWithColor(context, UIColor.yellowColor.CGColor);
    CGContextFillRect(context, boundRect);
    
    [self.text drawWithRect:boundRect
                    options:NSStringDrawingUsesLineFragmentOrigin
                 attributes:labelAttrs context:nil];
    
    CGContextRestoreGState(context);
}

-(void)drawNormalText:(CGContextRef)context size:(CGSize)textSize inRect:(CGRect)boundRect attributes:(NSDictionary *)labelAttrs {
    CGContextSaveGState(context);
    
    CGContextSetFillColorWithColor(context, UIColor.redColor.CGColor);
    CGContextFillRect(context, boundRect);
    
    [self.text drawWithRect:boundRect
                    options:NSStringDrawingUsesLineFragmentOrigin
                 attributes:labelAttrs context:nil];
    
    CGContextRestoreGState(context);
}

-(void)translate:(CGContextRef)context size:(CGSize)textSize {
    CGContextTranslateCTM(context, textSize.width, textSize.height);
}

-(void)rotate:(CGContextRef)context size:(CGSize)textSize {
    CGContextRotateCTM(context, 90 * M_PI/180.0);
}

@end
