//
//  ViewController.swift
//  Tip Calculator
//
//  Created by Eduardo Prats on 1/28/16.
//  Copyright © 2016 edprats. All rights reserved.
//
//  https://www.snip2code.com/Snippet/238097/iOS---Swift---Add-a-Done-button-to-a-Key

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var tipTextField: UITextField!
    @IBOutlet weak var uiSlider: UISlider!

    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!

    var bill = Bill()
    
    override func viewWillAppear(animated: Bool) {
        uiSlider.minimumValue = 10.0
        uiSlider.maximumValue = 50.0
        
        bill.tip = 10.00
        self.tipTextField.delegate = self
    }
    

    @IBAction func uiSliderChanged(sender: UISlider) {
        bill.tip = Double(sender.value)
        tipLabel.text = "Tip " + String(format: "%.2f", bill.tip)
        updateComputedLabels()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bill.subtotal = Double(tipTextField.text!)!
    }
    
    func endEditingNow() {
        bill.subtotal = Double(tipTextField.text!) ?? 0.00
        updateComputedLabels()
        
        self.view.endEditing(true)
    }
    
    // update labels
    func updateComputedLabels() {
        tipAmountLabel.text = String(format: "%.2f", bill.tipTotal)
        totalLabel.text = String(format: "%.2f", bill.total)
    }
    
    
    // TEXT DELEGATE
    func textFieldShouldBeginEditing(textField: UITextField) -> Bool {
        // create a button bar for the number pad
        let keyboardDoneButtonView = UIToolbar()
        keyboardDoneButtonView.sizeToFit()
        
        // setup the buttons to be in the system
        let item = UIBarButtonItem(title: "Done", style: UIBarButtonItemStyle.Done, target: self, action: Selector("endEditingNow"))
        let toolbarButtons = [item]
        
        // put the buttons into the toolbar and display the toolbar
        keyboardDoneButtonView.setItems(toolbarButtons, animated: false)
        textField.inputAccessoryView = keyboardDoneButtonView
        
        return true
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        resign()
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        resign()
        return true
    }
    
    func resign() {
        self.resignFirstResponder()
    }
    
}

