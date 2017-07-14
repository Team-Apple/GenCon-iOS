//
//  HomeV.swift
//  GenCon-iOS
//
//  Created by Taillook on 2017/07/14.
//  Copyright © 2017年 Taillook. All rights reserved.
//

import UIKit

import UIKit

class HomeV: UIView {
    @IBAction func toSetting(_ sender: Any) {
        delegate?.buttonTap(bool: true , sender: self)
    }
}
protocol CustomViewDelegate: class {
    func buttonTap(bool:Bool,sender:HomeV)
}
