//
//  ViewController.swift
//  photolibrary
//
//  Created by 김동욱 on 2022/02/10.
//
//상세데이터 항목을 구현하기 위해 alertaction과 UIAlertController를 사용해봤으나 화면 구성 3번은 구성하지 못하여 1,2번까지 구현한 것을 첨부드립니다.

import UIKit
import YPImagePicker // UIImagePicker도 적용해봤으나 과제 예시 화면을 가장 비슷하게 구현할 수 있는 라이브러리 이므로 채택하였으며, 버튼을 누르면 바로 앨범이 뜨진 않으나 상단의 Library를 클릭하면 Albums로 넘어갑니다.
import UniformTypeIdentifiers

class ViewController: UIViewController {

    
    @IBOutlet weak var clickedbtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.clickedbtn.layer.cornerRadius = 10
        self.clickedbtn.addTarget(self, action: #selector(golibrary), for: .touchDown)
    }
    
    @objc fileprivate func golibrary(){ //사진첩으로 가는버튼
        
        
        var config = YPImagePickerConfiguration()
        config.screens = [.library]
        config.library.spacingBetweenItems = 4.0 // 사진첩 셀 간격
        config.library.numberOfItemsInRow = 3 // row에 3개씩 나열
        config.showsPhotoFilters = false //라이브러리에서 기본제공되는 필터기능 삭제(사진 선택 후 기능)
        
        
        let picker = YPImagePicker(configuration: config)
        picker.didFinishPicking { [unowned picker] items, _ in
            if let photo = items.singlePhoto {
                
                print(photo.exifMeta) //선택한 데이타의 metada 을 json으로 출력
               
           //     let alert = UIAlertController(title: "파일명", message:" \(photo.exifMeta)", preferredStyle: UIAlertController.Style.alert)
            //    let onAction = UIAlertAction(title: "확인", style: UIAlertAction.Style.default, handler: nil)
            //    alert.addAction(onAction)
            //    self.present(alert, animated: true, completion: nil)
            }
            picker.dismiss(animated: true, completion: nil) //사진첩이 사라지고 시작화면으로

        }
        present(picker, animated: true, completion: nil)
    }

}

