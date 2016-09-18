//
//  ViewController.swift
//  Tip Calculator
//
//  Created by Ashish Keshan on 9/13/16.
//  Copyright © 2016 Ashish Keshan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var firstView: UIView!
    @IBOutlet var secondView: UIView!
    @IBOutlet var tipLabel: UILabel!
    
    @IBOutlet var totalLabel: UILabel!
    
    @IBOutlet var billField: UITextField!
    
    var numPeople = 1
    
    @IBOutlet var splitField: UILabel!
    @IBOutlet var tipControl: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        secondView.alpha = 0
        
        tipControl.alpha = 0
        
        billField.becomeFirstResponder()
        
        firstView.center = super.view.center
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        let defaults = NSUserDefaults.standardUserDefaults()
        let percentSetting = defaults.integerForKey("tip_percent")
        
        numPeople = defaults.integerForKey("num_people")
        
        tipControl.selectedSegmentIndex = percentSetting
        
        self.calculateTip(self)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   
    @IBAction func tapGesture(sender: AnyObject) {
        view.endEditing(true)
    }

    @IBAction func calculateTip(sender: AnyObject) {
        
        //tipControl.selectedSegmentIndex = index
        
        
        if billField.text != "" {
            UIView.animateWithDuration(0.5, animations: {
                self.firstView.frame = CGRect(x: 0, y: 65, width: 320, height: 180)
                self.secondView.alpha = 1
                self.tipControl.alpha = 1
                
            })
        }
        else {
            UIView.animateWithDuration(0.5, animations: {
                self.firstView.center = super.view.center
                self.secondView.alpha = 0
                self.tipControl.alpha = 0
            })
        }
        
        let tipPercentages = [0.15, 0.2, 0.25]
        
        let bill = Double(billField.text!) ?? 0
        let tip = bill*tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        
        let splitVal = total/Double(numPeople)
        
        splitField.text = String(format: "$%.2f", splitVal)
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        billField.endEditing(true)
    }

}

