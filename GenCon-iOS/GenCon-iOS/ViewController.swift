//
//  ViewController.swift
//  GenCon-iOS
//
//  Created by Taillook on 2017/10/05.
//  Copyright © 2017年 Taillook. All rights reserved.
//

import UIKit
import PagingMenuController

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.barTintColor = UIColor.hex(hexStr: "#009688", alpha: 1.0)
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        
        guard let statusBarWindow = UIApplication.shared.value(forKey: "statusBarWindow") as? UIView else {
            return
        }
        let statusBar = statusBarWindow.subviews[0] as UIView
        statusBar.backgroundColor = UIColor.hex(hexStr: "00695c", alpha: 1.0)
        let options = PagingMenuOptions()
        let pagingMenuController = PagingMenuController(options: options)
        
        addChildViewController(pagingMenuController)
        view.addSubview(pagingMenuController.view)
        pagingMenuController.didMove(toParentViewController: self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
