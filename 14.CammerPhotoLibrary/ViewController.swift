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
        if (UIImagePickerController.isSourceTypeAvailable(.camera)) { // 카메라 사용 가능 여부 확인.
            flagImageSave = true // 카메라 촬영 후 저장할 것이기 때문에 이미지 저장 허용
            
            imagePicker.delegate = self // 이미지 피커의 델리게이트를 self로 설정
            imagePicker.sourceType = .camera // 이미지 피커의 소스 타입을 camera로 설정
            imagePicker.mediaTypes = ["Public.image"] // 미디어 타입은 "public.image"로 설정
            imagePicker.allowsEditing = false // 편집 허용하지 않음
            
            present(imagePicker, animated: true, completion: nil) // 현재 뷰 컨트롤러를 imagePicker로 대체
        }
        else {
            myAlert("Camera inaccessable", message: "Application cannot access the camera.")
            // 카메라를 사용할 수 없을 때 경고 창을 나타냄
        }
    }
    
    @IBAction func btnLoadImageFromLibrary(_ sender: UIButton) {
        if (UIImagePickerController.isSourceTypeAvailable(.photoLibrary)) {
            flagImageSave = false
            
            imagePicker.delegate = self
            imagePicker.sourceType = .photoLibrary
            imagePicker.mediaTypes = ["public.image"]
            imagePicker.allowsEditing = true
            
            present(imagePicker, animated: true, completion: nil)
        }
        else {
            myAlert("Photo album inaccessable", message: "Application cannot access the photo album.")
        }
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

