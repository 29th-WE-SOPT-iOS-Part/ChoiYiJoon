//
//  WelcomeVC.swift
//  29th_Youtube
//
//  Created by Yi Joon Choi on 2021/10/08.
//

import UIKit
import SnapKit
import Then

class WelcomeVC: UIViewController {

    var name : String?
    
    private let googleImg = UIImageView().then{
        $0.image = UIImage(named: "googleImg")
        $0.contentMode = .scaleAspectFit
    }
    
    private let welcomeLabel = UILabel().then{
        $0.numberOfLines = 0
        $0.textAlignment = .center
        $0.textColor = .black
        $0.font = UIFont.boldSystemFont(ofSize: 27.0)
        $0.sizeToFit()
    }
    
    private let okButton = UIButton().then{
        $0.setTitle("확인", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.backgroundColor = .googleBlue
        $0.layer.cornerRadius = 10
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        welcomeLabelLayout(labelName: name!)
        setupAutoLayout()
    }
    
    private func setupAutoLayout(){
        view.addSubviews([googleImg, welcomeLabel, okButton])
        
        googleImg.snp.makeConstraints{ (make) in
            make.width.equalTo(160)
            make.height.equalTo(70)
            make.centerX.equalTo(self.view)
            make.top.equalTo(220)
        }
        
        welcomeLabel.snp.makeConstraints{ (make) in
            make.centerX.equalTo(self.view)
            make.top.equalTo(googleImg.snp.bottom).offset(10)
        }
        
        okButton.snp.makeConstraints{ (make) in
            make.centerX.equalTo(self.view)
            make.height.equalTo(40)
            make.top.equalTo(self.welcomeLabel.snp.bottom).offset(60)
            make.leading.trailing.equalToSuperview().inset(30)
        }
        okButton.addTarget(self, action: #selector(toDismiss), for: .touchUpInside)
    }
    
    func welcomeLabelLayout(labelName: String){
        welcomeLabel.text = "\(labelName)님\n환영합니다!"
    }
    
    @objc func toDismiss(){
        self.dismiss(animated: true, completion: nil)
    }
    
}
