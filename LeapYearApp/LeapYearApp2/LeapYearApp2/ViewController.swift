//
//  ViewController.swift
//  LeapYearApp2
//
//  Created by Koki Kubota on 2020/06/24.
//  Copyright © 2020 Koki Kubota. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    //閏年判定関数(閏年 True , 通常 False)
    func isLeap(year: Int) -> Bool {
        guard year >= 4 else {  //  4以下の場合は処理を中断しFalseを返す
            return false
        }
        return year % 400 == 0 || (year % 100 != 0 && year % 4 == 0)
    }
    
    @IBOutlet weak var result: UILabel!
    @IBOutlet weak var year: UITextField!
    @IBAction func run(_ sender: UIButton) {
        if let y = Int(year.text!) {
            let r = isLeap(year: y)
            if (r == true) {
                result.text = String(y) + " is leap year"
            } else {
                result.text = String(y) + " is not leap year"
            }
        } else {
            print("変換でない")
        }
    }
    
}

