//
//  HomeVC+ToSetEvent.swift
//  GenCon-iOS
//
//  Created by Taillook on 2017/07/14.
//  Copyright © 2017年 Taillook. All rights reserved.
//

import UIKit

extension HomeVC: HomeVDelegate {
    func buttonTap() {
        let vc = AddEventVC()
        let modalView = UINavigationController(rootViewController: vc)
        modalView.modalTransitionStyle = UIModalTransitionStyle.coverVertical
        self.view.window?.rootViewController!.present(modalView, animated: true, completion: nil)
    }
}
