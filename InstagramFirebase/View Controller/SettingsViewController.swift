//
//  SettingsViewController.swift
//  InstagramFirebase
//
//  Created by Rusen Topcu on 28.02.2020.
//  Copyright © 2020 Rusen Topcu. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    

    
    @IBAction func logoutClicked(_ sender: Any) {
        performSegue(withIdentifier: "toViewController", sender: nil)
    }
    

}
