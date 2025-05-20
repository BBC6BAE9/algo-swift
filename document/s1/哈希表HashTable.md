# 11、哈希表HashTable

哈希表也称为散列表（hash有剁碎的意思）

底层存储的结构是一个数组

他是如何处理的数据的呢

put("Jack", 666)

put("Rose", 777)

put("Kate", 777)

哈希函数_hash(key)，复杂度是O1 

哈希表是空间换时间的典型应用

哈希表内部的数组元素，很多地方叫做Bucket（桶），整个数组叫做Buckets或者Bucket Array



## 哈希冲突（Hash Collision）

哈希值冲突也叫做哈希碰撞

- 2个不同的key，经过哈希函数计算出相同的结果
- Key1 ≠ key2， hash(key1) = hash(key2)

解决哈希冲突的常见方法

1、开放定址法（Open Addressing）

- 按照一定的规则向其他地址谈测，直到遇到空桶

2、再哈希法（Re-Hashing）

- 设计多个哈希函数

2、链地址法（Seperate Chaining）

- 比如通过链表将统一index的元素串起来



## JDK1.8的哈希冲突解决方案

- 默认使用单向链表将元素串起来

- 在添加元素时，可能会由单向链表转为红黑树来存储元素

> 比如当哈希表容量大于等于64且单向链表的节点数大于8时

当红黑树的节点数量少到一定程度时，又会转位单向链表

JDK1.8中的哈希表使用链表+红黑树解决哈希冲突

思考：这里为什么使用单链表？

答：重复的key需要覆盖



# 哈希函数

哈希表中哈希函数的实现步骤大致如下

1、先生成key的哈希值（必须是整数）

2、再让key的哈希值跟数组的大小进行相关运算，生成一个索引值

```java
public int hash(Object key) {
  return hash_code(key) % table.length;
}
```

为了提高效率，可以使用 & 位运算取代 % 运算 【前提：将数组的长度设计为2的幂】

```java
public int hash(Object key) {
  return hash_code(key) & (table.length - 1);
}
```
（1）先回顾一下什么是位运算

```
 1001010
&1101101
--------
 1001000
```

（2）再来看一下2的幂的情况

1         2^0

10       2^1

100     2^2

1000   2^3

（3）再来看一下2^n-1的情况

01           2^1-1

011         2^2-1

0111       2^3-1

01111     2^4-1

011111   2^5-1

（4）最后简化一下

1           2^1-1

11         2^2-1

111       2^3-1

1111     2^4-1

11111   2^5-1

（5）得出如下规律规律是

任何一个值&上1...1, 结果都是小于1...1    



在Java中，HashMap的key必须实现hashCode、equals方法，也允许key为null

如果key值为

- 整数
整数值当作哈希值
比如10的哈希值就是10
- 浮点数
TODO：？？？？？？



## 字符串的哈希值

- 整数5489是如何算出来的？

> 5* 10^3 + 4* 10^2 + 8* 10^1 + 9* 10^0

- 字符串是由若干个字符组成的
> 比如字符串jack，由j、a、c、k四个字符组成（字符的本质就是一个整数）
>
> 因此，jack的哈希值可以表示为j * n^3 + a * n^2 + c * n^1 + k * n^0, 等价于[(j * n + a) * n + c] * n + k,  后者效率较高

在JDK中，乘数n为31，为什么使用31呢

√ 31是一个奇素数，JVM会将 31* i优化成 ( i << 5 ) - i ，位运算的效率比较高，所以会有更好的性能，如果具体落实到其他语言，比如Swift，可以直接使用 ( i << 5 ) - i作为乘数



## 自定义对象的哈希值

```java
let p1 = Person("jack", 12)
let p2 = Person("jack", 12)

let map = [Person: String]
map[p1] = "abc"
map[p2] = "bcd"
```

和它的内存地址挂钩的，但是如果现在需求有变化，需要在Person的name和age相同的情况下算作同一个key



Swift的Class如果需要遵守Hashable，那么默认需要遵守

```swift
class Person: Hashable {
    
    var name: String
    
    var age: Int
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
    
    static func == (lhs: Person, rhs: Person) -> Bool {
        return lhs.age == rhs.age && lhs.name == rhs.name
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
        hasher.combine(age)
    }
    
}
```

> 可以查看 https://github.com/swiftlang/swift 以学习swift的相关具体实现 （文档中仍然有些细节和代码是Java的）



## 哈希函数

### 哈希表中哈希函数的实现步骤如下

1、先生成key的哈希值（必须是整数）

2、再让key的哈希值跟数组大小进行相关运算，生成一个索引值

```java
public int hash(Object key) {
	return hash_code(key) % table.length
}
```

3、为了提高效率，可以使用&位运算代替%运算（前提是数组的容量设计为2的幂）

 ### 良好的哈希函数

哈希值更加均匀的分布 -> 减少哈希冲突-> 提升哈希表的性能

## 关于31的探讨

31不仅是符合2^n-1, 它是个奇素数（既是奇数，又是素数，也是质数）

> 素数和其他数相乘的结果比其他方式更容易产生唯一性，减少哈希冲突
>
> 当然也可以选择非31的素数，最终选择31是经过观测分布结果后的选择



