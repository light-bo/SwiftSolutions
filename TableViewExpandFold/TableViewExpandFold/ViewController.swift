//
//  ViewController.swift
//  SwiftPractise
//
//  Created by light_bo on 2018/8/13.
//  Copyright © 2018 light_bo. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpViews()
    }
    
    func setUpViews() {
        mainTableView.register(BDTableViewCell.self, forCellReuseIdentifier: kTableViewCellId)
        
        self.view.addSubview(mainTableView)
        mainTableView.snp.makeConstraints { (make) in
            make.left.right.equalToSuperview()
            make.top.equalTo(topLayoutGuide.snp.bottom)
            make.bottom.equalTo(bottomLayoutGuide.snp.top)
        }
    }
    
    lazy var mainTableView: UITableView = {
        let tableView = UITableView(frame: CGRect(), style: .grouped)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.estimatedRowHeight = 50
        tableView.backgroundColor = UIColor.lightGray
        tableView.separatorStyle = .none
        
        return tableView
    } ()
    
    let defaultCellHeight = 140
    var heightArr: [CGFloat?] = [140, 140, 140, 140, 140, 140, 140, 140, 140, 140]
}


extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return heightArr[indexPath.row] ?? UITableViewAutomaticDimension
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: kTableViewCellId, for: indexPath)
        
        if let tableViewCell = cell as? BDTableViewCell {
            tableViewCell.clickedAction = { [weak self] in
                guard let strongSelf = self else { return }
                
                if strongSelf.heightArr[indexPath.row] == nil {
                    strongSelf.heightArr[indexPath.row] = 140
                } else {
                    strongSelf.heightArr[indexPath.row] = nil
                }
                
                
                
                tableView.beginUpdates()
                tableView.endUpdates()
            }
        } else {}
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}

