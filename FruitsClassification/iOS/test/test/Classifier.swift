//
//  Classifier.swift
//  test
//
//  Created by 原朱里 on 2019/10/30.
//  Copyright © 2019 AkariHara. All rights reserved.
//

import UIKit

class Classifier {
    
    weak var delegate: ClassifierDelegate?
    let model = fruits_classfier()
    
    deinit {
        delegate = nil
    }
    
    func classify(image: UIImage) {
        // modelのinputと同じ数値をdimentionに入れる
        guard let buffer = image.getCVPixelBuffer(size: CGSize(width: 100, height: 100)) else {
            return
        }
        DispatchQueue.global(qos: .userInteractive).async {
            guard let output = try? self.model.prediction(image: buffer) else {
                return
            }
            DispatchQueue.main.async {
                let label = output.classLabel
                self.delegate?.didClassify(with: label)
            }
        }
    }
    
}
