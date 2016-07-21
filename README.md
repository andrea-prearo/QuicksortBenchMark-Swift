#QuicksortBenckmark

A brief comparison of Quicksort implementations in Swift

1. [Implementations](#implementations)
2. [Benchmark](#benchmark)
3. [References](#references)
4. [Notes](#notes)

## Implementations
- Foundation sorting methods: `sort()` and `sortInPlace()`
- Classical Quicksort
- Quicksort with 3-Way Partitioning
- Quicksort with Hoare partition
- Functional Quicksort
- Quicksort with Index Range Partition

## Benchmark

The execution time is calculated using the average of 5 test runs on the input data set (1000000 elements).

**No input shuffling**

| Input Array Type    | Implementation                        | Time (sec) |
|---------------------|---------------------------------------|------------|
| Random              |                                       | 1.4        |
| Increasing          | Foundation Quicksort                  | 11.3       |
| Decreasing          |                                       | 11.2       |
| Random              |                                       | 1.5        |
| Increasing          | Foundation In-Place Quicksort         | 11.2       |
| Decreasing          |                                       | 10.7       |
| Random              |                                       | 1.0        |
| Increasing          | Classical Quicksort                   | Crashing!  |
| Decreasing          |                                       | Crashing!  |
| Random              |                                       | 2.4        |
| Increasing          | Quicksort with 3-Way Partitioning     | 10.6       |
| Decreasing          |                                       | Crashing!  |
| Random              |                                       | 0.8        |
| Increasing          | Quicksort with Hoare partition        | 0.4        |
| Decreasing          |                                       | 0.4        |
| Random              |                                       | 30.8       |
| Increasing          | Functional Quicksort                  | 30.3       |
| Decreasing          |                                       | 33.9       |
| Random              |                                       | 2.2        |
| Increasing          | Quicksort with Index Range Partition  | Crashing!  |
| Decreasing          |                                       | Crashing!  |

**NOTE**: These crashes are due to an infinite loop that can be solved at the cost of an O(n) shuffling.

**Input shuffling**

| Input Array Type    | Implementations                       | Time (sec) |
|---------------------|---------------------------------------|------------|
| Random              |                                       | 1.5        |
| Increasing          | Foundation Quicksort                  | 11.5       |
| Decreasing          |                                       | 10.8       |
| Random              |                                       | 1.5        |
| Increasing          | Foundation In-Place Quicksort         | 11.6       |
| Decreasing          |                                       | 10.8       |
| Random              |                                       | 1.7        |
| Increasing          | Classical Quicksort                   | 1.7        |
| Decreasing          |                                       | 1.8        |
| Random              |                                       | 3.2        |
| Increasing          | Quicksort with 3-Way Partitioning     | 3.4        |
| Decreasing          |                                       | 3.5        |
| Random              |                                       | 1.7        |
| Increasing          | Quicksort with Hoare partition        | 1.6        |
| Decreasing          |                                       | 1.6        |
| Random              |                                       | 33.0       |
| Increasing          | Functional Quicksort                  | 31.6       |
| Decreasing          |                                       | 32.5       |
| Random              |                                       | 3.0        |
| Increasing          | Quicksort with Index Range Partition  | 3.0        |
| Decreasing          |                                       | 3.2        |

## References

### Books:
- [Algorithms (4th Edition) - 2.3 Quicksort](http://algs4.cs.princeton.edu/23quicksort/)

## Notes
