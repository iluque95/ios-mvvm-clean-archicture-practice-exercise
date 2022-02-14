//
//  ViewController.swift
//  Practice exercise
//
//  Created by Itiel Luque on 13/2/22.
//

import UIKit

protocol MainViewControllerInput {
    func fetchData()
    func requestData(for: String)
}
protocol MainViewControllerOutput {
    func getData(data: [String])
    func requestedData(summary: ItemSummaryModel)
}

class ViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    @IBOutlet var indicator: UIActivityIndicatorView!
    
    let vm = TransactionsViewModel()
    lazy var delegate: MainViewControllerInput = vm
    var data: [String] = []
    private var product = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        vm.delegate = self
        delegate.fetchData()
        indicator.hidesWhenStopped = true
    }
}

// MARK: MainViewControllerOutput
extension ViewController: MainViewControllerOutput {
    
    func getData(data: [String]) {
        self.data = data
        tableView.reloadData()
        indicator.stopAnimating()
    }
    
    func requestedData(summary: ItemSummaryModel) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Summary", bundle: nil)
        let summaryViewController = storyBoard.instantiateViewController(withIdentifier: "SummaryViewControllerID") as! SummaryViewController
        summaryViewController.product = product
        summaryViewController.summary = summary
        self.present(summaryViewController, animated: true, completion: nil)
    }
}

// MARK: UITableViewDataSource
extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel!.text = data[indexPath.row]
        
        return cell
    }
}

// MARK: UITableViewDelegate
extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        product = data[indexPath.row]
        delegate.requestData(for: product)
    }
}

