//
//  HomeViewController.swift
//  One3-iOS
//
//  Created by Binboy_王兴彬 on 2016/12/29.
//  Copyright © 2016年 Binboy. All rights reserved.
//

import UIKit

class HomeViewController: BaseViewController {
    
    var homeObject: String = ""
    
    @IBOutlet weak var diaryContentView: UIView!
    @IBOutlet weak var likeNumLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    func setupUI() {
        diaryContentView.layer.shadowColor = UIColor.init(hex: 0x666666).cgColor
        diaryContentView.layer.shadowRadius = 2
        diaryContentView.layer.shadowOffset = CGSize.zero
        diaryContentView.layer.shadowOpacity = 0.5
        diaryContentView.layer.cornerRadius = 5
    }
    
    // MARK: Actions
    
    @IBAction func diaryAction(_ sender: UIButton) {
    }
    @IBAction func likeAction(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
    }
    @IBAction func shareAction(_ sender: UIButton) {
    }
    
}
