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

        let animationLayer = ArcLayer()
        animationLayer.frame = parentView.bounds
        parentView.layer.addSublayer(animationLayer)

        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            animationLayer.animate()
        }
    }
}
