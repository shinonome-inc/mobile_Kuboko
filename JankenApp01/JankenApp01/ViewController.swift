//
//  ViewController.swift
//  JankenApp01
//
//  Created by Koki Kubota on 2020/06/26.
//  Copyright © 2020 Koki Kubota. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var judgeMsg: UILabel!
    @IBOutlet weak var cpHandImage: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //set images animation when starting
        let image01 = UIImage(named: "rock")!
        let image02 = UIImage(named: "scissors")!
        let image03 = UIImage(named: "paper")!
        let handImageArray : Array<UIImage> = [image01, image02, image03]
        cpHandImage.animationImages = handImageArray
        cpHandImage.animationDuration = 0.2
        cpHandImage.startAnimating()
        judgeMsg.text = "JANKEN..."    //set result message
    }

    @IBAction func userRock(_ sender: UIButton) {
        janken(you: .rock)
    }
    @IBAction func userScissors(_ sender: UIButton) {
        janken(you: .scissors)
    }
    @IBAction func userPaper(_ sender: UIButton) {
        janken(you: .paper)
        
    }
    
    
    //Janken Hand
    enum Hand : Int {
        case rock       //0(Default Value)
        case scissors   //1
        case paper      //2
        
        var handString : String! {
            switch self {
            case .rock:
                return "rock"
            case .scissors:
                return "scissors"
            case .paper:
                return "paper"
            }
        }
    }

    //Janken Result
    enum Result : Int {
        case draw       //0(Default Value)
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

    //Janken Method
    func janken(you: Hand) {
        guard let cp = Hand(rawValue: Int.random(in: 0...2)) else { //cp   0:rock 1:scissors 2:paper
           fatalError("ERROR HAND TYPE")
        }
        guard let result = Result(rawValue: (you.rawValue - cp.rawValue + 3) % 3) else {   //judge    0:draw 1:loss 2:win
            fatalError("ERROR RESULT TYPE")
        }
        print("you: \(you).  cp: \(cp).  you \(result)")
        
        let image = UIImage(named: cp.handString)   // set image of cp hand
        cpHandImage.image = image
        
        judgeMsg.text = "you " + result.toString    //set result message
        cpHandImage.stopAnimating()
        Timer.scheduledTimer(timeInterval: 3, target: self, selector: #selector(ViewController.viewDidLoad),userInfo: nil,repeats: false)
    }
    
}

