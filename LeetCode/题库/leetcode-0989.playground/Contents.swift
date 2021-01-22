import Foundation

/// https://leetcode-cn.com/problems/add-to-array-form-of-integer/

func addToArrayForm(_ A: [Int], _ K: Int) -> [Int] {
    var res = [Int]()
    var idx = A.count - 1
    var K = K, raise = 0
    
    while K > 0 || idx >= 0 {
        let v = K % 10
        var n = v + raise
        if idx >= 0 {
            n += A[idx]
        }
        raise = n / 10
        n %= 10
        res.append(n)
        K /= 10
        idx -= 1
    }
    
    if raise != 0 {
        res.append(raise)
    }
    
    return res.reversed()
}

assert(addToArrayForm([1, 2, 0, 0], 34) == [1, 2, 3, 4])
assert(addToArrayForm([2, 7, 4], 181) == [4, 5, 5])
assert(addToArrayForm([2, 1, 5], 806) == [1, 0, 2, 1])
assert(addToArrayForm([9, 9, 9, 9, 9, 9, 9, 9, 9, 9], 1) == [1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0])
print("验证通过")
