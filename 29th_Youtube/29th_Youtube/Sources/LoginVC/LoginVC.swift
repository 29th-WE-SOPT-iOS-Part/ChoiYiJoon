//
//  LoginVC.swift
//  29th_Youtube
//
//  Created by Yi Joon Choi on 2021/10/08.
//

import UIKit
import SnapKit
import Then

class LoginVC: BaseVC {
    
    private let makeAcButton = UIButton().then{
        $0.setTitle("계정만들기", for: .normal)
        $0.setTitleColor(.googleBlue, for: .normal)
    }
    
    private let nextButton = UIButton().then{
        $0.setTitle("다음", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.backgroundColor = .lightGray
        $0.layer.cornerRadius = 10
        $0.isUserInteractionEnabled = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainLabelLayout(labelName: "로그인")
        infoLabelLayout(labelName: "YouTube로 이동하며 계속하세요. 앱 및 Safari에서도 Google 서비스에 로그인 합니다.")
        setupAutoLayout()
    }
    
    @objc func toJoin(){
        let nextVC = JoinVC()
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
    
    @objc func toWelcome(){
        let nextVC = WelcomeVC()
        nextVC.name = nameTF.text
        nextVC.modalPresentationStyle = .fullScreen
        self.present(nextVC, animated: true, completion: nil)
    }
    
    @objc func textFillCheck(){
        if nameTF.hasText && emailTF.hasText && pwTF.hasText{
            nextButton.backgroundColor = .googleBlue
            nextButton.isUserInteractionEnabled = true
        }
        else{
            nextButton.backgroundColor = .lightGray
            nextButton.isUserInteractionEnabled = false
        }
    }

    private func setupAutoLayout(){
        view.addSubviews([makeAcButton, nextButton])
        
        makeAcButton.snp.makeConstraints{ (make) in
            make.width.equalTo(100)
            make.height.equalTo(40)
            make.leading.equalTo(30)
            make.top.equalTo(self.pwTF.snp.bottom).offset(60)
        }
        makeAcButton.addTarget(self, action: #selector(toJoin), for: .touchUpInside)
        
        nextButton.snp.makeConstraints{ (make) in
            make.width.equalTo(70)
            make.height.equalTo(40)
            make.trailing.equalTo(-30)
            make.top.equalTo(self.pwTF.snp.bottom).offset(60)
        }
        nextButton.addTarget(self, action: #selector(toWelcome), for: .touchUpInside)
        
        nameTF.addTarget(self, action: #selector(textFillCheck), for: .editingChanged)
        emailTF.addTarget(self, action: #selector(textFillCheck), for: .editingChanged)
        pwTF.addTarget(self, action: #selector(textFillCheck), for: .editingChanged)
    }
}
