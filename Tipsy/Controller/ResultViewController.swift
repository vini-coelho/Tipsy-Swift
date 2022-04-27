//
//  ResultViewController.swift
//  Tipsy
//
//  Created by Vinicius Coelho on 27/04/22.
//

import UIKit

class ResultViewController: UIViewController {
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    var result: String?
    var numberOfPeople: Int?
    var tipPercentage: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        totalLabel.text = result
        settingsLabel.text = "Split between \(numberOfPeople!) people with \(tipPercentage ?? "") tip"
    }
    
    @IBAction func onRecalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true)
    }

}
