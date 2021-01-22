import Foundation

// https://leetcode-cn.com/problems/reverse-integer/

func reverse(_ x: Int) -> Int {
    var x = x, res = 0
    while x != 0 {
        res *= 10
        res += x % 10
        x /= 10
    }
    if res > Int(Int32.max) || res < Int(Int32.min) {
        return 0
    }
    return res
}

assert(reverse(123) == 321)
assert(reverse(-123) == -321)
assert(reverse(120) == 21)
assert(reverse(0) == 0)
assert(reverse(Int(Int32.max)) == 0)

print("验证通过")
