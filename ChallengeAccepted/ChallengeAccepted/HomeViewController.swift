//
//  HomeViewController.swift
//  ChallengeAccepted
//
//  Created by Medea Ohm on 3/23/17.
//  Copyright © 2017 Medea Ohm. All rights reserved.
//

import UIKit
import Parse

class HomeViewController: UIViewController {
    
    override func viewWillAppear(_ animated: Bool) {
        if (PFUser.current() == nil) {
            DispatchQueue.main.async {() -> Void in
                let viewController:UIViewController = UIStoryboard(name:"Main", bundle: nil).instantiateViewController(withIdentifier: "Login")
                self.present(viewController, animated: true, completion: nil)
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
