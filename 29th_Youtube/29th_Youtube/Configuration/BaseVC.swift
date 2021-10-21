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
    
    var mainLabel = UILabel()
    var infoLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setNavigation()
        setupAutoLayout()
    }

    private func setNavigation(){
        self.navigationController?.navigationBar.isHidden = true
    }
    
    let googleImg = UIImageView().then{
        $0.image = UIImage(named: "googleImg")
        $0.contentMode = .scaleAspectFit
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
    
    func mainLabelLayout(labelName: String){
        mainLabel.text = labelName
        mainLabel.textColor = .black
        mainLabel.font = UIFont.boldSystemFont(ofSize: 27.0)
        mainLabel.sizeToFit()
    }
    
    func infoLabelLayout(labelName: String){
        infoLabel.text = labelName
        infoLabel.textColor = .lightGray
        infoLabel.font = UIFont.systemFont(ofSize: 15.0)
        infoLabel.sizeToFit()
        infoLabel.lineBreakMode = .byWordWrapping
        infoLabel.numberOfLines = 2
        infoLabel.textAlignment = .center
    }
    
    private func setupAutoLayout(){
        view.addSubviews([googleImg, mainLabel, infoLabel, nameTF, emailTF, pwTF])
        
        googleImg.snp.makeConstraints{ (make) in
            make.width.equalTo(160)
            make.height.equalTo(70)
            make.centerX.equalToSuperview()
            make.top.equalTo(70)
        }
        
        mainLabel.snp.makeConstraints{ (make) in
            make.centerX.equalToSuperview()
            make.top.equalTo(googleImg.snp.bottom).offset(10)
        }
        
        infoLabel.snp.makeConstraints{ (make) in
            make.centerX.equalToSuperview()
            make.top.equalTo(mainLabel.snp.bottom).offset(35)
            make.leading.equalTo(10)
            make.trailing.equalTo(-10)
        }
        
        nameTF.snp.makeConstraints{ (make) in
            make.centerX.equalToSuperview()
            make.height.equalTo(50)
            make.top.equalTo(infoLabel.snp.bottom).offset(35)
            make.leading.equalTo(30)
            make.trailing.equalTo(-30)
        }
        
        emailTF.snp.makeConstraints{ (make) in
            make.centerX.equalToSuperview()
            make.height.equalTo(50)
            make.top.equalTo(nameTF.snp.bottom).offset(15)
            make.leading.equalTo(30)
            make.trailing.equalTo(-30)
        }
        
        pwTF.snp.makeConstraints{ (make) in
            make.centerX.equalToSuperview()
            make.height.equalTo(50)
            make.top.equalTo(emailTF.snp.bottom).offset(15)
            make.leading.equalTo(30)
            make.trailing.equalTo(-30)
        }
    }
    
    
}
