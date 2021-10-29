//
//  ChannelCVC.swift
//  29th_Youtube
//
//  Created by Yi Joon Choi on 2021/10/29.
//

import UIKit

class ChannelCVC: UICollectionViewCell {

    @IBOutlet weak var channelIcon: UIImageView!
    @IBOutlet weak var channelName: UILabel!
    
    static let identifier = "ChannelCVC"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        channelName.sizeToFit()
    }
    
    func setData(channelData: ChannelData) {
        channelIcon.image = channelData.makeImage()
        channelName.text = channelData.channelName
    }

}
