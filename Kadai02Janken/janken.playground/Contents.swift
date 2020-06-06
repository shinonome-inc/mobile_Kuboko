//ジャンケンの手
enum Hand : Int {
    case rock       //0(デフォルト値)
    case scissors   //1
    case paper      //2
}

//ジャンケンの結果
enum Result : Int {
    case draw       //0(デフォルト値)
    case lose       //1
    case win        //2
}

//ジャンケンメソッド
func janken(you: Hand) {
    guard let cp = Hand(rawValue: Int.random(in: 0...2)) else { //cp   0:rock 1:scissors 2:paper
       fatalError("ERROR HAND TYPE")
    }
    guard let result = Result(rawValue: (you.rawValue - cp.rawValue + 3) % 3) else {   //judge    0:draw 1:loss 2:win
        fatalError("ERROR RESULT TYPE")
    }
    print("you: \(you).  cp: \(cp).  you \(result)")
}

janken(you: .rock)
janken(you: .scissors)
janken(you: .paper)

