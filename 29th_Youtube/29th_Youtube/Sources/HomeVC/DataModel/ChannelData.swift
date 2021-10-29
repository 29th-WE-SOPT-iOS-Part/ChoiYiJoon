//
//  AppContentData.swift
//  29th_Youtube
//
//  Created by Yi Joon Choi on 2021/10/29.
//

import Foundation
import UIKit

struct ChannelData{
    let channelName: String
    let channelIcon: String
    
    func makeImage() -> UIImage? {
        return UIImage(named: channelIcon)
    }
}
