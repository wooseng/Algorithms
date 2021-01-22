import Foundation

// https://leetcode-cn.com/problems/two-sum/

func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
    var map = [Int: Int]()
    for (idx, num) in nums.enumerated() {
        if let i = map[num] {
            return [i, idx]
        }
        map[target - num] = idx
    }
    return nums
}

assert(twoSum([2, 7, 11, 15], 9) == [0, 1])
assert(twoSum([3, 2, 4], 6) == [1, 2])
assert(twoSum([3, 3], 6) == [0, 1])

print("验证通过")
