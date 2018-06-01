//
//  ArcLayer.swift
//  WaterAnimationSample
//
//  Created by Daiki Shimizu on 2018/05/29.
//  Copyright © 2018年 Daiki Shimizu. All rights reserved.
//

import UIKit

class ArcLayer: CAShapeLayer {
  
    let animationDuration: CFTimeInterval = 0.18
  
    override init() {
        super.init()

        fillColor = UIColor.blue.cgColor
    }
  
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    var arcPathPre: UIBezierPath {
        let arcPath = UIBezierPath()
        arcPath.move(to: CGPoint(x: 0.0, y: bounds.height))
        arcPath.addLine(to: CGPoint(x: 0.0, y: bounds.height - 1.0))
        arcPath.addLine(to: CGPoint(x: bounds.width, y: bounds.height - 1.0))
        arcPath.addLine(to: CGPoint(x: bounds.width, y: bounds.height))
        arcPath.close()
        return arcPath
    }

    var arcPathStarting: UIBezierPath {
        let arcPath = UIBezierPath()
        arcPath.move(to: CGPoint(x: 0.0, y: bounds.height))
        arcPath.addLine(to: CGPoint(x: 0.0, y: bounds.height * 0.8))
        arcPath.addCurve(to: CGPoint(x: bounds.width, y: bounds.height * 0.8),
                         controlPoint1: CGPoint(x: bounds.width * 0.3, y: bounds.height * 0.7),
                         controlPoint2: CGPoint(x: bounds.width * 0.4, y: bounds.height * 0.9))
        arcPath.addLine(to: CGPoint(x: bounds.width, y: bounds.height))
        arcPath.close()
        return arcPath
    }

    var arcPathLow: UIBezierPath {
        let arcPath = UIBezierPath()
        arcPath.move(to: CGPoint(x: 0.0, y: bounds.height))
        arcPath.addLine(to: CGPoint(x: 0.0, y: bounds.height * 0.6))
        arcPath.addCurve(to: CGPoint(x: bounds.width, y: bounds.height * 0.6),
                         controlPoint1: CGPoint(x: bounds.width * 0.3, y: bounds.width * 0.65),
                         controlPoint2: CGPoint(x: bounds.width * 0.4, y: bounds.height * 0.5))
        arcPath.addLine(to: CGPoint(x: bounds.width, y: bounds.height))
        arcPath.close()
        return arcPath
    }

    var arcPathMid: UIBezierPath {
        let arcPath = UIBezierPath()
        arcPath.move(to: CGPoint(x: 0.0, y: bounds.height))
        arcPath.addLine(to: CGPoint(x: 0.0, y: bounds.height * 0.4))
        arcPath.addCurve(to: CGPoint(x: bounds.width, y: bounds.height * 0.4),
                         controlPoint1: CGPoint(x: bounds.width * 0.3, y: bounds.height * 0.3),
                         controlPoint2: CGPoint(x: bounds.width * 0.4, y: bounds.height * 0.5))
        arcPath.addLine(to: CGPoint(x: bounds.width, y: bounds.height))
        arcPath.close()
        return arcPath
    }

    var arcPathHigh: UIBezierPath {
        let arcPath = UIBezierPath()
        arcPath.move(to: CGPoint(x: 0.0, y: bounds.height))
        arcPath.addLine(to: CGPoint(x: 0.0, y: bounds.height * 0.2))
        arcPath.addCurve(to: CGPoint(x: bounds.width, y: bounds.height * 0.2),
                         controlPoint1: CGPoint(x: bounds.width * 0.3, y: bounds.height * 0.25),
                         controlPoint2: CGPoint(x: bounds.width * 0.4, y: bounds.height * 0.1))
        arcPath.addLine(to: CGPoint(x: bounds.width, y: bounds.height))
        arcPath.close()
        return arcPath
    }

    var arcPathComplete: UIBezierPath {
        let arcPath = UIBezierPath()
        arcPath.move(to: CGPoint(x: 0.0, y: bounds.height))
        arcPath.addLine(to: CGPoint(x: 0.0, y: 0.0))
        arcPath.addLine(to: CGPoint(x: bounds.width, y: 0.0))
        arcPath.addLine(to: CGPoint(x: bounds.width, y: bounds.height))
        arcPath.close()
        return arcPath
    }
  
    func animate() {
        let arcAnimationPre: CABasicAnimation = CABasicAnimation(keyPath: "path")
        arcAnimationPre.fromValue = arcPathPre.cgPath
        arcAnimationPre.toValue = arcPathStarting.cgPath
        arcAnimationPre.beginTime = 0.0
        arcAnimationPre.duration = animationDuration

        let arcAnimationLow: CABasicAnimation = CABasicAnimation(keyPath: "path")
        arcAnimationLow.fromValue = arcPathStarting.cgPath
        arcAnimationLow.toValue = arcPathLow.cgPath
        arcAnimationLow.beginTime = arcAnimationPre.beginTime + arcAnimationPre.duration
        arcAnimationLow.duration = animationDuration

        let arcAnimationMid: CABasicAnimation = CABasicAnimation(keyPath: "path")
        arcAnimationMid.fromValue = arcPathLow.cgPath
        arcAnimationMid.toValue = arcPathMid.cgPath
        arcAnimationMid.beginTime = arcAnimationLow.beginTime + arcAnimationLow.duration
        arcAnimationMid.duration = animationDuration

        let arcAnimationHigh: CABasicAnimation = CABasicAnimation(keyPath: "path")
        arcAnimationHigh.fromValue = arcPathMid.cgPath
        arcAnimationHigh.toValue = arcPathHigh.cgPath
        arcAnimationHigh.beginTime = arcAnimationMid.beginTime + arcAnimationMid.duration
        arcAnimationHigh.duration = animationDuration

        let arcAnimationComplete: CABasicAnimation = CABasicAnimation(keyPath: "path")
        arcAnimationComplete.fromValue = arcPathHigh.cgPath
        arcAnimationComplete.toValue = arcPathComplete.cgPath
        arcAnimationComplete.beginTime = arcAnimationHigh.beginTime + arcAnimationHigh.duration
        arcAnimationComplete.duration = animationDuration

        let arcAnimationGroup: CAAnimationGroup = CAAnimationGroup()
        arcAnimationGroup.animations = [
            arcAnimationPre,
            arcAnimationLow,
            arcAnimationMid,
            arcAnimationHigh,
            arcAnimationComplete
        ]
        arcAnimationGroup.duration = arcAnimationComplete.beginTime + arcAnimationComplete.duration
        arcAnimationGroup.fillMode = kCAFillModeForwards
        arcAnimationGroup.isRemovedOnCompletion = false
        add(arcAnimationGroup, forKey: nil)
    }
}

