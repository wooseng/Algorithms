import Foundation

// https://leetcode-cn.com/problems/add-two-numbers/

class ListNode {
    var val: Int
    var next: ListNode?
    init() { self.val = 0; self.next = nil; }
    init(_ val: Int) { self.val = val; self.next = nil; }
    init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
    
    init?(_ val: [Int]) {
        guard !val.isEmpty else {
            return nil
        }
        self.val = val[0]
        self.next = ListNode(Array(val[1...]))
    }
    
    func toArray() -> [Int] {
        var res = [val]
        if let arr = next?.toArray() {
            res.append(contentsOf: arr)
        }
        return res
    }
}

extension Array where Element == Int {
    
    func toListNode() -> ListNode? {
        guard !isEmpty else {
            return nil
        }
        let res = ListNode(self[0])
        var p: ListNode?
        for (idx, val) in enumerated() where idx > 0 {
            p?.next = ListNode(val)
            p = p?.next
        }
        return res
    }
    
}

func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    var l1 = l1, l2 = l2
    var res: ListNode?, p: ListNode?, n = 0
    
    while l1 != nil || l2 != nil {
        let val = (l1?.val ?? 0) + (l2?.val ?? 0) + n
        n = val / 10
        let temp = ListNode(val % 10)
        if res == nil {
            res = temp
            p = temp
        } else {
            p?.next = temp
            p = p?.next
        }
        l1 = l1?.next
        l2 = l2?.next
    }
    if n > 0 {
        p?.next = ListNode(n)
    }
    return res
}


assert(addTwoNumbers(ListNode([2,4,3]), ListNode([5,6,4]))?.toArray() == [7,0,8])
assert(addTwoNumbers(ListNode([0]), ListNode(0))?.toArray() == [0])
assert(addTwoNumbers(ListNode([9,9,9,9,9,9,9]), ListNode([9,9,9,9]))?.toArray() == [8,9,9,9,0,0,0,1])

print("验证通过")
