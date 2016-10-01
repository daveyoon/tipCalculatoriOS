//
//  ViewController.swift
//  tipCalculator
//
//  Created by David Yoon on 9/24/16.
//  Copyright © 2016 David Yoon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let defaults = UserDefaults.standard
        let defaultTipIndex = defaults.integer(forKey: "defaultTipIndex")
        tipControl.selectedSegmentIndex = defaultTipIndex
        calculateTip(self) //recalculate tip after reading the default
        billField.becomeFirstResponder() //set the bill field to be the first responder
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    
    @IBAction func onTap(_ sender: AnyObject) {
        view.endEditing(true)
    }
    
    //calculate the tip based on user input and selected tip percentage
    @IBAction func calculateTip(_ sender: AnyObject) {
        let tipPercentages = [0.10, 0.15, 0.20, 0.25]
        let bill = Double(billField.text!) ?? 0
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }
    
    //format the bill input based on the locale
    @IBAction func formatCurrency(_ sender: AnyObject) {
        billField.text = currencyStringFromNumber(number: NumberFormatter().number(from: billField.text!)!)
    }
    
    func currencyStringFromNumber(number: NSNumber) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.usesGroupingSeparator = true
        formatter.locale = NSLocale.current
        return formatter.string(from: number)!
    }
    
}

