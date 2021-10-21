//
//  UIView.swift
//  29th_Youtube
//
//  Created by Yi Joon Choi on 2021/10/21.
//

import Foundation
import UIKit

extension UIView {
    func addSubviews(_ view: [UIView]) {
        view.forEach { self.addSubview($0) }
    }
}
