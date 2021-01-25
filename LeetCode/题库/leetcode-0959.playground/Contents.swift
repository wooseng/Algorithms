import Foundation

// https://leetcode-cn.com/problems/regions-cut-by-slashes/

// 此算法是根据官方的「并查集」算法翻译过来的，我其实并没有搞懂这个，需要后期研究之后重新写一下

func find(f: inout [Int], x: Int) -> Int {
    guard f[x] != x else {
        return x
    }
    let fa = find(f: &f, x: f[x])
    f[x] = fa
    return fa
}

func merge(f: inout [Int], x: Int, y: Int) {
    let fx = find(f: &f, x: x)
    let fy = find(f: &f, x: y)
    f[fx] = fy
}

func regionsBySlashes(_ grid: [String]) -> Int {
    let n = grid.count
    var f = [Int]()
    for i in 0 ..< (n * n * 4) {
        f.append(i)
    }
    
    for i in 0 ..< n {
        let str = grid[i]
        for j in 0 ..< n {
            let idx = i * n + j
            if i < n - 1 {
                merge(f: &f, x: idx * 4 + 2, y: (idx + n) * 4)
            }
            if j < n - 1 {
                merge(f: &f, x: idx * 4 + 1, y: (idx + 1) * 4 + 3)
            }
            let idx_j = str.index(str.startIndex, offsetBy: j)
            if str[idx_j] == "/" {
                merge(f: &f, x: idx * 4, y: idx * 4 + 3)
                merge(f: &f, x: idx * 4 + 1, y: idx * 4 + 2)
            } else if str[idx_j ..< str.index(idx_j, offsetBy: 1)] == "\\" {
                merge(f: &f, x: idx * 4, y: idx * 4 + 1)
                merge(f: &f, x: idx * 4 + 2, y: idx * 4 + 3)
            } else {
                merge(f: &f, x: idx * 4, y: idx * 4 + 1)
                merge(f: &f, x: idx * 4 + 1, y: idx * 4 + 2)
                merge(f: &f, x: idx * 4 + 2, y: idx * 4 + 3)
            }
        }
    }
    
    var fathers = Set<Int>()
    for i in 0 ..< (n * n * 4) {
        let fa = find(f: &f, x: i)
        fathers.insert(fa)
    }
    
    return fathers.count
}

assert(regionsBySlashes([" /", "/ "]) == 2)
assert(regionsBySlashes([" /", "  "]) == 1)
assert(regionsBySlashes(["\\/", "/\\"]) == 4)
assert(regionsBySlashes(["/\\", "\\/"]) == 5)
assert(regionsBySlashes(["//", "/ "]) == 3)


print("验证通过")
