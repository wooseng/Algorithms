import Foundation

// https://leetcode-cn.com/problems/remove-element/

func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
    var p = 0
    for num in nums where num != val {
        nums[p] = num
        p += 1
    }
    return p
}

var data1 = [3,2,2,3]
var data2 = [0,1,2,2,3,0,4,2]
assert(removeElement(&data1, 3) == 2)
assert(removeElement(&data2, 2) == 5)

print("验证通过")
