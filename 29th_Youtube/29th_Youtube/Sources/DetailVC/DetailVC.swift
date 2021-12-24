//
//  DetailVC.swift
//  29th_Youtube
//
//  Created by Yi Joon Choi on 2021/12/24.
//

import UIKit

class DetailVC: UIViewController {

    @IBOutlet weak var thumbnail: UIImageView!
    @IBOutlet weak var videoTitle: UILabel!
    @IBOutlet weak var videoDescription: UILabel!
    
    var contentList : ContentData?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    private func setUI() {
        thumbnail.image = UIImage(named: contentList?.thumnbnail ?? "")
        videoTitle.text = contentList?.contentTitle
        videoDescription.text = contentList?.description
    }

}
