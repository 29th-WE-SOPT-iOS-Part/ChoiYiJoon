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
        
        nameTF.addTarget(self, action: #selector(textFillCheck), for: .editingChanged)
        emailTF.addTarget(self, action: #selector(textFillCheck), for: .editingChanged)
        pwTF.addTarget(self, action: #selector(textFillCheck), for: .editingChanged)
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
        if nameTF.text == "" || emailTF.text == "" || pwTF.text == ""{
            print("empty")
            nextButton.backgroundColor = .lightGray
            nextButton.isUserInteractionEnabled = false
        }
        else{
            print("not empty")
            nextButton.backgroundColor = .googleBlue
            nextButton.isUserInteractionEnabled = true
        }
    }
    
    private func makeAcButtonLayout(){
        makeAcButton.setTitle("계정만들기", for: .normal)
        makeAcButton.setTitleColor(.googleBlue, for: .normal)
        makeAcButton.snp.makeConstraints{ (make) in
            make.width.equalTo(100)
            make.height.equalTo(40)
            make.leading.equalTo(30)
            make.top.equalTo(self.pwTF.snp.bottom).offset(60)
        }
        makeAcButton.addTarget(self, action: #selector(toJoin), for: .touchUpInside)
    }
    
    private func nextButtonLayout(){
        nextButton.setTitle("다음", for: .normal)
        nextButton.setTitleColor(.white, for: .normal)
        nextButton.backgroundColor = .lightGray
        nextButton.layer.cornerRadius = 10
        nextButton.isUserInteractionEnabled = false
        nextButton.snp.makeConstraints{ (make) in
            make.width.equalTo(70)
            make.height.equalTo(40)
            make.trailing.equalTo(-30)
            make.top.equalTo(self.pwTF.snp.bottom).offset(60)
        }
        nextButton.addTarget(self, action: #selector(toWelcome), for: .touchUpInside)
    }

}
