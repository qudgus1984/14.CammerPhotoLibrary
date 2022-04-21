//
//  ViewController.swift
//  14.CammerPhotoLibrary
//
//  Created by 이병현 on 2022/04/20.
//

import UIKit
import MobileCoreServices

class ViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    @IBOutlet var imgView: UIImageView!
    
    let imagePicker: UIImagePickerController = UIImagePickerController() // UIImamge..의 인스턴스 변수 생성
    var captureImage: UIImage! // 촬영을 하거나 포토 라이브러리에서 불러온 사진을 저장할 변수
    var videoURL: URL! // 녹화한 비디오의 URL을 저장할 변수
    var flagImageSave = false // 이미지 저장 여부를 나타낼 변수
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func btnCaptureImageFromCamera(_ sender: UIButton) {
    }
    @IBAction func btnLoadImageFromLibrary(_ sender: UIButton) {
    }
    @IBAction func btnRecordVideoFromCamera(_ sender: UIButton) {
    }
    @IBAction func btnLoadVideoFromLibrary(_ sender: UIButton) {
    }
    
    func myAlert(_ title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let action = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }

}

