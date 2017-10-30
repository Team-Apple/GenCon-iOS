//
//  UINavigationController+InvisibleBorder.swift
//  GenCon-iOS
//
//  Created by Taillook on 2017/10/27.
//  Copyright © 2017年 Taillook. All rights reserved.
//

import UIKit

extension UINavigationController {
    override open func viewDidLoad() {
        super.viewDidLoad()
        self.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationBar.shadowImage = UIImage()
    }
}
