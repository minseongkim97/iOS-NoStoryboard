//
//  HomeHeaderView.swift
//  No Storyboard-Tabbar-Navbar
//
//  Created by MIN SEONG KIM on 2021/09/02.
//

import UIKit

class HomeHeaderView: UIView {
    
    let greetingLabel = UILabel()
    let inboxButton = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        style()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

extension HomeHeaderView {
    func style() {
        
    }
    
    func layout() {
        
    }
}
