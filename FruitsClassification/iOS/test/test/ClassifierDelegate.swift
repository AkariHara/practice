//
//  ClassifierDelegate.swift
//  test
//
//  Created by 原朱里 on 2019/10/30.
//  Copyright © 2019 AkariHara. All rights reserved.
//

import Foundation

protocol ClassifierDelegate: class {
    func didClassify(with identifier: String)
}
