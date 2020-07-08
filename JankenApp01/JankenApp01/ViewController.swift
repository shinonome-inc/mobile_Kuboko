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
    @IBOutlet weak var userRockImg: UIButton!
    @IBOutlet weak var userScissorsImg: UIButton!
    @IBOutlet weak var userPaperImg: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //set images animation when starting
        let image01 = UIImage(named: "rock")!
        let image02 = UIImage(named: "scissors")!
        let image03 = UIImage(named: "paper")!
        let handImageArray = [image01, image02, image03]
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
    enum Hand: Int {
        case rock       //0(Default Value)
        case scissors   //1
        case paper      //2
        
        var handString: String! {
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
    enum Result: Int {
        case draw       //0(Default Value)
        case lose       //1
        case win        //2
        
        var toString: String! {
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
        print("you: \(you).  cp: \(cp).  you: \(result)")
        
        cpHandImage.image = UIImage(named: cp.handString)   // set image of cp hand
        judgeMsg.text = "you " + result.toString    //set result message
        
        cpHandImage.stopAnimating()
        
        userRockImg.isEnabled = false
        userScissorsImg.isEnabled = false
        userPaperImg.isEnabled = false
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.cpHandImage.startAnimating()
            self.judgeMsg.text = "JANKEN..."
            self.userRockImg.isEnabled = true
            self.userScissorsImg.isEnabled = true
            self.userPaperImg.isEnabled = true
        }
    }
    
}

