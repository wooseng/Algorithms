import Foundation

public class ListNode {
    
    public var val: Int
    
    public var next: ListNode?
    
    public init() {
        self.val = 0
        self.next = nil
    }
    
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
    
    public init(_ val: Int, _ next: ListNode?) {
        self.val = val
        self.next = next
    }
    
    func toArray() -> [Int] {
        var arr = [Int]()
        var t: ListNode? = self
        while t != nil {
            arr.append(t!.val)
            t = t?.next
        }
        return arr
    }
    
}

extension Array where Element == Int {
    
    func toListNode() -> ListNode? {
        guard count > 0 else {
            return nil
        }
        let node = ListNode(self[0])
        var p: ListNode? = node
        for (i, v) in enumerated() where i > 0 {
            p?.next = ListNode(v)
            p = p?.next
        }
        return node
    }
    
}

func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    var l1 = l1, l2 = l2
    var result: ListNode?
    var pointer: ListNode?
    while l1 != nil || l2 != nil {
        if let v1 = l1?.val, let v2 = l2?.val {
            // l1与l2均存在
            if v1 < v2 {
                let temp = ListNode(v1)
                if result == nil {
                    result = temp
                    pointer = temp
                } else {
                    pointer?.next = temp
                    pointer = pointer?.next
                }
                l1 = l1?.next
            } else if v1 > v2 {
                let temp = ListNode(v2)
                if result == nil {
                    result = temp
                    pointer = temp
                } else {
                    pointer?.next = temp
                    pointer = pointer?.next
                }
                l2 = l2?.next
            } else {
                let t1 = ListNode(v1)
                let t2 = ListNode(v2, t1)
                if result == nil {
                    result = t2
                    pointer = t1
                } else {
                    pointer?.next = t2
                    pointer = pointer?.next?.next
                }
                l1 = l1?.next
                l2 = l2?.next
            }
        } else if l1 != nil {
            // l1 不为空，l2 为空
            if result == nil {
                result = l1
            } else {
                pointer?.next = l1
            }
            break
        } else if l2 != nil {
            // l1 为空，l2 不为空
            if result == nil {
                result = l2
            } else {
                pointer?.next = l2
            }
            break
        }
    }
    return result
}

assert(mergeTwoLists([1,2,4].toListNode(), [1,3,4].toListNode())?.toArray() == [1,1,2,3,4,4])
assert(mergeTwoLists(nil, nil)?.toArray() == nil)
assert(mergeTwoLists(nil, [0].toListNode())?.toArray() == [0])

print("验证通过")

