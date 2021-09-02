//
//  MainTabBarController.swift
//  No Storyboard-Tabbar-Navbar
//
//  Created by MIN SEONG KIM on 2021/09/02.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        configViewControllers()
    }

    func configViewControllers() {
        let homeVC = HomeViewController()
        let scanVC = ScanViewController()
        let orderVC = OrderViewController()
        let giftVC = GiftViewController()
        let storeVC = StoreViewController()
        
        let homeNC = makeNavigationController(rootViewController: homeVC)
        let scanNC = UINavigationController(rootViewController: scanVC)
        let orderNC = UINavigationController(rootViewController: orderVC)
        let giftNC = UINavigationController(rootViewController: giftVC)
        let storeNC = UINavigationController(rootViewController: storeVC)
        
        self.viewControllers = [homeNC, scanNC, orderNC, giftNC, storeNC]
        
        homeVC.setTabBarImage(imageName: "house.fill", title: "Home")
        scanVC.setTabBarImage(imageName: "qrcode", title: "Scan")
        orderVC.setTabBarImage(imageName: "arrow.up.bin.fill", title: "Order")
        giftVC.setTabBarImage(imageName: "gift.fill", title: "Gift")
        storeVC.setTabBarImage(imageName: "location.fill", title: "Stores")
    }
    
    
    func makeNavigationController(rootViewController: UIViewController) -> UINavigationController {
        let navigationController = UINavigationController(rootViewController: rootViewController)
        navigationController.navigationBar.prefersLargeTitles = true
        
        let attrs = [
            NSAttributedString.Key.foregroundColor: UIColor.label,
            NSAttributedString.Key.font: UIFont.preferredFont(forTextStyle: .title1).bold()
        ]
        
        navigationController.navigationBar.largeTitleTextAttributes = attrs
        
        return navigationController
    }
}
