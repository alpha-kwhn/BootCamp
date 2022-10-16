//
//  ViewController.swift
//  CompleteCalc
//
//  Created by 김응관 on 2022/10/14.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var AnswerLabel: UILabel!
    
    var status: Bool = false
    var eraser: Bool = true
    var results = 0
    var firstValue: Double? = 0.0

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func AllClear(_ sender: UIButton) {
        if AnswerLabel.text != "0" {
            sender.titleLabel?.text = "AC"
            AnswerLabel.text? = "0"
        }
    }
    
    @IBAction func SignChange(_ sender: UIButton) {
        if AnswerLabel.text! != "0"{
            if AnswerLabel.text!.hasPrefix("-") {
                AnswerLabel.text!.removeFirst()
            }
            else {
                AnswerLabel.text! = "-" + AnswerLabel.text!
            }
        }
    }
    
    @IBAction func Calculate(_ sender: UIButton){
        let operates = sender.currentTitle!
        //레이블에 적혀 있는 값들 저장
        firstValue = Double(AnswerLabel.text!)
        status = true
        
        switch operates {
        case "+":
            results = 1
        case "-":
            results = 2
        case "X":
            results = 3
        case "/":
            results = 4
        default:
            print("you must choose operator")
        }
    }
    
    @IBAction func NumPad(_ sender: UIButton) {
        // 버튼에 적힌 숫자를 number 변수로 가져온다
        let number = sender.currentTitle!
        
        // 가져온 숫자를 출력
        if status == false {
            //연산자를 누르지 않은 상태
            if AnswerLabel.text == "0" {
                //텍스트 값이 0이라면
                AnswerLabel.text = number
                //그 값을 지우고 누른 키패드 숫자 값을 넣어주고
            } else {
                //텍스트 값이 0이 아니라면
                AnswerLabel.text! += number
                //적혀 있던 숫자에 새로 누른 키패드 숫자 값을 덧붙여준다
            }
        } else {
            if eraser == true {
                AnswerLabel.text! = ""
            }
            //연산자를 누른 상태라면 (두번째 피연산자 값)
            if AnswerLabel.text == "0" {
                //텍스트 값이 0이라면
                AnswerLabel.text = number
                //그 값을 지우고 누른 키패드 숫자 값을 넣어주고
                eraser = false
            } else {
                //텍스트 값이 0이 아니라면
                AnswerLabel.text! += number
                //적혀 있던 숫자에 새로 누른 키패드 숫자 값을 덧붙여준다
                eraser = false
            }
        }
    }
    
    @IBAction func Point(_ sender: UIButton) {
        AnswerLabel.text = AnswerLabel.text! + "."
    }
    
    @IBAction func Result(_ sender: UIButton) {
        status = false
        var tmp: Double? = 0.0
        
        switch results {
        case 1:
            tmp = firstValue! + (Double(AnswerLabel.text!) ?? 0.0)
        case 2:
            tmp = firstValue! - (Double(AnswerLabel.text!) ?? 0.0)
        case 3:
            tmp = firstValue! * (Double(AnswerLabel.text!) ?? 0.0)
        case 4:
            tmp = firstValue! / (Double(AnswerLabel.text!) ?? 0.0)
        default:
            print("error")
        }
        firstValue = tmp
        eraser = true
        
        AnswerLabel.text = ("\(tmp!)".contains(".") ? String(format: "%.8f", tmp!) : "\(Int(tmp!))")
    }
}

