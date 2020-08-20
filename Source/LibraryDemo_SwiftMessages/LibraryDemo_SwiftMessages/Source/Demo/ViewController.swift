//
//  ViewController.swift
//  Demo
//
//  Created by Tim Moose on 8/11/16.
//  Copyright © 2016 SwiftKick Mobile. All rights reserved.
//

import UIKit
import SwiftMessages

class ViewController: UITableViewController {
    
    @objc
    static func createDemoViewController() -> UIViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: .SwiftMessages())
        let viewController = storyboard.instantiateViewController(withIdentifier: "library-demo-view-controller")
        return viewController
    }

    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }

    /*
     MARK: - UITableViewDataSource
     */
    
    
    
    /*
     MARK: - UITableViewDelegate
     */
    
    /*
     MARK: - Demos
     */

    
}
