//
//  ViewController.swift
//  Stock App
//
//  Created by 邱欣宇 on 10/21/23.
//

import UIKit
import RealmSwift

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var stocksArray: [StockClass] = [StockClass]()
//    var stocksArrayShort: [StockQuoteShort] = [StockQuoteShort]()

    @IBOutlet weak var tblView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        Realm.Configuration.defaultConfiguration = config
//        loadStockValues()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        loadStockValues()
    }
    
    func loadStockValues() {
        // read value from Local DB and populate the Table
        do {
            stocksArray = [StockClass]()
            let realm = try Realm()
            print(realm.configuration.fileURL)
            let stocks = realm.objects(StockClass.self)
            
            var stockSymbols: [String] = [String](  )
            for stock in stocks {
                stockSymbols.append(stock.symbol)
            }
            
            if (stocks.isEmpty) {
                return
            }
            
            getAllStockQuotes(symbols: stockSymbols)
                .done { stockQuotes in
                    for stockQuote in stockQuotes {
                        let stockClass = StockClass()
                        stockClass.symbol = stockQuote.symbol
                        stockClass.price = stockQuote.price
//                        print("Change = \(stockQuote.change)")
                        self.stocksArray.append(stockClass)
                    }
                    self.tblView.reloadData()
                }
        }
        catch {
            print("Error in reading from Realm \(error)")
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return stocksArray.count
        }
        
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let symbol = stocksArray[indexPath.row].symbol
        let price = String(format: "%.2f", stocksArray[indexPath.row].price)
        cell.textLabel?.text = "\(symbol) : \(price)$"
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            deleteFromRealmDB(stocksArray[indexPath.row])
            stocksArray.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }

    func deleteFromRealmDB(_ stock : StockClass) {
        do {
            let realm = try Realm()
            try realm.write {
                let predicate = NSPredicate(format: "symbol == %@", stock.symbol)
                if let productToDelete = realm.objects(StockClass.self).filter(predicate).first {
                    realm.delete(productToDelete)
                }
            }
        }
        catch {
            print("Error in deleting stock from Realm DB \(error)")
        }
    }
}

