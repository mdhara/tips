//
//  ViewController.swift
//  tips
//
//  Created by Dhara Mehta on 3/19/16.
//  Copyright © 2016 codepath. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after  loading the view, typically from a nib.
        
        let defaults = NSUserDefaults.standardUserDefaults()
        var savedBillAmount = 0.00
        if let storedDate = defaults.objectForKey("current_date_key") as? NSDate {
            if (-1 * storedDate.timeIntervalSinceNow) < 600 {
                savedBillAmount = defaults.doubleForKey("bill_amount_key")
            }
        }
        
        let text = savedBillAmount > 0 ? String(format: "%.2f", savedBillAmount) : String()
        billField.text = text
        billField.becomeFirstResponder()
        if let defaultTipPercentage = defaults.integerForKey("default_tip_percentage") as Int? {
            tipControl.selectedSegmentIndex = defaultTipPercentage
        } else {
            tipControl.selectedSegmentIndex = 1
        }
        if(savedBillAmount > 0) {
            onEditingChanged(nil)
        } else {
            tipLabel.text = "%0.00"
            totalLabel.text = "$0.00"
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onEditingChanged(sender: AnyObject?) {
        var tipPercentages = [0.18, 0.20, 0.22]
        let tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        
        let billAmount = NSString(string: billField.text!).doubleValue
        let tip = billAmount * tipPercentage
        let total = billAmount + tip
        
        tipLabel.text = "$\(tip)"
        totalLabel.text = "$\(total)"
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        
        let currentDate = NSDate()
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setDouble(NSString(string: billField.text!).doubleValue, forKey: "bill_amount_key")
        defaults.setObject(currentDate, forKey: "current_date_key")
        defaults.synchronize()

    }

    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
    
    @IBAction func saveDefaultTip(segue: UIStoryboardSegue) {
        // add logic here to handle a transition back from the
        // settings controller resulting from a user tapping on Save
        let settingsViewController = segue.sourceViewController as! SettingsViewController
        let savedPickerRow = settingsViewController.savedPickerRow
        if savedPickerRow > 0 {
            tipControl.selectedSegmentIndex = savedPickerRow - 1
        }
        else {
            tipControl.selectedSegmentIndex = 1
        }
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setInteger(tipControl.selectedSegmentIndex, forKey: "default_tip_percentage")
        onEditingChanged(nil)
    }
    
    @IBAction func cancelSettings(segue: UIStoryboardSegue) {
    }
    
/*    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "settingsScreenSegue" {
            if let settingsViewController = segue.destinationViewController as? SettingsViewController {
                let defaults = NSUserDefaults.standardUserDefaults()
                let x = defaults.integerForKey("saved_picker_row")
                print ("def saved picker row is \(x)")
                settingsViewController.savedPickerRow = defaults.integerForKey("saved_picker_row")
            }
            
        }
    }*/
    
    
}

