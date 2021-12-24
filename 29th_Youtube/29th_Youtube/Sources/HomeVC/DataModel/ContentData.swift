//
//  ContentData.swift
//  29th_Youtube
//
//  Created by Yi Joon Choi on 2021/10/30.
//

import Foundation
import UIKit

struct ContentData{
    let contentTitle: String
    let thumnbnail: String
    let description: String
    
    func makeImage() -> UIImage? {
        return UIImage(named: thumnbnail)
    }
}
