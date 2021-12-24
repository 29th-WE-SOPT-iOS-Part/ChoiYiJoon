//
//  ContentTVC.swift
//  29th_Youtube
//
//  Created by Yi Joon Choi on 2021/10/30.
//

import UIKit

class ContentTVC: UITableViewCell {

    @IBOutlet weak var thumbnail: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var descriptions: UILabel!
    
    static let identifier = "ContentTVC"
    
    var presentToDetailViewController: (() -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUI()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func setUI(){
        descriptions.text = "WE SOPT : 조회수 100만회 : 3주 전"
        descriptions.textColor = .darkGray
        let tapGesture: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
        tapGesture.delegate = self

        thumbnail.isUserInteractionEnabled = true
        thumbnail.addGestureRecognizer(tapGesture)
    }
    
    func setData(contentData: ContentData) {
        thumbnail.image = contentData.makeImage()
        title.text = contentData.contentTitle
    }
                                                                        
    @objc func handleTap(_ sender: UITapGestureRecognizer? = nil) {
        presentToDetailViewController?()
    }
                                                                    
}

