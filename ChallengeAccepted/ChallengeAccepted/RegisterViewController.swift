//
//  RegisterViewController.swift
//  ChallengeAccepted
//
//  Created by Medea Ohm on 3/23/17.
//  Copyright © 2017 Medea Ohm. All rights reserved.
//

import UIKit
import Parse

class RegisterViewController: UIViewController {

    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var confirmPasswordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func RegisterAction(_ sender: UIButton) {
        var username = self.usernameField.text
        var password = self.passwordField.text
        var confirmPassword = self.confirmPasswordField.text
        var email = self.emailField.text
        var alert: UIAlertController
        
        
        //validate username
        if (username?.characters.count)! < 3 {
            alert = UIAlertController(title: "Error", message: "Username should contain at leat 3 symbols", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Click", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        //validate email
        else if (email?.characters.count)! < 3 {
            alert = UIAlertController(title: "Error", message: "Email should contain at leat 3 symbols", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Click", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        //validate password
        else if (email?.characters.count)! < 3 {
            alert = UIAlertController(title: "Error", message: "Password should contain at leat 3 symbols", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Click", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        else if (password != confirmPassword) {
            alert = UIAlertController(title: "Error", message: "Password do not match", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Click", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        else{
            //run spinner to show the task is in progress
            let spinner: UIActivityIndicatorView = UIActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 150, height: 150))
            spinner.startAnimating()
            
            let newUser = PFUser()
            newUser.username = username
            newUser.password = password
            newUser.email = email
            
            //Register the user async
            newUser.signUpInBackground(block: { (success, error) in
                spinner.stopAnimating()
                
                if((error) != nil) {
                    print("ERROR +++++++++++++++++++++ ", error, separator: " ")
                    //alert = UIAlertController(title: "Error", message: "\(error)", preferredStyle: UIAlertControllerStyle.alert)
                    //alert.addAction(UIAlertAction(title: "Click", style: UIAlertActionStyle.default, handler: nil))
                    //self.present(alert, animated: true, completion: nil)
                } else {
                    //alert = UIAlertController(title: "Success", message: "Registered!", preferredStyle: UIAlertControllerStyle.alert)
                    //alert.addAction(UIAlertAction(title: "Click", style: UIAlertActionStyle.default, handler: nil))
                    //self.present(alert, animated: true, completion: nil)
                    
                    //redirect to Login
                    DispatchQueue.main.async {() -> Void in
                        let viewController:UIViewController = UIStoryboard(name:"Main", bundle: nil).instantiateViewController(withIdentifier: "Login")
                        self.present(viewController, animated: true, completion: nil)
                    }
                }
            })
        }
    }
}
