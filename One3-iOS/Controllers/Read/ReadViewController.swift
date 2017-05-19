//
//  ReadViewController.swift
//  One3-iOS
//
//  Created by Binboy_王兴彬 on 2016/12/29.
//  Copyright © 2016年 Binboy. All rights reserved.
//

import UIKit

class ReadViewController: BaseViewController {
    
    var readObject = ""
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }

    func setupUI() {
        
        tableView.layer.masksToBounds = false;
        tableView.layer.shadowColor = UIColor(hex: 0x666666).cgColor
        tableView.layer.shadowRadius = 2;
        tableView.layer.shadowOffset = CGSize.zero;
        tableView.layer.shadowOpacity = 0.5;
        tableView.layer.cornerRadius = 5;

    }

}

extension ReadViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReadIntroCellIdentifier")
        cell?.textLabel?.text = "复杂世界，一个就够了"
        return cell!
    }
}
