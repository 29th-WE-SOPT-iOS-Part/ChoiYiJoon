//
//  UIColor.swift
//  29th_Youtube
//
//  Created by Yi Joon Choi on 2021/10/08.
//

import Foundation
import UIKit

extension UIColor{
    convenience init(hex: UInt, alpha: CGFloat = 1.0) {
            self.init(
                red: CGFloat((hex & 0xFF0000) >> 16) / 255.0,
                green: CGFloat((hex & 0x00FF00) >> 8) / 255.0,
                blue: CGFloat(hex & 0x0000FF) / 255.0,
                alpha: CGFloat(alpha)
            )
    }
    
    class var googleBlue: UIColor { UIColor(hex: 0x4285F4) }
}
