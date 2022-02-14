//
//  SummaryViewController.swift
//  Practice exercise
//
//  Created by Itiel Luque on 14/2/22.
//

import Foundation
import UIKit

class SummaryViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    @IBOutlet var amount: UILabel!
    
    var product: String = ""
    var summary: ItemSummaryModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.reloadData()
        amount.text = "Total sum for the product \(product) is \(summary!.amount) EUR"
    }
}

extension SummaryViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return summary?.transactions.count ?? 0
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "summaryCell", for: indexPath)
        
        if let transactions = summary?.transactions[indexPath.row] {
        
            let from = transactions.from
            let to = transactions.to
            
            cell.textLabel!.text = "\(from.amount)\(from.currency) -> \(to.amount)\(to.currency)"
        }
        
        return cell
    }
}
