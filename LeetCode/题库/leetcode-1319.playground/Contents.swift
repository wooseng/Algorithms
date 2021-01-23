import Foundation

// https://leetcode-cn.com/problems/number-of-operations-to-make-network-connected/

func dfs(i: Int, used: inout [Int], map: [Int: [Int]]) {
    used[i] = 1
    guard let list = map[i] else {
        return
    }
    for v in list where used[v] == 0 {
        dfs(i: v, used: &used, map: map)
    }
}

func makeConnected(_ n: Int, _ connections: [[Int]]) -> Int {
    // 1. n台计算机最少需要n-1条线缆，所以如果线缆数量不足，一定无法全部连通
    guard connections.count >= n - 1 else {
        return -1
    }
    
    // 2. 获取当前线缆连接的所有主机以及该主机连接的所有机器
    var map = [Int: [Int]]()
    connections.forEach {
        let a = $0[0], b = $0[1]
        var v_a = map[a] ?? []
        v_a.append(b)
        map.updateValue(v_a, forKey: a)
        
        var v_b = map[b] ?? []
        v_b.append(a)
        map.updateValue(v_b, forKey: b)
    }
    
    // 3. 创建搜索列表，默认值均为0，搜索过的就置为1
    var used = Array<Int>(repeating: 0, count: n)
    
    // 4. 遍历搜索列表，对没有进行搜索的元素进行深度搜索操作
    var ans = 0
    for i in 0 ..< used.count {
        guard used[i] == 0 else {
            continue
        }
        dfs(i: i, used: &used, map: map)
        ans += 1
    }
    // 注意，编译搜索列表的时候不能使用以下方式，
    // 因为这种方式会自动复制一份used，然后dfs修改值的时候实际上并没有起作用，
    // 虽然used的值变化了，但是循环读取的值依然会是0
//    for (i, v) in used.enumerated() where v == 0 {
//        dfs(i: i, used: &used, map: map)
//        ans += 1
//    }
    
    return ans - 1
}

assert(makeConnected(4, [[0,1],[0,2],[1,2]]) == 1)
assert(makeConnected(6, [[0,1],[0,2],[0,3],[1,2],[1,3]]) == 2)
assert(makeConnected(6, [[0,1],[0,2],[0,3],[1,2]]) == -1)
assert(makeConnected(5, [[0,1],[0,2],[3,4],[2,3]]) == 0)

print("验证通过")
