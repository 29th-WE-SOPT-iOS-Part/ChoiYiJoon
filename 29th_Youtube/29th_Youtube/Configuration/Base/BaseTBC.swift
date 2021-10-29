//
//  BaseTBC.swift
//  29th_Youtube
//
//  Created by Yi Joon Choi on 2021/10/22.
//

import Foundation
import UIKit

class BaseTBC: UITabBarController, UITabBarControllerDelegate {
    
    let titles = ["홈", "Shorts", "추가", "구독", "보관함"]
    
    let defaultImages = [Const.Image.homeIcon,
                         Const.Image.shortsIcon,
                         Const.Image.plusCircleIcon,
                         Const.Image.subscriptionsIcon,
                         Const.Image.LibraryIcon]
    
    let selectedImages = [Const.Image.homeIconFill,
                         Const.Image.shortsIconFill,
                         Const.Image.plusCircleIcon,
                         Const.Image.subscriptionsIconFill,
                         Const.Image.LibraryIconFill]
    
    let views = [HomeVC(), ShortsVC(), PlusVC(), SubscribeVC(), ArchiveVC()]
    var VCs : [UINavigationController] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        views.forEach{
            VCs.append(UINavigationController(rootViewController: $0))
        }
        
        viewControllers = VCs
        
        viewControllers?.indices.forEach{
            viewControllers?[$0].tabBarItem = UITabBarItem(title: titles[$0], image: defaultImages[$0], selectedImage: selectedImages[$0])
        }
        
        //나중에 플러스 아이콘만 modal로 present 될 경우를 대비하여 delegate 코드 미리 추가했습니다!
        self.delegate = self

        UITabBar.appearance().barTintColor = .white
        UITabBar.appearance().tintColor = .black
        UITabBar.appearance().isTranslucent = false
        
        if #available(iOS 15, *) {
            let appearance = UITabBarAppearance()
            let tabBar = UITabBar()
            appearance.configureWithOpaqueBackground()
            appearance.backgroundColor = .white
            appearance.selectionIndicatorTintColor = .black
            tabBar.standardAppearance = appearance;
            UITabBar.appearance().scrollEdgeAppearance = appearance
        }
    }
    
}

