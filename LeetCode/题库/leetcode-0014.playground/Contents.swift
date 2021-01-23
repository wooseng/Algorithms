import Foundation

// https://leetcode-cn.com/problems/longest-common-prefix/

func longestCommonPrefix(_ strs: [String]) -> String {
    // 1. 传入字符串长度小于2的情况下不需要比较，直接返回第一个元素，如果没有，则为空字符串
    guard strs.count > 1 else {
        return strs.first ?? ""
    }

    // 最长公共前缀，默认第一个元素
    var prefix = strs[0]

    // 2. 遍历除第一个元素以外的所有元素，与现有公共前缀进行比较，得出最新的公共前缀
    for str in strs[1...] {
        var temp = ""
        // 获取遍历字符串的长度，即待比较的字符串最小的长度
        let len = min(str.count, prefix.count)
        for i in 0 ..< len {
            let idx_start = str.index(str.startIndex, offsetBy: i)
            let idx_end = str.index(idx_start, offsetBy: 1)

            let char_1 = str[idx_start ..< idx_end]
            let char_2 = prefix[idx_start ..< idx_end]
            guard char_1 == char_2 else {
                break
            }
            temp.append(contentsOf: char_1)
        }
        prefix = temp
        if temp.count == 0 {
            break
        }
    }

    return prefix
}

assert(longestCommonPrefix(["flower","flow","flight"]) == "fl")
assert(longestCommonPrefix(["dog","racecar","car"]) == "")

print("验证通过")
