//
//  WelcomeVC.swift
//  29th_Youtube
//
//  Created by Yi Joon Choi on 2021/10/08.
//

import UIKit

class WelcomeVC: UIViewController {

    var name : String?
    
    var googleImg = UIImageView()
    var welcomeLabel = UILabel()
    var okButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        view.addSubview(googleImg)
        view.addSubview(welcomeLabel)
        view.addSubview(okButton)
        
        googleImgLayout()
        welcomeLabelLayout(labelName: name!)
        okButtonLayout()
    }
    
    private func googleImgLayout(){
        googleImg.image = UIImage(named: "googleImg")
        googleImg.contentMode = .scaleAspectFit
        googleImg.snp.makeConstraints{ (make) in
            make.width.equalTo(160)
            make.height.equalTo(70)
            make.centerX.equalTo(self.view)
            make.top.equalTo(220)
        }
    }
    
    func welcomeLabelLayout(labelName: String){
        welcomeLabel.text = "\(labelName)님\n환영합니다!"
        welcomeLabel.numberOfLines = 0
        welcomeLabel.textAlignment = .center
        welcomeLabel.textColor = .black
        welcomeLabel.font = UIFont.boldSystemFont(ofSize: 27.0)
        welcomeLabel.sizeToFit()
        welcomeLabel.snp.makeConstraints{ (make) in
            make.centerX.equalTo(self.view)
            make.top.equalTo(googleImg.snp.bottom).offset(10)
        }
    }
    
    private func okButtonLayout(){
        okButton.setTitle("확인", for: .normal)
        okButton.setTitleColor(.white, for: .normal)
        okButton.backgroundColor = .googleBlue
        okButton.layer.cornerRadius = 10
        okButton.snp.makeConstraints{ (make) in
            make.centerX.equalTo(self.view)
            make.height.equalTo(40)
            make.trailing.equalTo(-30)
            make.leading.equalTo(30)
            make.top.equalTo(self.welcomeLabel.snp.bottom).offset(60)
        }
        
        okButton.addTarget(self, action: #selector(toDismiss), for: .touchUpInside)
    }
    
    @objc func toDismiss(){
        self.dismiss(animated: true, completion: nil)
    }
    
}
