//
//  EditViewController.swift
//  GenCon-iOS
//
//  Created by Taillook on 2017/11/04.
//  Copyright © 2017年 Taillook. All rights reserved.
//

import UIKit

class EditEventViewController: UIViewController {
    
    let dateFormatter = DateFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dateFormatter.locale = Locale(identifier: "ja_JP")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        self.view = nil
    }
    
}
