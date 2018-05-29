//
//  ViewController.swift
//  WaterAnimationSample
//
//  Created by Daiki Shimizu on 2018/05/29.
//  Copyright © 2018年 Daiki Shimizu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let animationLayer = ArcLayer()
        animationLayer.frame = CGRect(x: 10, y: 50, width: 300, height: 300)
        view.layer.addSublayer(animationLayer)

        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            animationLayer.animate()
        }
    }

    
}

