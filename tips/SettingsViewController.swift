//
//  SettingsViewController.swift
//  tips
//
//  Created by Dhara Mehta on 3/19/16.
//  Copyright © 2016 codepath. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    @IBOutlet weak var defaultTipPickerView: UIPickerView!
    var pickerDataSource = [" ","18", "20", "22"]
    var savedPickerRow = 2
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.defaultTipPickerView.dataSource = self
        self.defaultTipPickerView.delegate = self
        let defaults = NSUserDefaults.standardUserDefaults()
        savedPickerRow = defaults.integerForKey("saved_picker_row")
        if (savedPickerRow != 0){
            defaultTipPickerView.selectRow(savedPickerRow, inComponent: 0, animated: true)
        } else {
            defaultTipPickerView.selectRow(2, inComponent: 0, animated: true)
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerDataSource.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerDataSource[row]
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        savedPickerRow = row
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setInteger(savedPickerRow, forKey: "saved_picker_row")
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    
}
