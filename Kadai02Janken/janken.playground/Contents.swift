//ジャンケンの手
enum Hand : Int {
    case rock = 0
    case scissors = 1
    case paper = 2
}

//ジャンケンの結果
enum Result : String {
    case draw = "you draw"
    case lose = "you loss"
    case win = "you win" 
}

//ジャンケンメソッド
func janken(you: Hand) {
    let cp = Int.random(in: 0 ... 2)         //cpHand   0rock 1:scissors 2:paper
    let judge = (you.rawValue - cp + 3) % 3  //judge    0:draw 1:loss 2:win
    
    switch cp {
    case 0:
        print("cp: \(Hand.rock).", terminator:" ")
    case 1:
        print("cp: \(Hand.scissors).", terminator:" ")
    default:
        print("cp: \(Hand.paper).", terminator:" ")
    }
    
    switch judge {
    case 0:
        print(Result.draw.rawValue)
    case 1:
        print(Result.lose.rawValue)
    default:
        print(Result.win.rawValue)
    }
}

janken(you: .rock)
janken(you: .scissors)
janken(you: .paper)

