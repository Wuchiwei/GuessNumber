//
//  ViewController.swift
//  GuessNumber
//
//  Created by WU CHIH WEI on 2019/7/6.
//  Copyright © 2019 WU CHIH WEI. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let hintForBiggerNumber = "再大一點，你猜得太小了！"
    
    let hintForSmallerNumber = "再小一點，你猜得太大了！"
    
    let hintForCorrectNumber = "恭喜你猜對了！"
    
    let hintForStartGame = "猜猜數字是多少？"
    
    @IBOutlet weak var hintLabel: UILabel!
    
    @IBOutlet weak var inputTextField: UITextField!
 
    var targetNumber = Int.random(in: 0...100)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("-------")
        print("target number is \(targetNumber)")
        
        addDismissKeyboardGeture()
    }
    
    private func addDismissKeyboardGeture() {
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc func dismissKeyboard() {
        
        if inputTextField.isFirstResponder {
            
            inputTextField.resignFirstResponder()
        }
    }

    @IBAction func compareWithTargetNumber(_ sender: UIButton) {
        
        guard let text = inputTextField.text,
              let number = Int(text)
        else {
            
            hintLabel.text = "請輸入數字！"
            
            return
        }
        
        if number > targetNumber {
            
            hintLabel.text = hintForSmallerNumber
        
        } else if number < targetNumber {
            
            hintLabel.text = hintForBiggerNumber
            
        } else {
            
            hintLabel.text = hintForCorrectNumber
        }
        
    }
    
    @IBAction func reset(_ sender: UIButton) {
        
        hintLabel.text = hintForStartGame
        
        inputTextField.text = ""
        
        targetNumber = Int.random(in: 0...100)
        
        print("-------")
        print("target number is \(targetNumber)")
    }

}

