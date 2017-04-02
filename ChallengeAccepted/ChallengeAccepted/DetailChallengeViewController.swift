//
//  DetailChallengeViewController.swift
//  ChallengeAccepted
//
//  Created by Medea Ohm on 3/27/17.
//  Copyright © 2017 Medea Ohm. All rights reserved.
//

import UIKit
import Parse

class DetailChallengeViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UITextView!
    @IBOutlet weak var winLabel: UILabel!
    @IBOutlet weak var looseLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    
    var id: String = "";
    
    func configureView() {
        // Update the user interface for the detail item.
        if let detail = self.detailItem {
            id = detail.objectId!
            
            if let title = self.titleLabel {
                title.text = detail.title
            }
            if let location = self.locationLabel {
                location.text = ""
            }
            if let date = self.dateLabel {
                date.text = "\(detail.createdAt)"
            }
            if let descriptionC = self.descriptionLabel {
                descriptionC.text = detail.descriptionText
            }
            if let win = self.winLabel {
                win.text = detail.win
            }
            if let loose = self.looseLabel {
                loose.text = detail.loose
            }
            if let status = self.statusLabel {
                status.text = detail.status
                if(detail.status == "completed") {
                    status.textColor = UIColor.green
                }
                if(detail.status == "failed") {
                    status.textColor = UIColor.red
                }
            }
            if let photo = self.image {
                //image.image = UIImage(data: detail.photo)
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
    
    @IBAction func failedPressed(_ sender: Any) {
        updateStatus(newStatus: "Failed")
    }
    
    @IBAction func completedPressed(_ sender: Any) {
        updateStatus(newStatus: "Completed")
    }
    
    var detailItem: Challenge? {
        didSet {
            // Update the view.
            self.configureView()
        }
    }
    
    func updateStatus(newStatus: String) {
        let query = PFQuery(className: Challenge.parseClassName())

        query.getObjectInBackground(withId: id) {
            (result: PFObject?, error: Error?) -> Void in
            if error != nil {
                print("ERROR +++++++++++++++++++++ ", error!, separator: " ")
                var alert: UIAlertController
                alert = UIAlertController(title: "Error", message: "\(error)", preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            } else if let challenge = result {
                challenge["status"] = newStatus
                challenge.saveInBackground()
            }
        }
    }
}
