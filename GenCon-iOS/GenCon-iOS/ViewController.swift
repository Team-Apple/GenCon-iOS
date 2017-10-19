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

private struct PagingMenuOptions: PagingMenuControllerCustomizable {
    let vc1 = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "TodayViewController") as! TodayViewController
    let vc2 = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "TomorrowViewController") as! TomorrowViewController
    
    fileprivate var componentType: ComponentType {
        return .all(menuOptions: MenuOptions(), pagingControllers: pagingControllers)
    }
    
    fileprivate var pagingControllers: [UIViewController] {
        return [vc1, vc2]
    }
    
    fileprivate struct MenuOptions: MenuViewCustomizable {
        var displayMode: MenuDisplayMode {
            return .segmentedControl
        }
        var height: CGFloat {
            return 40
        }
        var backgroundColor: UIColor {
            return UIColor.hex(hexStr: "009688", alpha: 1.0)
        }
        var selectedBackgroundColor: UIColor {
            return UIColor.hex(hexStr: "009688", alpha: 1.0)
        }
        var focusMode: MenuFocusMode {
            return .underline(height: 4, color: UIColor.hex(hexStr: "00b8d4", alpha: 1.0), horizontalPadding: 0, verticalPadding: 0)
        }
        var itemsOptions: [MenuItemViewCustomizable] {
            return [MenuItem1(), MenuItem2()]
        }
    }
    
    fileprivate struct MenuItem1: MenuItemViewCustomizable {
        var displayMode: MenuItemDisplayMode {
            return .text(title: MenuItemText(text: "Today", color: UIColor.lightGray, selectedColor: UIColor.white))
        }
    }
    
    fileprivate struct MenuItem2: MenuItemViewCustomizable {
        var displayMode: MenuItemDisplayMode {
            return .text(title: MenuItemText(text: "Tomorrow ", color: UIColor.lightGray, selectedColor: UIColor.white))
        }
    }
}
