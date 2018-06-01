//
//  ViewController.swift
//  WaterAnimationSample
//
//  Created by Daiki Shimizu on 2018/05/29.
//  Copyright © 2018年 Daiki Shimizu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet private weak var parentView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()

        let maskLayer = CAShapeLayer()
        let bottlePath = UIBezierPath()

        // left, bottom, right
        bottlePath.move(to: CGPoint(x: 0.0, y: 150.0))
        bottlePath.addLine(to: CGPoint(x: 0.0, y: parentView.bounds.height - 40.0))
        bottlePath.addQuadCurve(to: CGPoint(x: 40.0, y: parentView.bounds.height),
                                controlPoint: CGPoint(x: 0.0, y: parentView.bounds.height))
        bottlePath.addLine(to: CGPoint(x: parentView.bounds.width - 40.0, y: parentView.bounds.height))
        bottlePath.addQuadCurve(to: CGPoint(x: parentView.bounds.width, y: parentView.bounds.height - 40.0),
                                controlPoint: CGPoint(x: parentView.bounds.width, y: parentView.bounds.height))
        bottlePath.addLine(to: CGPoint(x: parentView.bounds.width, y: 150.0))

        // top
        bottlePath.addQuadCurve(to: CGPoint(x: parentView.bounds.width * 0.65, y: 50.0),
                                controlPoint: CGPoint(x: parentView.bounds.width, y: 100.0))
        bottlePath.addLine(to: CGPoint(x: parentView.bounds.width * 0.65, y: 20.0))
        bottlePath.addQuadCurve(to: CGPoint(x: parentView.bounds.width * 0.65 - 20.0, y: 0.0),
                                controlPoint: CGPoint(x: parentView.bounds.width * 0.65, y: 0.0))
        bottlePath.addLine(to: CGPoint(x: parentView.bounds.width * 0.35 + 20.0, y: 0.0))
        bottlePath.addQuadCurve(to: CGPoint(x: parentView.bounds.width * 0.35, y: 20.0),
                                controlPoint: CGPoint(x: parentView.bounds.width * 0.35, y: 0.0))
        bottlePath.addLine(to: CGPoint(x: parentView.bounds.width * 0.35, y: 50.0))
        bottlePath.addQuadCurve(to: CGPoint(x: 0.0, y: 150.0),
                                controlPoint: CGPoint(x: 0.0, y: 100.0))

        maskLayer.path = bottlePath.cgPath

        let animationLayer = ArcLayer()
        animationLayer.frame = parentView.bounds
        animationLayer.mask = maskLayer
        parentView.layer.addSublayer(animationLayer)

        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            animationLayer.animate()
        }
    }
}
