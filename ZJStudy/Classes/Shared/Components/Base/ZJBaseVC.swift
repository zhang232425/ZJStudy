//
//  ZJBaseVC.swift
//  ZJStudy
//
//  Created by Jercan on 2024/3/6.
//

import UIKit
import RxSwift
import RxCocoa
import RxSwiftExt
import Then
import SnapKit
import ZJExtension

class ZJBaseVC: UIViewController {
    
    let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        config()
    }
    
}

private extension ZJBaseVC {
    
    func config() {
        view.backgroundColor = .white
    }
    
}
