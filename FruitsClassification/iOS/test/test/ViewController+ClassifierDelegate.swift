//
//  ViewController+ClassifierDelegate.swift
//  test
//
//  Created by 原朱里 on 2019/10/30.
//  Copyright © 2019 AkariHara. All rights reserved.
//

import UIKit

extension ViewController: ClassifierDelegate {
    
    func didClassify(with identifier: String) {
        switch identifier {
        case "apple": setPredictedIconAppearance(icon: appleIcon)
        case "banana": setPredictedIconAppearance(icon: bananaIcon)
        case "cherry": setPredictedIconAppearance(icon: cherryIcon)
        case "grape": setPredictedIconAppearance(icon: grapeIcon)
        case "melon": setPredictedIconAppearance(icon: melonIcon)
        case "orange": setPredictedIconAppearance(icon: orangeIcon)
        case "strawberry": setPredictedIconAppearance(icon: strawberryIcon)
        default: resetFruitsIconAppearance()
        }
    }
    
    private func setPredictedIconAppearance(icon: UIImageView) {
        let transform = icon.transform
        UIView.animate(
            withDuration: 0.3,
            delay: 0,
            options: .curveEaseInOut,
            animations: {
                icon.alpha = 1
                icon.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
        }) { (finished) in
            UIView.animate(
                withDuration: 0.3,
                delay: 0,
                options: .curveEaseInOut,
                animations: {
                    icon.transform = transform
            })
        }
    }
    
}
