//
//  RewardTileView.swift
//  No Storyboard-Tabbar-Navbar
//
//  Created by MIN SEONG KIM on 2021/09/06.
//

import UIKit

class RewardTileView: UIView {
    
    let balanceView = BalanceView()
    let rewardButton = UIButton()
    let rewardGraphView = UIView()
    let starRewardView = UIView()
    var detailButton = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        style()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: 100, height: 300)
    }

}

extension RewardTileView {
    
    func style() {
        balanceView.translatesAutoresizingMaskIntoConstraints = false
        rewardGraphView.translatesAutoresizingMaskIntoConstraints = false
        starRewardView.translatesAutoresizingMaskIntoConstraints = false
        
        makeRewardOptionButton()
        
        rewardGraphView.backgroundColor = .systemRed
        
        detailButton = makeClearButton(withText: "Details")
        
    }
    
    func makeRewardOptionButton() {
        rewardButton.translatesAutoresizingMaskIntoConstraints = false
//        rewardButton.addTarget(self, action: #selector(rewardOptionTapped), for: .primaryActionTriggered)
        
        let configuration = UIImage.SymbolConfiguration(scale: .small)
        let image = UIImage(systemName: "chevron.down", withConfiguration: configuration)
        
        rewardButton.setImage(image, for: .normal)
        rewardButton.imageView?.tintColor = .label
        rewardButton.imageView?.contentMode = .scaleAspectFit
        
        rewardButton.setTitle("Rewards options", for: .normal)
        rewardButton.setTitleColor(.label, for: .normal)
        rewardButton.titleLabel?.font = UIFont.preferredFont(forTextStyle: .footnote)
        
        rewardButton.semanticContentAttribute = .forceRightToLeft
        rewardButton.imageEdgeInsets = UIEdgeInsets(top: 2, left: 20, bottom: 0, right: 0)
        rewardButton.contentEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 20)
    }
    
    func layout() {
        addSubview(balanceView)
        addSubview(rewardButton)
        addSubview(rewardGraphView)
        addSubview(starRewardView)
        addSubview(detailButton)
        
        
        NSLayoutConstraint.activate([
            balanceView.topAnchor.constraint(equalTo: topAnchor),
            balanceView.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 2),
            
            rewardButton.centerYAnchor.constraint(equalTo: balanceView.pointLabel.centerYAnchor),
            trailingAnchor.constraint(equalToSystemSpacingAfter: rewardButton.trailingAnchor, multiplier: 3),
            
            rewardGraphView.topAnchor.constraint(equalToSystemSpacingBelow: balanceView.bottomAnchor, multiplier: 1),
            rewardGraphView.centerXAnchor.constraint(equalTo: centerXAnchor),
//            rewardGraphView.widthAnchor.constraint(equalToConstant: frame.width),
            rewardGraphView.heightAnchor.constraint(equalToConstant: 100),
            rewardGraphView.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 2),
            trailingAnchor.constraint(equalToSystemSpacingAfter: rewardGraphView.trailingAnchor, multiplier: 2),
            
            starRewardView.topAnchor.constraint(equalTo: rewardGraphView.bottomAnchor, constant: 8),
            starRewardView.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 1),
            trailingAnchor.constraint(equalToSystemSpacingAfter: starRewardView.trailingAnchor, multiplier: 1),
            
            detailButton.topAnchor.constraint(equalToSystemSpacingBelow: starRewardView.bottomAnchor, multiplier: 2),
            detailButton.leadingAnchor.constraint(equalTo: balanceView.leadingAnchor),
            bottomAnchor.constraint(equalToSystemSpacingBelow: detailButton.bottomAnchor, multiplier: 2 )
        ])
    }
}
