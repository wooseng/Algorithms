import Foundation

// https://leetcode-cn.com/problems/valid-parentheses/

func isValid(_ s: String) -> Bool {
    // 字符串长度为0，有效
    guard s.count > 0 else {
        return true
    }
    // 字符串长度为奇数，一定存在无法成对的字符
    guard s.count % 2 == 0 else {
        return false
    }
    
    var arr = [String.Element]()
    for char in s {
        // 如果字符为前括号，直接添加到数组即可
        if char == "(" || char == "{" || char == "[" {
            arr.append(char)
            continue
        }
        guard let last = arr.last else {
            // 数组为空，当前元素又是尾括号，必然无法匹配，直接返回 false
            return false
        }
        if (last == "(" && char == ")") || (last == "[" && char == "]") || (last == "{" && char == "}") {
            arr.popLast()
        } else {
            // 当前元素是尾括号，但是不能和前一个元素组成括号对，表示无法正确匹配
            return false
        }
    }
    return arr.isEmpty
}

assert(isValid("()") == true)
assert(isValid("()[]{}") == true)
assert(isValid("(]") == false)
assert(isValid("([)]") == false)
assert(isValid("{[]}") == true)
assert(isValid("([}}])") == false)

print("验证通过")
