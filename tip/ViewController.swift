//
//  ViewController.swift
//  tip
//
//  Created by Ann Alfaro on 9/12/20.
//  Copyright © 2020 Codepath. All rights reserved.
//


import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipLabel: UILabel! // tip total
    @IBOutlet weak var totalLabel: UITextField! // total bill
    @IBOutlet weak var billField: UITextField! // bill amount
    @IBOutlet weak var segmentLabel: UISegmentedControl! //segmentation
    
    // all split controls
    @IBOutlet weak var splitPeopleCount: UILabel!
    @IBOutlet weak var splitSlider: UISlider!
    @IBOutlet weak var splitIndividualTip: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //splitSlider.addTarget(self, action: #selector(splitSliderSliding(slider:)), for: .valueChanged)
    }
    

    @IBAction func onTap(_ sender: Any) {
        self.view.endEditing(true)
    }
   
    @IBAction func calculateTip(_ sender: Any) {
        
        let bill = Double(billField.text!) ?? 0
        let tipPercentages = [0.1, 0.15, 0.2]
        let tip = bill * tipPercentages[segmentLabel.selectedSegmentIndex]
        let total = bill + tip
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        
        // (source) stackoverflow.com in re: using addTarget, firstResponderAction
        // remove keypad when pressing 'enter'
        billField.addTarget(nil, action:Selector(("firstResponderAction:")), for:.editingDidEndOnExit)
        
    }
    
}


