//
//  AddStockViewController.swift
//  Stock App
//
//  Created by 邱欣宇 on 10/22/23.
//

import UIKit
import Alamofire
import SwiftyJSON
import RealmSwift

class AddStockViewController: UIViewController {

    @IBOutlet weak var txtStock: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func addStockAction(_ sender: Any) {
        guard let stockSymbol = txtStock.text else {return}
        
        getStockInfo(symbol: stockSymbol).done { stockClass in
//            print(stockClass)
            do {
                let realm = try Realm()
//                print(realm.configuration.fileURL)
                try realm.write({
                    realm.add(stockClass, update: .modified)
                })
                self.navigationController?.popViewController(animated: true)
            }
            catch {
                print("Error in adding data to Realm DB \(error)")
            }
        }
        .catch { error in
            print("Unable to get stock value \(error)")
        }
 
    }
}
