//
//  ViewController.swift
//  CItyViews
//
//  Created by 邱欣宇 on 9/11/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var cityImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func changeSeattleImage(_ sender: Any) {
        cityImage.image = UIImage(named: "Seattle")
    }
    
    @IBAction func changeLosAngelesImage(_ sender: Any) {
        cityImage.image = UIImage(named: "LosAngeles")
    }
    
    @IBAction func changeAustinImage(_ sender: Any) {
        cityImage.image = UIImage(named: "Austin")
    }
    
    @IBAction func changeNewYorkImage(_ sender: Any) {
        cityImage.image = UIImage(named: "NewYork")
    }
    
    @IBAction func changeLasVegasImage(_ sender: Any) {
        cityImage.image = UIImage(named: "LasVegas")
    }
    
}

    
