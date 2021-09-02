//
//  BaseViewController.swift
//  No Storyboard-Tabbar-Navbar
//
//  Created by MIN SEONG KIM on 2021/09/02.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
    }
    
    func setTabBarImage(imageName: String, title: String) {
        let configuration = UIImage.SymbolConfiguration(scale: .large)
        let image = UIImage(systemName: imageName, withConfiguration: configuration)
        tabBarItem = UITabBarItem(title: title, image: image, tag: 0)
    }
    
    func setupNavBar(title: String? = "") {
        navigationController?.navigationBar.topItem?.title = title
    }


}
