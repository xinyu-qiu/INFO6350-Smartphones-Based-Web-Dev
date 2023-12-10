//
//  ViewController.swift
//  NamePhoneProtocolD
//
//  Created by 邱欣宇 on 12/9/23.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, SendNamePhoneNumberDelegate {
    
    var names: [String] = [String]()
    var phoneNumbers: [String] = [String]()

    @IBOutlet weak var tblView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func addNamePhoneNumber(_ sender: Any) {
        performSegue(withIdentifier: "segueNamePhoneNumber", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueNamePhoneNumber" {
            let secondVC = segue.destination as! NamePhoneViewController
            secondVC.sendNamePhoneDelegate = self
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "Name:\(names[indexPath.row]) Phone:\(phoneNumbers[indexPath.row])"
        return cell
    }
    
    func sendNamePhoneNumber(name: String, phoneNumber: String) {
        names.append(name)
        phoneNumbers.append(phoneNumber)
        tblView.reloadData()
    }
    
}

