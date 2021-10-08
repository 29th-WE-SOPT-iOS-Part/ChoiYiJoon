//
//  LoginVC.swift
//  29th_Youtube
//
//  Created by Yi Joon Choi on 2021/10/08.
//

import UIKit
import SnapKit

class LoginVC: BaseVC {
    
    var makeAcButton = UIButton()
    var nextButton = UIButton()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainLabelLayout(labelName: "로그인")
        infoLabelLayout(labelName: "YouTube로 이동하며 계속하세요. 앱 및 Safari에서도 Google 서비스에 로그인 합니다.")
        
        self.view.addSubview(makeAcButton)
        self.view.addSubview(nextButton)
        
        makeAcButtonLayout()
        nextButtonLayout()
    }
    
    private func makeAcButtonLayout(){
        makeAcButton.setTitle("계정만들기", for: .normal)
        makeAcButton.setTitleColor(.systemBlue, for: .normal)
        makeAcButton.snp.makeConstraints{ (make) in
            make.width.equalTo(100)
            make.height.equalTo(40)
            make.leading.equalTo(30)
            make.top.equalTo(self.pwTF.snp.bottom).offset(60)
        }
    }
    
    private func nextButtonLayout(){
        nextButton.setTitle("다음", for: .normal)
        nextButton.setTitleColor(.white, for: .normal)
        nextButton.backgroundColor = .systemBlue
        nextButton.layer.cornerRadius = 10
        nextButton.snp.makeConstraints{ (make) in
            make.width.equalTo(70)
            make.height.equalTo(40)
            make.trailing.equalTo(-30)
            make.top.equalTo(self.pwTF.snp.bottom).offset(60)
        }
    }

}
