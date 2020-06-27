//
//  ViewController.swift
//  JankenApp01
//
//  Created by Koki Kubota on 2020/06/26.
//  Copyright © 2020 Koki Kubota. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var cpHand: UILabel!
    @IBOutlet weak var judgeMsg: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //displayHandType()
    }

    @IBAction func userRock(_ sender: UIButton) {
        let result = janken(you: .rock)
        judgeMsg.text = "you " + result.resultText.toString
        cpHand.text = result.resultCpHand.handEmoji
        
    }
    @IBAction func userScissors(_ sender: UIButton) {
        let result = janken(you: .scissors)
        judgeMsg.text = "you " + result.resultText.toString
        cpHand.text = result.resultCpHand.handEmoji
    }
    @IBAction func userPaper(_ sender: UIButton) {
        let result = janken(you: .paper)
        judgeMsg.text = "you " + result.resultText.toString
        cpHand.text = result.resultCpHand.handEmoji
    }
    
    //ジャンケンの手
    enum Hand : Int {
        case rock       //0(デフォルト値)
        case scissors   //1
        case paper      //2
        
        var handEmoji : String! {
            switch self {
            case .rock:
                return "✊"
            case .scissors:
                return "✌️"
            case .paper:
                return "🖐"
            }
        }
    }

    //ジャンケンの結果
    enum Result : Int {
        case draw       //0(デフォルト値)
        case lose       //1
        case win        //2
        
        var toString : String! {
            switch self {
            case .draw:
                return "draw"
            case .lose:
                return "lose"
            case .win:
                return "win"
            }
        }
    }

    //ジャンケンメソッド
    func janken(you: Hand) -> (resultCpHand: Hand, resultText: Result){
        guard let cp = Hand(rawValue: Int.random(in: 0...2)) else { //cp   0:rock 1:scissors 2:paper
           fatalError("ERROR HAND TYPE")
        }
        guard let result = Result(rawValue: (you.rawValue - cp.rawValue + 3) % 3) else {   //judge    0:draw 1:loss 2:win
            fatalError("ERROR RESULT TYPE")
        }
        print("you: \(you).  cp: \(cp).  you \(result)")
        return (cp, result)
    }
    

    
/*
    func displayHandType() {
        while true {
            cpHand.text = "✊"
            Thread.sleep(forTimeInterval: 0.1)
            cpHand.text = "✌️"
            Thread.sleep(forTimeInterval: 0.1)
            cpHand.text = "🖐"
            Thread.sleep(forTimeInterval: 0.1)
        }
        
    }
 */
    
    
    
    

    
    
    

}

