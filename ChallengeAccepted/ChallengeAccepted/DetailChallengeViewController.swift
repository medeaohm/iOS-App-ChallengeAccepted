//
//  DetailChallengeViewController.swift
//  ChallengeAccepted
//
//  Created by Medea Ohm on 3/27/17.
//  Copyright © 2017 Medea Ohm. All rights reserved.
//

import UIKit

class DetailChallengeViewController: UIViewController {

    @IBOutlet weak var detailLabel: UILabel!
    
    func configureView() {
        // Update the user interface for the detail item.
        if let detail = self.detailItem {
            if let label = self.detailLabel {
                label.text = detail.description
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.configureView()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    var detailItem: NSDate? {
        didSet {
            // Update the view.
            self.configureView()
        }
    }
}
