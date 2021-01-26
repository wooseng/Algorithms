import Foundation

// https://leetcode-cn.com/problems/number-of-equivalent-domino-pairs/

func numEquivDominoPairs(_ dominoes: [[Int]]) -> Int {
    guard dominoes.count > 1 else {
        return 0
    }
    var arr = Array<Int>(repeating: 0, count: 100)
    var res = 0
    dominoes.forEach {
        let a = $0[0], b = $0[1]
        let val = a <= b ? a * 10 + b : b * 10 + a
        res += arr[val]
        arr[val] += 1
    }
    return res
}

assert(numEquivDominoPairs([[1,2],[2,1],[3,4],[5,6]]) == 1)
assert(numEquivDominoPairs([[1,2],[1,2],[1,1],[1,2],[2,2]]) == 3)

print("验证通过")
