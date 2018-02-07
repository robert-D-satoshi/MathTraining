//
//  SecondViewController.swift
//  mathtraining
//
//  Created by 山田諭 on 2018/02/04.
//  Copyright © 2018年 satoshi yamada. All rights reserved.
//

import Foundation
import UIKit

class QuizViewController: UIViewController {
  // メンバー変数
  let total: Int = 10 //問題数
  var correct: Int = 0 //正解数
  var questionIndex: Int = 0 //問題の番号
  var answerIndex: Int = 0 //正解の番号
  
  // Mark - IBOutlet
  @IBOutlet var leftNumberLabel: UILabel!
  @IBOutlet var centerNumberLabel: UILabel!
  @IBOutlet var rightNumberLabel: UILabel!
  
  func viewDidLoad() {
    super.viewDidLoad()
    self.setQuestions()
  }
  
  @IBAction func tapped(sender: UIButton) {
    if sender.tag - 1 == answerIndex {
      correct += 1
    }
    questionIndex += 1
    if questionIndex >= total {
      performSelector(inBackground: "QuizToResult", with: nil)
    } else {
      setQuestions()
    }
  }
  
  func setQuestions() {
    // ローカル変数
    let leftNum = Int(arc4random_uniform(10))
    var centerNum = Int(arc4random_uniform(10))
    
    answerIndex = Int(arc4random_uniform(4))
    
    switch answerIndex {
    case 0:
      rightNumberLabel.text =  "\(leftNum +  centerNum)"
    case 1:
      rightNumberLabel.text = "\(leftNum - centerNum)"
    case 2:
      rightNumberLabel.text = "\(leftNum*centerNum)"
    default:
      if centerNum == 0 {
        centerNum = 1
      }
      rightNumberLabel.text =  "\(leftNum/centerNum)"
    }
    leftNumberLabel.text = "\(leftNum)"
    centerNummberLabel.text = "\(centerNum)"
  }
}
