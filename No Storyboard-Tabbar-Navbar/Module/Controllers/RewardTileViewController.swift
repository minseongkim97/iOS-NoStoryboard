//
//  RewardTileViewController.swift
//  No Storyboard-Tabbar-Navbar
//
//  Created by MIN SEONG KIM on 2021/09/06.
//

import UIKit

class RewardTileViewController: UIViewController {
    
    let rewardsTileView = RewardTileView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        rewardsTileView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(rewardsTileView)
        
        NSLayoutConstraint.activate([
            rewardsTileView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            rewardsTileView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            rewardsTileView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            rewardsTileView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
