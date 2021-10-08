//
//  BaseVC.swift
//  29th_Youtube
//
//  Created by Yi Joon Choi on 2021/10/08.
//

import UIKit

class BaseVC: UIViewController {
    
    var googleImg = UIImageView()
    var mainLabel = UILabel()
    var infoLabel = UILabel()
    
    var nameTF = UITextField()
    var emailTF = UITextField()
    var pwTF = UITextField()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setNavigation()
        
        view.addSubview(googleImg)
        view.addSubview(mainLabel)
        view.addSubview(infoLabel)
        view.addSubview(nameTF)
        view.addSubview(emailTF)
        view.addSubview(pwTF)
        
        googleImgLayout()
        nameTFLayout()
        emailTFLayout()
        pwTFLayout()
    }

    private func setNavigation(){
        self.navigationController?.navigationBar.isHidden = true
    }
    
    private func googleImgLayout(){
        googleImg.image = UIImage(named: "googleImg")
        googleImg.contentMode = .scaleAspectFit
        googleImg.snp.makeConstraints{ (make) in
            make.width.equalTo(160)
            make.height.equalTo(70)
            make.centerX.equalTo(self.view)
            make.top.equalTo(70)
        }
    }
    
    func mainLabelLayout(labelName: String){
        mainLabel.text = labelName
        mainLabel.textColor = .black
        mainLabel.font = UIFont.boldSystemFont(ofSize: 27.0)
        mainLabel.sizeToFit()
        mainLabel.snp.makeConstraints{ (make) in
            make.centerX.equalTo(self.view)
            make.top.equalTo(googleImg.snp.bottom).offset(10)
        }
    }
    
    func infoLabelLayout(labelName: String){
        infoLabel.text = labelName
        infoLabel.textColor = .lightGray
        infoLabel.font = UIFont.systemFont(ofSize: 15.0)
        infoLabel.sizeToFit()
        infoLabel.lineBreakMode = .byWordWrapping
        infoLabel.numberOfLines = 2
        infoLabel.textAlignment = .center
        infoLabel.snp.makeConstraints{ (make) in
            make.centerX.equalTo(self.view)
            make.top.equalTo(mainLabel.snp.bottom).offset(35)
            make.trailing.equalTo(-10)
            make.leading.equalTo(10)
        }
    }
    
    func nameTFLayout(){
        nameTF.placeholder = "이름을 입력해주세요"
        nameTF.borderStyle = .roundedRect
        nameTF.autocorrectionType = .no
        nameTF.snp.makeConstraints{ (make) in
            make.centerX.equalTo(self.view)
            make.height.equalTo(50)
            make.top.equalTo(infoLabel.snp.bottom).offset(35)
            make.trailing.equalTo(-30)
            make.leading.equalTo(30)
        }
    }
    
    func emailTFLayout(){
        emailTF.placeholder = "이메일 또는 휴대전화"
        emailTF.borderStyle = .roundedRect
        emailTF.autocorrectionType = .no
        emailTF.snp.makeConstraints{ (make) in
            make.centerX.equalTo(self.view)
            make.height.equalTo(50)
            make.top.equalTo(nameTF.snp.bottom).offset(15)
            make.trailing.equalTo(-30)
            make.leading.equalTo(30)
        }
    }
    
    func pwTFLayout(){
        pwTF.placeholder = "비밀번호 입력"
        pwTF.borderStyle = .roundedRect
        pwTF.isSecureTextEntry = true
        pwTF.autocorrectionType = .no
        pwTF.snp.makeConstraints{ (make) in
            make.centerX.equalTo(self.view)
            make.height.equalTo(50)
            make.top.equalTo(emailTF.snp.bottom).offset(15)
            make.trailing.equalTo(-30)
            make.leading.equalTo(30)
        }
    }
}
