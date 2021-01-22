import Foundation

// https://leetcode-cn.com/problems/roman-to-integer/

func romanToInt(_ s: String) -> Int {
    let map: [String: Int] = [
        "I"  : 1,
        "IV" : 4,
        "V"  : 5,
        "IX" : 9,
        "X"  : 10,
        "XL" : 40,
        "L"  : 50,
        "XC" : 90,
        "C"  : 100,
        "CD" : 400,
        "D"  : 500,
        "CM" : 900,
        "M"  : 1000
    ]
    var res = 0, lastStr: String?
    for char in s {
        let str_cur = String(char)
        guard let str_last = lastStr else {
            lastStr = str_cur
            continue
        }
        let key = str_last + str_cur
        if let num = map[key] {
            res += num
            lastStr = nil
        } else if let num = map[str_last] {
            res += num
            lastStr = str_cur
        }
    }
    
    if let key = lastStr, let num = map[key] {
        res += num
    }
    
    return res
}

assert(romanToInt("III") == 3)
assert(romanToInt("IV") == 4)
assert(romanToInt("IX") == 9)
assert(romanToInt("LVIII") == 58)
assert(romanToInt("MCMXCIV") == 1994)

print("验证通过")
