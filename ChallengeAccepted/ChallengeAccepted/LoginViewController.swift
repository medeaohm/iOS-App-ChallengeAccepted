//
//  LoginViewController.swift
//  ChallengeAccepted
//
//  Created by Medea Ohm on 3/23/17.
//  Copyright © 2017 Medea Ohm. All rights reserved.
//

import UIKit
import Parse

class LoginViewController: UIViewController {

    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if PFUser.current() != nil {
            DispatchQueue.main.async(execute: { 
                self.performSegue(withIdentifier: "loginPressed", sender: nil)
            })
            //self.performSegue(withIdentifier: "loginPressed", sender: nil)
            //redirect to Login
            //DispatchQueue.main.async {() -> Void in
            //    let viewController:UIViewController = UIStoryboard(name:"Main", bundle: nil).instantiateViewController(withIdentifier: "MasterChallengesTable") as UIViewController
            //   self.present(viewController, animated: true, completion: nil)
            //}
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func loginAction(_ sender: Any) {
        
        let username = self.usernameField.text
        let password = self.passwordField.text
        
        var alertValidation: UIAlertController
        
        
        
        //validate username
        if (username?.characters.count)! < 3 {
            alertValidation = UIAlertController(title: "Invalid", message: "Username should contain at leat 3 symbols", preferredStyle: UIAlertControllerStyle.alert)
            alertValidation.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            self.present(alertValidation, animated: true, completion: nil)
        }
        //validate password
        else if (password?.characters.count)! < 3 {
            alertValidation = UIAlertController(title: "Invalid", message: "Password should contain at leat 3 symbols", preferredStyle: UIAlertControllerStyle.alert)
            alertValidation.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            self.present(alertValidation, animated: true, completion: nil)
        }
        else {
            
            PFUser.logInWithUsername(inBackground: username!, password: password!, block: { (user, error) in
                
                var alert: UIAlertController
                /* TODO - Fix bug of when trying to log in with invalid data */
                if (user) != nil {
                    self.performSegue(withIdentifier: "loginPressed", sender: nil)
                    //redirect to Login
                    //DispatchQueue.main.async {() -> Void in
                    //    let viewController:UIViewController = UIStoryboard(name:"Main", bundle: nil).instantiateViewController(withIdentifier: "MasterChallengesTable") as UIViewController
                     //   self.present(viewController, animated: true, completion: nil)
                    //}
                    print("LoggedIn +++++++++++++++++++++ ")
                    print(user)
                    
                } else {
                    print("ERROR +++++++++++++++++++++ ", error, separator: " ")
                    alert = UIAlertController(title: "Error", message: "Unable to connect.", preferredStyle: UIAlertControllerStyle.alert)
                    alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                }
            })
        }
    }
}
