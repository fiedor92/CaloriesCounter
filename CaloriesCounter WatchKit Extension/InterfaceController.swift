//
//  InterfaceController.swift
//  CaloriesCounter WatchKit Extension
//
//  Created by appacmp on 25/07/15.
//  Copyright (c) 2015 appcamp. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {

    var isHidden = false
    var calories = 100
    var caloriesTotal = 0
    @IBOutlet weak var caloriesLabel: WKInterfaceLabel!
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    
    @IBAction func minusButtonTapped() {
        calories = calories - 20
        if(calories < 0){
            calories = 0
        }
        updateScreen()
    }
    @IBAction func plusButtonTapped() {
        calories = calories + 20
        updateScreen()
    }
    @IBAction func addButtonTapped() {
        caloriesTotal = caloriesTotal + calories
    }
    func updateScreen(){
        caloriesLabel.setText("\(calories)")
        sliderOutlet.setValue(Float(calories))
    }
    @IBAction func sliderTapped(value: Float) {
        calories = Int(value)
        updateScreen()
    }
    @IBAction func hideButtonTapped() {
        if (isHidden == true){
            isHidden = false
            hideButton.setTitle("Hide")
        }
        else {
            isHidden = true
            hideButton.setTitle("Show")
        }
        sliderOutlet.setHidden(isHidden)

    }
    @IBOutlet weak var sliderOutlet: WKInterfaceSlider!
    
    
    @IBOutlet weak var hideButton: WKInterfaceButton!
}
