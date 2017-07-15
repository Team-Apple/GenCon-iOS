//
//  AddEventVC.swift
//  GenCon-iOS
//
//  Created by Taillook on 2017/07/15.
//  Copyright © 2017年 Taillook. All rights reserved.
//

import UIKit

class AddEventVC: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        let addEventV = UINib(nibName: "AddEventV", bundle: nil).instantiate(withOwner: self, options: nil)[0] as! UIView
        self.view = addEventV
        self.title = "AddEvents"
        
        let cancel = UIBarButtonItem(title: "キャンセル", style: .plain, target: self, action: #selector(AddEventVC.cancelTapped))
        self.navigationItem.leftBarButtonItem = cancel
        let save = UIBarButtonItem(title: "保存", style: .plain, target: self, action: #selector(AddEventVC.saveTapped))
        self.navigationItem.rightBarButtonItem = save
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
