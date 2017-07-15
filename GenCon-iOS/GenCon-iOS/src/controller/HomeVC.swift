//
//  ViewController.swift
//  GenCon-iOS
//
//  Created by Taillook on 2017/07/11.
//  Copyright © 2017年 Taillook. All rights reserved.
//

import UIKit

class HomeVC: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        let homeV:HomeV = UINib(nibName: "HomeV", bundle: nil).instantiate(withOwner: self, options: nil)[0] as! HomeV
        homeV.delegate = self
        self.view = homeV
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
