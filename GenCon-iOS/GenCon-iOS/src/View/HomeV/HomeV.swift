//
//  HomeV.swift
//  GenCon-iOS
//
//  Created by Taillook on 2017/07/14.
//  Copyright © 2017年 Taillook. All rights reserved.
//

import UIKit

class HomeV: UIView {
    weak var delegate: HomeVDelegate! = nil
    
    @IBAction func toSetting(_ sender: Any) {
        delegate.buttonTap()
    }
}

protocol HomeVDelegate: class {
    func buttonTap()
}
