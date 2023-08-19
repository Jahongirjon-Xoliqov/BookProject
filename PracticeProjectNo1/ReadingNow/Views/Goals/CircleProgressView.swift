//
//  CircleProgressView.swift
//  PracticeProjectNo1
//
//  Created by Dzakhon on 20/08/23.
//

import UIKit

class CircleProgressView: UIView {
    
    var pathLayer = CAShapeLayer()
    var progressLayer = CAShapeLayer()
    var progressPath = UIBezierPath()
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        pathLayer.fillColor = nil
        pathLayer.strokeColor = UIColor.systemGray5.cgColor
        pathLayer.lineWidth = 10
        pathLayer.lineCap = .round
        pathLayer.strokeEnd = 1
        
        progressLayer.fillColor = nil
        progressLayer.strokeColor = UIColor.systemGray.cgColor
        progressLayer.lineWidth = 10
        progressLayer.lineCap = .round
        progressLayer.strokeEnd = 0.2
        
        progressPath = UIBezierPath(arcCenter: CGPoint(x: rect.midX, y: rect.maxY-5),
                                    radius: rect.width/2-5,
                                    startAngle: CGFloat.pi,
                                    endAngle: 0,
                                    clockwise: true)
        
        pathLayer.path = progressPath.cgPath
        progressLayer.path = progressPath.cgPath
        
        layer.addSublayer(pathLayer)
        layer.addSublayer(progressLayer)
        layer.mask = pathLayer
    }
    
}
