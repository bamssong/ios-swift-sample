//
//  ViewController.swift
//  UpDownGame
//
//  Created by anseungjin on 2015. 8. 19..
//  Copyright (c) 2015년 bamssong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let MAX_QUESTION_COUNT = 5
    let INIT_QUESTION_COUNT = 0
    var questionCount = 0
    
    let TYPE_1_10 = 0,TYPE_1_50 = 1, TYPE_1_100 = 2
    var selectedType = 0
    var value : Int!
    
    let DOWN = -1, SAME = 0, UP = 1

    @IBOutlet weak var stateCountLabel: UILabel!
    @IBOutlet weak var stateCountProgress: UIProgressView!
    @IBOutlet weak var answersLabel: UILabel!
    
    @IBOutlet weak var inputLabel: UITextField!
    
    
    @IBAction func handleClickButton(sender: UIButton){
        //check bingo
        if let value = inputLabel.text.toInt() {
            let state = checkValue(value)
            if state == UP {
                answersLabel.text = "UP"
            } else if state == DOWN {
                answersLabel.text = "DOWN"
            } else {
                showDialog(title: "정답", msg: "다시할래요? - 정답은 \(value)")
                return
            }
        }
        
        //check state
        let contiune = nextQuestion()
        if contiune == false {
            //game over -> show
            showDialog(title: "실패", msg: "정답은 \(value)")
        }
        
        inputLabel.text = ""
    }
    
    @IBAction func handleClickGameOptionSegmentedControl(sender: UISegmentedControl) {
        initGame(sender.selectedSegmentIndex);
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initGame(TYPE_1_10);
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    
    func initGame(index : Int){
        selectedType = index
        updateStateCount(INIT_QUESTION_COUNT)
        inputLabel.text = ""
        answersLabel.text = "선택을 기다리고 있어요.."
        
        value = initRandomValue()
    }
    
    func initRandomValue() -> Int {
        var type = arc4random_uniform(100)
        if selectedType == TYPE_1_10 {
            type = arc4random_uniform(10)
        } else if selectedType == TYPE_1_50 {
            type = arc4random_uniform(50)
        }
 
        return Int(type) + 1
    }
    
    func getMaxValue() -> Int32 {
        if selectedType == TYPE_1_10 {
            return 10
        } else if selectedType == TYPE_1_50 {
            return 50
        }
        return 100
    }
    
    func checkValue(question : Int) -> Int {
        if question < value {
            return UP
        } else if question > value {
            return DOWN
        }
     
        return SAME;
    }
    
    func nextQuestion() -> Bool{
        questionCount++
        updateStateCount(questionCount)
        
        if questionCount >= MAX_QUESTION_COUNT {
            return false
        }
        return true
    }
    
    
    func updateStateCount(questionCount : Int){
        self.questionCount = questionCount
        stateCountLabel.text = "\(questionCount)/\(MAX_QUESTION_COUNT)"

        stateCountProgress.setProgress(Float(questionCount)/Float(MAX_QUESTION_COUNT), animated: true)
    }
    
    
    func showDialog(#title: String,msg : String){
        let dialog = UIAlertController(title: title, message: msg, preferredStyle: UIAlertControllerStyle.Alert)
    
        let okAction = UIAlertAction(title: "확인", style: UIAlertActionStyle.Default, handler: {(action) -> Void in
            self.initGame(self.selectedType)
        })
        
        dialog.addAction(okAction)
        self.presentViewController(dialog, animated: true, completion: nil)
    }
    
}

