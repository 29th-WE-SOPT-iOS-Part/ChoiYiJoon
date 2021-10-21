//
//  BaseTBC.swift
//  29th_Youtube
//
//  Created by Yi Joon Choi on 2021/10/22.
//

import Foundation
import UIKit

class BaseTBC: UITabBarController, UITabBarControllerDelegate {

    let homeTabBarItem  = UITabBarItem(title: "홈", image: UIImage(named: "home"), tag: 0)
    let shortsTabBarItem = UITabBarItem(title: "Shorts", image: UIImage(named: "icArchive"), tag: 1)
    let plusTabBarItem  = UITabBarItem(title: "추가", image: UIImage(named: "icPost"), tag: 2)
    let subscribeTabBarItem  = UITabBarItem(title: "구독", image: UIImage(named: "icReminder"), tag: 3)
    let archiveTabBarItem  = UITabBarItem(title: "보관함", image: UIImage(named: "icMypage"), tag: 4)
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        let homeVC  = HomeVC() 
        let shortsVC = ShortsVC()
        let plusVC  = PlusVC()
        let subscribeVC  = SubscribeVC()
        let archiveVC = ArchiveVC()
        
        let homeNVC = UINavigationController(rootViewController: homeVC)
        let shortsNVC = UINavigationController(rootViewController: shortsVC)
        let plusNVC = UINavigationController(rootViewController: plusVC)
        let subscribeNVC = UINavigationController(rootViewController: subscribeVC)
        let archiveNVC = UINavigationController(rootViewController: archiveVC)
        
        homeNVC.tabBarItem = homeTabBarItem
        shortsNVC.tabBarItem = shortsTabBarItem
        plusNVC.tabBarItem  = plusTabBarItem
        subscribeNVC.tabBarItem  = subscribeTabBarItem
        archiveNVC.tabBarItem  = archiveTabBarItem
       
        self.viewControllers = [homeNVC,shortsNVC,plusNVC,subscribeNVC,archiveNVC]
        self.delegate = self

        UITabBar.appearance().barTintColor = .white
        UITabBar.appearance().isTranslucent = false
        UITabBar.appearance().tintColor = .black
//        UITabBar.appearance().unselectedItemTintColor = .keepinGray2
    }
    
}

