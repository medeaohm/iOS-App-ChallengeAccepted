//
//  ViewController.swift
//  ChallengeAccepted
//
//  Created by Medea Ohm on 3/29/17.
//  Copyright © 2017 Medea Ohm. All rights reserved.
//

import UIKit
import Parse

class AddChallengeViewController: UIViewController {

    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextField!
    @IBOutlet weak var challengerTextField: UITextField!
    @IBOutlet weak var winTextField: UITextField!
    @IBOutlet weak var looseTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func addLocationAction(_ sender: Any) {
    }
    
    @IBAction func saveChallenge(_ sender: Any) {
        let title = self.titleTextField.text
        let description = self.descriptionTextField.text
        let challenger = self.challengerTextField.text
        let win = self.winTextField.text
        let loose = self.looseTextField.text
        let status = "InProgress"
        var alertValidation: UIAlertController
        
        var challenge = Challenge()
        
        challenge.title = title!
        challenge.descriptionText = description!
        challenge.challenger = challenger!
        challenge.win = win!
        challenge.loose = loose!
        challenge.status = status
        

        challenge.saveInBackground(block: { (success, error) in
            //spinner.stopAnimating()
            
            var alert: UIAlertController
            
            if((error) != nil) {
                print("ERROR +++++++++++++++++++++ ", error, separator: " ")
                alert = UIAlertController(title: "Error", message: "\(error)", preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            } else {
                self.performSegue(withIdentifier: "returnToTableView", sender: nil)
            }
        })

    }
}
