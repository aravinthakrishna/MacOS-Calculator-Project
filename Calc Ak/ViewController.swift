//
//  ViewController.swift
//  Ak Calc
//
//  Created by DSU 22 on 01/09/26.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var DisplayBar: UITextField!
    
    var firstNumber = 0.0
    var operation = ""
    var newNumber = true
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        DisplayBar.text = "0"
    }
    
    @IBAction func ButtonPressedAC(_ sender: UIButton) {
        DisplayBar.text = "0"
    }
    
    @IBAction func ButtonPressedC(_ sender: Any) {
        DisplayBar.text = "0"
    }
    @IBAction func NumberPressedZero(_ sender: UIButton) {
        DisplayBar.text = "0"
    }
    
    @IBAction func NumberPressedOne(_ sender: UIButton) {
        DisplayBar.text = "1"
    }
    
    @IBAction func ButtonPressed(_ sender: UIButton) {
        guard let title = sender.titleLabel?.text else { return }
                
                
                if title == "±" {
                        let number = Double(DisplayBar.text ?? "0") ?? 0
                        DisplayBar.text = String(-number)
                        return
                    }
                if title == "Del" {
                    if let text = DisplayBar.text, text.count > 1 {
                        DisplayBar.text = String(text.dropLast())
                    } else {
                        DisplayBar.text = "0"
                        newNumber = true
                    }
                    return
                }
                
                if title == "." {
                    if !(DisplayBar.text ?? "").contains(".") {
                        DisplayBar.text = (DisplayBar.text ?? "0") + "."
                        newNumber = false
                    }
                    return
                }
                
                    if title == "+" || title == "-" || title == "−" || title == "×" || title == "÷" {
                        firstNumber = Double(DisplayBar.text ?? "0") ?? 0
                        operation = title
                        newNumber = true
                        return
                    }

                    
                    if title == "=" {
                        let secondNumber = Double(DisplayBar.text ?? "0") ?? 0
                        var result = 0.0

                        if operation == "+" {
                            result = firstNumber + secondNumber
                        } else if operation == "−" || operation == "-" {
                            result = firstNumber - secondNumber
                        }else if operation == "×" {
                            result = firstNumber * secondNumber
                        } else if operation == "÷" {
                            result = firstNumber / secondNumber
                        }

                        
                        if result.truncatingRemainder(dividingBy: 1) == 0 {
                            DisplayBar.text = String(Int(result))
                        } else {
                            DisplayBar.text = String(result)
                        }

                        newNumber = true
                        return
                    }

                    
                    if newNumber {
                        DisplayBar.text = title
                        newNumber = false
                    } else {
                        DisplayBar.text = (DisplayBar.text ?? "") + title
                    }
                }
        }
