func isLeap(year: Int) -> Bool {
    guard year >= 4 else {  //  4以下の場合は処理を中断しFalseを返す
        return false
    }
    return year % 400 == 0 || (year % 100 != 0 && year % 4 == 0)
}

print(isLeap(year: 2000))
print(isLeap(year: 1209))
print(isLeap(year: 1980))
print(isLeap(year: 1790))
print(isLeap(year: 1993))

