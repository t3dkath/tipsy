//
//  ViewController.swift
//  tipsy
//
//  Created by Kath Faulkner on 13/12/2015.
//  Copyright © 2015 T3D. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var totalFld: UITextField!
    @IBOutlet weak var peopleFld: UITextField!
    @IBOutlet weak var tipSeg: UISegmentedControl!
    @IBOutlet weak var totalLbl: UILabel!
    @IBOutlet weak var perPersonLbl: UILabel!
    
    var guests: Int = 0
    var bill: Double = 0.00
    var tipOptions = [10, 12.5, 15, 18]
    var tip: Double = 10
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addDoneButton(totalFld)
        addDoneButton(peopleFld)
    }

    @IBAction func onCalculatePress(sender: AnyObject) {
        
        if let _bill = Double(totalFld.text!) {
            bill = _bill
        }
        if let _guests = Int(peopleFld.text!) {
            guests = _guests
        }
        
        if (bill != 0.00 && guests != 0) {
            runCalculations()
        }
        
    }
    
    func runCalculations() {
        let tip = tipOptions[tipSeg.selectedSegmentIndex]
        let total = ((bill / 100) * tip) + bill
        let ppTotal = Double(total) / Double(guests)
        
        totalLbl.text = displayMoneyValue(total)
        perPersonLbl.text = displayMoneyValue(ppTotal)
    }
    
    func convertToDouble(amount: Double) ->String {
        return String(format: "%.2f", amount)
    }
    func displayMoneyValue(value: Double) ->String {
        return "£\(convertToDouble(value))"
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder();
        return false
    }
    
    
    func addDoneButton(textField: UITextField) {
        let keyboardToolbar = UIToolbar()
        keyboardToolbar.sizeToFit()
        let flexBarButton = UIBarButtonItem(barButtonSystemItem: .FlexibleSpace,
            target: nil, action: nil)
        let doneBarButton = UIBarButtonItem(barButtonSystemItem: .Done,
            target: view, action: Selector("endEditing:"))
        keyboardToolbar.items = [flexBarButton, doneBarButton]
        textField.inputAccessoryView = keyboardToolbar
    }
    
    

}

