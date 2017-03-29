//
//  MasterChallengesTableViewController.swift
//  ChallengeAccepted
//
//  Created by Medea Ohm on 3/27/17.
//  Copyright © 2017 Medea Ohm. All rights reserved.
//

import UIKit
import Parse

class MasterChallengesTableViewController: UITableViewController {

    var detailViewController: DetailChallengeViewController? = nil
    var objects = [Any]()
    

    override func viewDidLoad() {
        super.viewDidLoad()
/*
        if (PFUser.current() == nil) {
            DispatchQueue.main.async {() -> Void in
                let viewController:UIViewController = UIStoryboard(name:"Main", bundle: nil).instantiateViewController(withIdentifier: "Login")
                self.present(viewController, animated: true, completion: nil)
            }
        }
 */
    }
    
    override func viewWillAppear(_ animated: Bool) {
  
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func insertNewObject(_ sender: Any) {
        objects.insert(NSDate(), at: 0)
        let indexPath = IndexPath(row: 0, section: 0)
        self.tableView.insertRows(at: [indexPath], with: .automatic)
    }
    
    // MARK: - Segues    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let object = objects[indexPath.row] as! NSDate
                let controller = (segue.destination as! UINavigationController).topViewController as! DetailChallengeViewController
                controller.detailItem = object
                //controller.navigationItem.leftBarButtonItem = self.splitViewController?.displayModeButtonItem
                //controller.navigationItem.leftItemsSupplementBackButton = true
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        let object = objects[indexPath.row] as! NSDate
        cell.textLabel!.text = object.description
        return cell
    }
    /*
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            objects.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */
    @IBAction func logoutPressed(_ sender: Any) {
        PFUser.logOut()
        
        //redirect to Login
        DispatchQueue.main.async {() -> Void in
            let viewController:UIViewController = UIStoryboard(name:"Main", bundle: nil).instantiateViewController(withIdentifier: "Login") as UIViewController
            self.present(viewController, animated: true, completion: nil)
        }
    }
}
