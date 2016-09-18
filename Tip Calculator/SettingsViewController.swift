//
//  SettingsViewController.swift
//  Tip Calculator
//
//  Created by Ashish Keshan on 9/13/16.
//  Copyright © 2016 Ashish Keshan. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet var picker: UIPickerView!
    var pickerData: [String] = [String]()

    @IBOutlet var tipPercentage: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.picker.delegate = self
        self.picker.dataSource = self
        
        // Input data into the Array:
        pickerData = ["0 people", "1 person", "2 people", "3 people", "4 people"]

    }
    
    override func viewWillAppear(animated: Bool) {
        let defaults = NSUserDefaults.standardUserDefaults()
        let percentIndex = defaults.integerForKey("tip_percent")
        tipPercentage.selectedSegmentIndex = percentIndex
        let numPeople = defaults.integerForKey("num_people")
        picker.selectRow(numPeople-1, inComponent: 0, animated: true)
    }
    
    @IBAction func tipPercentChanged(sender: AnyObject) {
        
        let defaults = NSUserDefaults.standardUserDefaults()
        let index = tipPercentage.selectedSegmentIndex
        
        defaults.setInteger(index, forKey: "tip_percent")
        defaults.synchronize()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // The number of rows of data
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    // The data to return for the row and component (column) that's being passed in
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setInteger(row+1, forKey: "num_people")
        return pickerData[row]
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
