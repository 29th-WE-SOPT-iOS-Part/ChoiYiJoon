//
//  BaseVC.swift
//  29th_Youtube
//
//  Created by Yi Joon Choi on 2021/10/08.
//

import UIKit
import SnapKit
import Then

class BaseVC: UIViewController {
    
    private let googleImg = UIImageView().then{
        $0.image = UIImage(named: "googleImg")
        $0.contentMode = .scaleAspectFit
    }
    
    let mainLabel = UILabel().then{
        $0.textColor = .black
        $0.font = UIFont.boldSystemFont(ofSize: 22.0)
        $0.sizeToFit()
    }
    
    let infoLabel = UILabel().then{
        $0.textColor = .black
        $0.font = UIFont.systemFont(ofSize: 14.0)
        $0.lineBreakMode = .byWordWrapping
        $0.numberOfLines = 2
        $0.textAlignment = .center
        $0.sizeToFit()
    }
    
    let nameTF = UITextField().then{
        $0.placeholder = "이름을 입력해주세요"
        $0.borderStyle = .roundedRect
        $0.autocorrectionType = .no
    }
    
    let emailTF = UITextField().then{
        $0.placeholder = "이메일 또는 휴대전화"
        $0.borderStyle = .roundedRect
        $0.autocorrectionType = .no
    }
    
    let pwTF = UITextField().then{
        $0.placeholder = "비밀번호 입력"
        $0.borderStyle = .roundedRect
        $0.isSecureTextEntry = true
        $0.autocorrectionType = .no
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setNavigation()
        setupAutoLayout()
    }

    private func setNavigation(){
        self.navigationController?.navigationBar.isHidden = true
    }

    private func setupAutoLayout(){
        view.addSubviews([googleImg, mainLabel, infoLabel, nameTF, emailTF, pwTF])
        
        googleImg.snp.makeConstraints{ (make) in
            make.width.equalTo(118)
            make.height.equalTo(40)
            make.centerX.equalToSuperview()
            make.top.equalTo(110)
        }
        
        mainLabel.snp.makeConstraints{ (make) in
            make.centerX.equalToSuperview()
            make.top.equalTo(googleImg.snp.bottom).offset(23)
        }
        
        infoLabel.snp.makeConstraints{ (make) in
            make.centerX.equalToSuperview()
            make.top.equalTo(mainLabel.snp.bottom).offset(14)
            make.leading.trailing.equalToSuperview().inset(44)
        }
        
        nameTF.snp.makeConstraints{ (make) in
            make.centerX.equalToSuperview()
            make.height.equalTo(48)
            make.top.equalTo(infoLabel.snp.bottom).offset(68)
            make.leading.trailing.equalToSuperview().inset(22)
        }
        
        emailTF.snp.makeConstraints{ (make) in
            make.centerX.equalToSuperview()
            make.height.equalTo(48)
            make.top.equalTo(nameTF.snp.bottom).offset(17)
            make.leading.trailing.equalToSuperview().inset(22)
        }
        
        pwTF.snp.makeConstraints{ (make) in
            make.centerX.equalToSuperview()
            make.height.equalTo(48)
            make.top.equalTo(emailTF.snp.bottom).offset(17)
            make.leading.trailing.equalToSuperview().inset(22)
        }
    }
    
    func labelLayout(mainName: String, infoName: String){
        mainLabel.text = mainName
        infoLabel.text = infoName
    }
    
}
