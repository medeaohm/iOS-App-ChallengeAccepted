//
//  MasterChallengesTableViewController.swift
//  ChallengeAccepted
//
//  Created by Medea Ohm on 3/27/17.
//  Copyright © 2017 Medea Ohm. All rights reserved.
//

import UIKit
import Parse

class MasterChallengesTableViewController: UITableViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    var detailViewController: DetailChallengeViewController? = nil
    var objects = [Challenge]()
    
    @IBOutlet weak var picker: UIPickerView!
    var pickerData: [String] = ["All", "Completed", "In Progress", "Failed"]
    var status = ""
    
    //let dateFormatter = DateFormatter()
    //dateFormatter.dateFormat = "yyyy-MMM-dd"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let cellNib = UINib(nibName: "ChallengeTableViewCell", bundle: nil)
        self.tableView.register(cellNib, forCellReuseIdentifier: "Cell")
        
        self.picker.delegate = self
        self.picker.dataSource = self
        
        loadChallenges()
    }
    
    override func viewWillAppear(_ animated: Bool) {
  
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if (row == 0) {
            status = ""
        }
        if (row == 1) {
            status = "completed"
        }
        else if (row == 2) {
            status = "inProgress"
        }
        else if (row == 3) {
            status = "failed"
        }
        loadChallenges()
    }
    
    func loadChallenges() {
        let query = PFQuery(className: Challenge.parseClassName())
        query.whereKey("user", equalTo: PFUser.current())
        if(status != "") {
            query.whereKey("status", equalTo: status)
        }
        query.order(byAscending: "createdAt")
        
        query.findObjectsInBackground { (results, error) in
            var alert: UIAlertController
            
            if((error) != nil) {
                print("ERROR +++++++++++++++++++++ ", error, separator: " ")
                alert = UIAlertController(title: "Error", message: "\(error)", preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            } else {
                self.objects = results as! [Challenge]
                print(self.objects)
                self.tableView.reloadData()
            }
        }
    }

    // MARK: - Segues    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let object = objects[indexPath.row]
                let controller = segue.destination as! DetailChallengeViewController
                controller.detailItem = object
            }
        }
    }
    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objects.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! ChallengeTableViewCell
        let object = objects[indexPath.row]
        
        //cell.textLabel?.text = object.title
        //cell.imageView
        cell.titleLabel.text = object.title
        cell.statusLabel.text = object.status
        cell.locationLabel.text = ""
        //cell.dateCreatedLabel.text = "\(object.createdAt as NSDate!)"
        cell.dateCreatedLabel.text = "\(object.createdAt)"
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "showDetail", sender: nil)
        tableView.deselectRow(at: indexPath, animated: false)
    }

    @IBAction func logoutPressed(_ sender: Any) {
        PFUser.logOut()
        
        //redirect to Login
        DispatchQueue.main.async {() -> Void in
            let viewController:UIViewController = UIStoryboard(name:"Main", bundle: nil).instantiateViewController(withIdentifier: "Login") as UIViewController
            self.present(viewController, animated: true, completion: nil)
        }
    }
}
