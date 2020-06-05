// enum 列挙型
enum BloodType {
    case ab
    case a
    case b
    case o
}

/*--------------------------------------------------------------*/
/*値型enum*/

let typeAB = BloodType.ab
print(typeAB)

enum Weather: String {
    case sunny = "晴れ"
    case cloudy = "曇り"
    case rain = "雨"
    case snow = "ゆき"
}

let weather: Weather = .rain    // 型が分かっている場合はenum型を省略出来る
weather
weather.rawValue

/*-------------------------------------------------------------*/

enum Signal: Int {
    case blue = 1
    case yellow = 2
    case red = 3
}

let signalYellow1: Signal = .yellow
signalYellow1.rawValue
let signalYellow2: Signal? = Signal(rawValue: 2)
signalYellow2?.rawValue
let signalGreen: Signal? = Signal(rawValue: 4)  // 要素がないためnil

/*-------------------------------------------------------------*/

enum IntEnum: Int {
    case one
    case two
    case three
}
enum BloodType2: String {
    case ab
    case a
    case b
    case o
}

//要素を指定しないと0からインクリメントされる
IntEnum.one.rawValue
IntEnum.two.rawValue
IntEnum.three.rawValue

//要素を指定しないと要素と同じ値の名前
BloodType2.ab.rawValue
BloodType2.a.rawValue
BloodType2.b.rawValue
BloodType2.o.rawValue

/*------------------------------------------------------------------------*/
/*付属型enum　Associated Value*/
enum Barcode {
    case upca(Int, Int, Int, Int)
    case qrcode(String)
}

var productBarcode = Barcode.upca(8, 85909, 51226, 3)
productBarcode = .qrcode("ABCDEFGHIJKLMN")  //一度定義してあるので.qrcodeでOK

/*------------------------------------------------------------------------*/

struct StockTrade { //Stract 構造体　継承のできないクラス。
    enum Trade {    //列挙型
        case buy
        case sell
    }
    
    func order(tradeType: Trade, stock: String, amount: Int) {
        switch tradeType {
        case .buy:
            print("\(stock)株を\(amount)購入する")
        case .sell:
            print("\(stock)株を\(amount)売却する")
        }
    }
}

/*--------------------------------------------------------------------------*/
//Optional型　nil（空）を許容出来る変数
var num: Int?   //  宣言型の後ろに?をつける

/*-------------------------------------------------------*/
enum Device {
    case appleWatch
    static func fromSlang(term: String) -> Device? {
      if term == "iWatch" {
      return .appleWatch
      }
      return nil
    }
}

/*------------------------------------------------------------*/
struct Person {
    // ストアドプロパティ
    var name = "Conan" {
        willSet {
            // プロパティ変更前に実行する
            print("I'm \(self.name). I'll be \(newValue)")
        }
        didSet {
            // プロパティ変更後に実行する
            print("I became \(self.name)")
        }
    }

    func greet() {
        print("I'm \(self.name)")
    }
}

var person = Person()
person.greet()
person.name = "Shinichi"
person.greet()

