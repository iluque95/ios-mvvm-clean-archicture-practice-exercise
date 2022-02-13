//
//  ViewController.swift
//  Practice exercise
//
//  Created by Itiel Luque on 13/2/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let vm = OperationsViewModel()
        
        vm.fetchData()
    }


}

