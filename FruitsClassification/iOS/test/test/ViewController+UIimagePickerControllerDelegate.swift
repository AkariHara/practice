//
//  ViewController+UIimagePickerControllerDelegate.swift
//  test
//
//  Created by 原朱里 on 2019/10/29.
//  Copyright © 2019 AkariHara. All rights reserved.
//

import UIKit

extension ViewController {
    
    /**
     画像を選択した直後に呼ばれる
     */
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        // pickerを閉じる
        picker.dismiss(animated: true, completion: nil)
        guard let image = info[.originalImage] as? UIImage else {
               fatalError()
           }
        // 選択した画像を表示
        photoImageView.image = image
        // 果物アイコンをリセット
        resetFruitsIconAppearance()
        // 分類を行う
        classifier.classify(image: image)
    }
    
    /**
     画像選択をキャンセルした直後に呼ばれる
     */
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
}
