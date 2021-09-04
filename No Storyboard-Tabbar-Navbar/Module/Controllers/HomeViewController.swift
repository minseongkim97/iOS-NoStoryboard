//
//  ViewController.swift
//  No Storyboard-Tabbar-Navbar
//
//  Created by MIN SEONG KIM on 2021/08/31.
//

import UIKit

class HomeViewController: BaseViewController {

    let headerView = HomeHeaderView()
//    let tableView = UITableView()
    let scrollView = UIScrollView()
    let stackView = UIStackView()
    
    var headerViewTopConstraint: NSLayoutConstraint?
    
    let cellId = "cellId"
    let tiles = [
        TileView("Star balance"),
        TileView("Bonus stars"),
        TileView("Try these"),
        TileView("Welcome back"),
        TileView("Uplifting")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavBar(title: "Good afternoon, Goni 🐕")
//        setupTableView()
        setupScrollView()
        
        style()
        layout()
    }
    
    func setupScrollView() {
        scrollView.delegate = self
    }


}

extension HomeViewController {
    func style() {
        headerView.translatesAutoresizingMaskIntoConstraints = false
        headerView.backgroundColor = .systemPink
//        tableView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.axis = .vertical
        stackView.spacing = 8
    }
    
    func layout() {
        view.addSubview(headerView)
//        view.addSubview(tableView)
        view.addSubview(scrollView)
        scrollView.addSubview(stackView)
        
        for tile in tiles {
            addChild(tile)
            stackView.addArrangedSubview(tile.view)
            tile.didMove(toParent: self)
        }
        
        headerViewTopConstraint = headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor)
        
        NSLayoutConstraint.activate([
//            headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            headerViewTopConstraint!,
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
//            tableView.topAnchor.constraint(equalTo: headerView.bottomAnchor),
//            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
            
            scrollView.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 8),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            stackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            
            stackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])
    }
}

// MARK: TableView
//extension HomeViewController: UITableViewDataSource {
//
//    func setupTableView() {
//        tableView.dataSource = self
//        tableView.delegate = self
//
//        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
//        tableView.tableFooterView = UIView()
//    }
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//
//        return tiles.count
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//
//        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
//
//        cell.textLabel?.text = tiles[indexPath.row]
//        cell.accessoryType = UITableViewCell.AccessoryType.disclosureIndicator
//
//        return cell
//    }
//
//}

// MARK: Animating scrollView

extension HomeViewController: UIScrollViewDelegate {

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let y = scrollView.contentOffset.y

        let swipingDown = y <= 0
        let shouldSnap = y > 30
        let labelHeight = headerView.greetingLabel.frame.height + 16 // label + spacer

        UIView.animate(withDuration: 0.3) {
            self.headerView.greetingLabel.alpha = swipingDown ? 1.0 : 0.0
        }

        // UIView.animate와 동일한 작업을 하는 새로운 방법
        UIViewPropertyAnimator.runningPropertyAnimator(withDuration: 0.3, delay: 0, options: [], animations: {
            self.headerViewTopConstraint?.constant = shouldSnap ? -labelHeight : 0
            self.view.layoutIfNeeded()
        }, completion: nil)
    }
}

//extension HomeViewController: UITableViewDelegate {
//
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//
//        return 300
//    }
//
//    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        let y = scrollView.contentOffset.y
//
//        let swipingDown = y <= 0
//        let shouldSnap = y > 30
//        let labelHeight = headerView.greetingLabel.frame.height + 16 // label + spacer
//
//        UIView.animate(withDuration: 0.3) {
//            self.headerView.greetingLabel.alpha = swipingDown ? 1.0 : 0.0
//        }
//
//        // UIView.animate와 동일한 작업을 하는 새로운 방법
//        UIViewPropertyAnimator.runningPropertyAnimator(withDuration: 0.3, delay: 0, options: [], animations: {
//            self.headerViewTopConstraint?.constant = shouldSnap ? -labelHeight : 0
//            self.view.layoutIfNeeded()
//        }, completion: nil)
//    }
//}
