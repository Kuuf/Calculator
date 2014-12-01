//
//  ViewController.swift
//  Calculator
//
//  Created by Jacob on 11/28/14.
//  Copyright (c) 2014 Jacob. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    @IBOutlet weak var button5: UIButton!
    @IBOutlet weak var button6: UIButton!
    @IBOutlet weak var button7: UIButton!
    @IBOutlet weak var button8: UIButton!
    @IBOutlet weak var button9: UIButton!
    @IBOutlet weak var buttonC: UIButton!
    @IBOutlet weak var button0: UIButton!
    @IBOutlet weak var buttonDecimal: UIButton!
    @IBOutlet weak var buttonPlus: UIButton!
    @IBOutlet weak var buttonMinus: UIButton!
    @IBOutlet weak var buttonEquals: UIButton!
    @IBOutlet weak var answerText: UILabel!

    
    @IBOutlet weak var countDisplay: UILabel!
    @IBOutlet weak var buildTextDisplay: UILabel!
    @IBOutlet weak var tempBuildDisplay: UILabel!
    @IBOutlet weak var opCountDisplay: UILabel!
    
    
    var answer:Int = 0
    var count = 0
    var opCount = 0
    var numPressed = ""
    var op:String = ""
    var buildText = ""
    var tempBuild = ""
    var plusCount = 0
    var minusCount = 0
    var decimalCount = 0
    var equalsCount = 0
    var isActive:Bool
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func button1(sender: UIButton) {
        if !isActive{
            count += 1
            isActive = true
        }
        numPressed = "1"
        buildText += "1"
        self.answerText.text = String(buildText)
        toAnswerText()
        updateData()
        eraseOperatorCount()
        
    }
    @IBAction func button2(sender: UIButton) {
        if !isActive{
            count += 1
            isActive = true
        }
        numPressed = "2"
        buildText += "2"
        self.answerText.text = String(buildText)
        toAnswerText()
        updateData()
        eraseOperatorCount()
    }
    @IBAction func button3(sender: UIButton) {
        if !isActive{
            count += 1
            isActive = true
        }
        numPressed = "3"
        buildText += "3"
        self.answerText.text = String(buildText)
        toAnswerText()
        updateData()
        eraseOperatorCount()
    }
    @IBAction func buttonPlus(sender: UIButton) {
        opCount += 1
     
        op = "+"
        plusCount+=1
        
        if plusCount<=1 {
           toAnswerText()
        }
        else {
          updateData()
        }
        let isActive = false
    }
    @IBAction func buttonEquals(sender: UIButton) {
        opCount += 1
        
        op = "="
        equalsCount+=1
        
        if equalsCount<=1 {
            toAnswerText()
        }
        else {
            updateData()
        }
    }
    @IBAction func buttonMinus(sender: UIButton) {
        opCount += 1
        
        op = "-"
        minusCount+=1
      
        if minusCount<=1 {
            toAnswerText()
        }
        else {
            updateData()
        }
    }
    @IBAction func buttonC(sender: UIButton) {
        count = 0
        buildText = ""
        self.answerText.text = String("")
        eraseData()
        updateData()
        eraseOperatorCount()
    }

    func toAnswerText(){
        var op2 = ""
        
        if count>1 && opCount<2{
            if op == "+"{
    
                tempBuild = String(buildText.toInt()! + tempBuild.toInt()!)
                self.answerText.text = String(tempBuild)
           
                buildText = ""
                updateData()
                eraseOperatorCount()
            }
            if op == "-"{
                answer = tempBuild.toInt()! - buildText.toInt()!
                self.answerText.text = String(answer)
                tempBuild = String(answer)
                buildText = ""
                updateData()
                eraseOperatorCount()
            }
            if op == "="{
                count = 0
            }
        }
        if count>1 && opCount>1{
            self.answerText.text = String(tempBuild)
            updateData()
        }
        if count==1 && opCount == 1{
            tempBuild = buildText
            buildText = ""
            updateData()
        }
        else{
            updateData()
        }
    }
    func updateData(){
        self.countDisplay.text = "Count = " + String(count)
        self.buildTextDisplay.text = "buildText = " + String(buildText)
        self.tempBuildDisplay.text = "tempBuild = " + String(tempBuild)
        self.opCountDisplay.text = "opCount = " + String(opCount)
    }
 
    func eraseOperatorCount(){
        plusCount = 0
        minusCount = 0
        decimalCount = 0
        equalsCount = 0
    }
   
    func eraseData(){
        opCount = 0
        count = 0
        buildText = ""
        tempBuild = ""
    }
}

