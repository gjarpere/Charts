//
//  LineScatterCandleRadarChartRenderer.swift
//  Charts
//
//  Created by Daniel Cohen Gindi on 29/7/15.
//
//  Copyright 2015 Daniel Cohen Gindi & Philipp Jahoda
//  A port of MPAndroidChart for iOS
//  Licensed under Apache License 2.0
//
//  https://github.com/danielgindi/Charts
//

import Foundation
import CoreGraphics


public class LineScatterCandleRadarChartRenderer: ChartDataRendererBase
{
    public override init(animator: ChartAnimator?, viewPortHandler: ChartViewPortHandler)
    {
        super.init(animator: animator, viewPortHandler: viewPortHandler)
    }
    
    /// Draws vertical & horizontal highlight-lines if enabled.
    /// :param: context
    /// :param: points
    /// :param: horizontal
    /// :param: vertical
    public func drawHighlightLines(context context: CGContext, point: CGPoint, set: ILineScatterCandleRadarChartDataSet)
    {
        // draw vertical highlight lines
        if set.isVerticalHighlightIndicatorEnabled
        {
            let center = CGPointMake(point.x, viewPortHandler.contentTop + 4.5)
            let radius = 4 as CGFloat
            let startAngle = -(CGFloat(M_PI) / 2) as CGFloat
            let endAngle = (2 * CGFloat(M_PI)) + startAngle as CGFloat
            CGContextAddArc(context, center.x, center.y, radius, startAngle, endAngle, 0)
            CGContextStrokePath(context);
            CGContextBeginPath(context)
            CGContextMoveToPoint(context, point.x, viewPortHandler.contentTop + 9)
            CGContextAddLineToPoint(context, point.x, viewPortHandler.contentBottom)
            CGContextStrokePath(context)
        }
        
        // draw horizontal highlight lines
        if set.isHorizontalHighlightIndicatorEnabled
        {
            CGContextBeginPath(context)
            CGContextMoveToPoint(context, viewPortHandler.contentLeft, point.y)
            CGContextAddLineToPoint(context, viewPortHandler.contentRight, point.y)
            CGContextStrokePath(context)
        }
    }
}