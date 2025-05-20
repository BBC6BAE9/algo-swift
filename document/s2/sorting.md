# Sorting

## 10大排序算法

| 名称                           | 时间复杂度                             | 额外空间复杂度 | In-place | 稳定性 |
| ------------------------------ | -------------------------------------- | -------------- | -------- | ------ |
|                                | 最好     最坏     平均                 |                |          |        |
| **冒泡排序（Bubble Sort）**    | O(n)    O(n²)    O(n²)                 | O(1)           | ✔        | ✔      |
| **选择排序（Selection Sort）** | O(n²)    O(n²)    O(n²)                | O(1)           | ✔        | ✖      |
| **插入排序（Insertion Sort）** | O(n)    O(n²)    O(n²)                 | O(1)           | ✔        | ✔      |
| **归并排序（Merge Sort）**     | O(nlogn)    O(nlogn)    O(nlogn)       | O(n)           | ✖        | ✔      |
| **快速排序（Quick Sort）**     | O(nlogn)    O(n²)    O(nlogn)          | O(logn)        | ✔        | ✖      |
| **希尔排序（Shell Sort）**     | O(n)    O(n^(4/3))~O(n²)               | O(1)           | ✔        | ✖      |
| **堆排序（Heap Sort）**        | O(nlogn)    O(nlogn)    O(nlogn)       | O(1)           | ✔        | ✖      |
| **基数排序（Radix Sort）**     | O(d*(n+k))    O(d*(n+k))    O(d*(n+k)) | O(n+k)         | ✖        | ✔      |
| **桶排序（Bucket Sort）**      | O(n+k)    O(n+k)    O(n+k)             | O(n+m)         | ✖        | ✔      |
| **计数排序（Counting Sort）**  | O(n+k)    O(n+k)    O(n+k)             | O(n+k)         | ✖        | ✔      |

冒泡、选择、插入、归并、快速、希尔、堆排序，属于比较排序（Comparison Sorting）

## 冒泡排序

执行流程（以升序为例）

