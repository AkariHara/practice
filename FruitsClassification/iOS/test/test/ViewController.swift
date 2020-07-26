//
//  ViewController.swift
//  test
//
//  Created by 原朱里 on 2019/10/29.
//  Copyright © 2019 AkariHara. All rights reserved.
//

import UIKit

let imagePicker = UIImagePickerController()
let classifier = Classifier()
 
class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var appleIcon: UIImageView!
    @IBOutlet weak var bananaIcon: UIImageView!
    @IBOutlet weak var grapeIcon: UIImageView!
    @IBOutlet weak var cherryIcon: UIImageView!
    @IBOutlet weak var melonIcon: UIImageView!
    @IBOutlet weak var orangeIcon: UIImageView!
    @IBOutlet weak var strawberryIcon: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        resetFruitsIconAppearance()
        imagePicker.delegate = self
        classifier.delegate = self
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func openCamera(_ sender: UIBarButtonItem) {
        openPickerController(with: .camera)
    }
    
    @IBAction func openLibrary(_ sender: UIBarButtonItem) {
        openPickerController(with: .photoLibrary)
    }
    
    func resetFruitsIconAppearance() {
        let alpha: CGFloat = 0.2
        appleIcon.alpha = alpha
        bananaIcon.alpha = alpha
        cherryIcon.alpha = alpha
        grapeIcon.alpha = alpha
        melonIcon.alpha = alpha
        orangeIcon.alpha = alpha
        strawberryIcon.alpha = alpha
        
    }
}

extension ViewController {
    private func openPickerController (with type: UIImagePickerController.SourceType ){
    guard UIImagePickerController.isSourceTypeAvailable(type) else {
    //error
    return
    }
        imagePicker.sourceType = type
        self.present(imagePicker, animated: true, completion: nil)
    }
}
