//
//  ViewController.swift
//  Profile_Navigation
//
//  Created by Raghu on 28/02/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func verifyButtonAction(_ sender: UIButton) {
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "ProfileViewController") as? ProfileViewController
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
}

