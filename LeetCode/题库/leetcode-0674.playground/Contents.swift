import Foundation

// https://leetcode-cn.com/problems/longest-continuous-increasing-subsequence/

func findLengthOfLCIS(_ nums: [Int]) -> Int {
    var res = 0, p = 0, last = Int.min
    for (idx, num) in nums.enumerated() {
        defer {
            last = num
        }
        guard num <= last else {
            continue
        }
        res = max(res, idx - p)
        p = idx
    }
    if p < nums.count {
        res = max(res, nums.count - p)
    }
    return res
}

assert(findLengthOfLCIS([1]) == 1)
assert(findLengthOfLCIS([1,3,5,4,7]) == 3)
assert(findLengthOfLCIS([2,2,2,2,2]) == 1)
assert(findLengthOfLCIS([2,2,2,2,3]) == 2)
assert(findLengthOfLCIS([1,3,5,7]) == 4)

print("验证通过")
