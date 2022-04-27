//
//  ViewController.swift
//  Tipsy
//
//  Created by Vinicius Coelho on 27/04/22.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var tipManager = TipManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        billTextField.delegate = self
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let allowedCharacters = "1234567890.,"
        let allowedCharcterSet = CharacterSet(charactersIn: allowedCharacters)
        let typedCharcterSet = CharacterSet(charactersIn: string)
        return allowedCharcterSet.isSuperset(of: typedCharcterSet)
    }

    @IBAction func onTipChanged(_ sender: UIButton) {
        billTextField.endEditing(true)
        
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        
        sender.isSelected = true
        
        tipManager.setTipDecimal(percentageText: sender.currentTitle!)
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        tipManager.numberOfPeople = Int(sender.value)
        splitNumberLabel.text = String(Int(sender.value))
    }
    
    @IBAction func onCalculatePressed(_ sender: UIButton) {
        tipManager.calculateTip(tipValue: billTextField.text!)
        
        self.performSegue(withIdentifier: "showResultSegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        if (segue.identifier == "showResultSegue") {
            let destinationVC = segue.destination as! ResultViewController
            
            destinationVC.result = tipManager.result
            destinationVC.numberOfPeople = tipManager.numberOfPeople
            destinationVC.tipPercentage = tipManager.getTipPercentageText()
        }
    }
}

