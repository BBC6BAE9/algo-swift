# TreeMap分析

时间复杂度，O(logn)

特点：

- key需要具有可比较性

- 元素的分布是有顺序的



在世纪应用中，很多时候的需求

- map中存储的元素不需要讲究顺序
- map中的key不需要可比较性的



如果不考虑顺序，不考虑Key的可比较性， Map有更好的实现方案，平均时间复杂度可以达到O(1)



## 一个需求

设计一个写字楼通讯录，存放所有公司的信息

- 座机号码作为key（假设座机号码最长8位），公司详情（名称、地址）作为value
- 添加、删除、搜索的时间复杂度要求是O(1)

```java
private Company[] companies = new Company[100000000]

public void add(int phone, Company company) {
  companies[phone] = company;
}

public Company get(int phone) {
  return companies[phone];
}
```

存在什么问题呢？

- 空间复杂度非常大
- 空间使用率极低，非常浪费空间
- 其实数组companies就是一个哈希表，典型的【空间换时间】
