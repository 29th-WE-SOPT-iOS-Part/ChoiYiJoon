//
//  JoinVC.swift
//  29th_Youtube
//
//  Created by Yi Joon Choi on 2021/10/08.
//

import UIKit
import SnapKit
import Then

class JoinVC: BaseVC {
    
    private let safeButton = UIButton().then{
        $0.tintColor = .googleBlue
        $0.layer.borderColor = UIColor.lightGray.cgColor
        $0.layer.borderWidth = 1
        $0.layer.cornerRadius = 3
        $0.contentMode = .scaleToFill
    }
    
    private let safeLabel = UILabel().then{
        $0.text = "비밀번호 표시"
        $0.textColor = .black
        $0.font = UIFont.systemFont(ofSize: 13.0)
        $0.sizeToFit()
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
        labelLayout(mainName: "회원가입", infoName: "")
        setupAutoLayout()
    }
    
    private func setupAutoLayout(){
        view.addSubviews([safeLabel, safeButton, nextButton])
        
        safeButton.snp.makeConstraints{ (make) in
            make.width.height.equalTo(16)
            make.top.equalTo(pwTF.snp.bottom).offset(17)
            make.leading.equalTo(21)
        }
        
        safeLabel.snp.makeConstraints{ (make) in
            make.centerY.equalTo(safeButton)
            make.top.equalTo(pwTF.snp.bottom).offset(14)
            make.left.equalTo(safeButton.snp.right).offset(11)
        }
        
        nextButton.snp.makeConstraints{ (make) in
            make.centerX.equalToSuperview()
            make.height.equalTo(42)
            make.top.equalTo(safeButton.snp.bottom).offset(31)
            make.leading.trailing.equalToSuperview().inset(22)
        }
        
        safeButton.addTarget(self, action: #selector(toSafe), for: .touchUpInside)
        nextButton.addTarget(self, action: #selector(toWelcome), for: .touchUpInside)
        nameTF.addTarget(self, action: #selector(textFillCheck), for: .editingChanged)
        emailTF.addTarget(self, action: #selector(textFillCheck), for: .editingChanged)
        pwTF.addTarget(self, action: #selector(textFillCheck), for: .editingChanged)
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
    
    @objc func toSafe(){
        safeButton.isSelected = !safeButton.isSelected
        
        if safeButton.isSelected{
            safeButton.setImage(UIImage(systemName: "checkmark.square.fill"), for: .normal)
            pwTF.isSecureTextEntry = false
        }
        else{
            safeButton.setImage(UIImage(systemName: "blank"), for: .normal)
            pwTF.isSecureTextEntry = true
        }
        
    }
    
    @objc func toWelcome(){
        let nextVC = WelcomeVC()
        nextVC.name = nameTF.text
        nextVC.modalPresentationStyle = .fullScreen
        self.present(nextVC, animated: true, completion: nil)
    }
    
}

