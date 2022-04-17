//
//  ViewController.swift
//  What is the number?
//
//  Created by Wei Chu on 2022/4/11.
//

import UIKit

class ViewController: UIViewController {
    //隨機生成亂數
    var answer = Int.random(in: 1...100)
    var maxNumber = 100
    var minNumber = 1
    var isOver = false
    
    @IBOutlet weak var messageLabel: UILabel!
    
    @IBOutlet weak var inputTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //開啟程式後,自動讓鍵盤彈出
//        inputTextField.becomeFirstResponder()
    }
    
    
    @IBAction func makeAGuess(_ sender: UIButton) {
        print(answer)
        
        //取得輸入值
        let inputText = inputTextField.text!
        //將輸入值轉成int型別
        let inputNumber = Int(inputText)
        
        //猜完後清空
        inputTextField.text = ""
        
        if isOver == false{
            
            //先判斷是否有輸入值
            if inputNumber == nil {
                messageLabel.text = "No input! Please take a number between 1~100."
            }else{
                if inputNumber! > maxNumber{
                    messageLabel.text = "Too large! Please take a number between 1~100."
                }else if inputNumber! < minNumber{
                    messageLabel.text = "Too small! Please take a number between 1~100."
                }else{
                    if inputNumber! == answer{
                        isOver = true
                        messageLabel.text = "Bingo!!! You are right! Press [Guess] to play again."
                    }else{
                        if inputNumber! > answer{
                            maxNumber = inputNumber!
                        }else if inputNumber! < answer{
                            minNumber = inputNumber!
                        }
                        messageLabel.text = "Try again! the answer between \(minNumber)~\(maxNumber)"
                    }
                }
            }
        }else{
            maxNumber = 100
            minNumber = 1
            messageLabel.text = "Guess a number between 1 to 100"
            answer = Int.random(in: 1...100)
            isOver = false
            
        }
        
        
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
}

