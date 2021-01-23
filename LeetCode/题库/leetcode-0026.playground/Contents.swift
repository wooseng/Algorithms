import Foundation

// https://leetcode-cn.com/problems/remove-duplicates-from-sorted-array/

func removeDuplicates(_ nums: inout [Int]) -> Int {
    guard nums.count > 1 else {
        return nums.count
    }
    var p = 1
    for (idx, num) in nums.enumerated() where idx > 0 {
        if num != nums[idx - 1] {
            nums[p] = num
            p += 1
        }
    }
    return p
}

var data1 = [1,1]
var data2 = [1,1,2]
var data3 = [0,0,1,1,1,2,2,3,3,4]

assert(removeDuplicates(&data1) == 1)
assert(removeDuplicates(&data2) == 2)
assert(removeDuplicates(&data3) == 5)

print("验证通过")
