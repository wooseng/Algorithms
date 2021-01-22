import Foundation

// https://leetcode-cn.com/problems/palindrome-number/

func isPalindrome(_ x: Int) -> Bool {
    // 负数不是回文数
    if x < 0 {
        return false
    }
    // 个位数是回文数
    if x < 10 {
        return true
    }
    // 两位以及两位以上的数，如果个位是0，则不会是回文数，因为翻转之后，最高位不能为0
    if x % 10 == 0 {
        return false
    }
    
    var x = x, res = 0
    
    while x > res {
        res = res * 10 + (x % 10)
        x /= 10
    }
    
    return x == res || x == res / 10
}

assert(isPalindrome(4) == true)
assert(isPalindrome(10) == false)
assert(isPalindrome(11) == true)
assert(isPalindrome(121) == true)
assert(isPalindrome(-121) == false)
assert(isPalindrome(10) == false)

print("验证通过")
