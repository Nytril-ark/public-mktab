# CACHE

- HARDWARE: Caches (very simplified), are a high speed copy of small portions of main memory. 
- SOFTWARE: ...


## Hardware caches:
In memory design, there is an inherent trade-off between capacity and speed; Larger capacity implies larger size and thus greater physical distances
for signals to travel, causing propagation delays. The buffering provided by a cache benefits reduces **latency** and increases **throughput**. 

To be cost-effective, hardware cache must be relatively small. Still, in many cases, they remain effective regardless of that; Typical applications
access data with a high degree of _[locality of reference]_. Those access patterns exhibit **temporal locality**, where data is requested that has
been recently requested, and **spatial locality**, where the newly requested data is stored near data that has already been requested.


## Cache misses 
A cache miss is when something being looked up in the cache isn't found, making it unable to satisfy the query, thus having to fetch from slower memory.


### context-switching and cache miss
When a new thread is _[context-switched]_ into a processor, the local cache memory usually doesn't correspond to the data needed for the thread. 
This means that most (or all) mem lookups made by that new thread result in cache misses. The hardware then has to make a number of requests to
main memory to fill up the local cache which causes the thread, initially, to run slower.

> [!CAUTION]
> Stopped reading [this](https://en.wikipedia.org/wiki/Cache_(computing))  at "Write Policies"

> [!NOTE]
> What tells the CPU what memory is going to be commonly frequented so that we store it in the cache? Us? The OS? The compiler?

## Locality of Reference 
We can exploit this for optimization purposes. Since most programs access the same data repeatedly, or data that’s close together in memory,
predictable “clusters” of activity are formed. If we know how these clusters usually form, we can optimize. A common method is to arrange our
code & data so that related things sit closer together in memory.

### Hierarchical Memory 
Locality entails that mem can be very fast and tiny, or very slow and huge. Thus, we can exploit locality through a hierarchy, where we organize memory into layers:

- Caches: benefit from temporal locality: recently-used data stays close to the CPU.
- Cache lines: benefit from spatial locality: when you load one value, the hardware also loads the nearby values automatically.
- Registers: benefit from very strong temporal locality: data used repeatedly in a short burst can stay in registers.

The hierarchy can be compared like this:
    1. **CPU Registers** (8–256 registers)  
       - Immediate access  
       - As fast as the CPU core itself  

    2. **L1 Cache** (32 KB–512 KB)  
       - Very fast  
       - Private to each core (uses the core's own internal bus)  

    3. **L2 Cache** (128 KB–24 MB)  
       - Slightly slower  
       - Often shared between pairs of cores (shared memory bus)  

    4. **L3 Cache** (2 MB–64 MB)  
       - Slower than L2  
       - Shared across many cores in the same CPU  

    5. **Main Memory (RAM)** (256 MB–64 GB)  
       - Much slower  
       - Limited by physical distance and motherboard interfaces  

    6. **Disk Storage** (1 GB–256 TB)  
       - Very slow  
       - Narrower, long data path to the disk + extra software layers  

    7. **Remote Memory** (network, cloud, other machines)  
       - Slow to extremely slow  
       - Latency depends heavily on network conditions  


The obvious end-goal, therefore, is to make sure the data that needs to be used is in the upper layers.

#### Example: Locality & Matrix Multiplication
###### 1. Loop order
Consider the following loop order:
```
for i
  for j
    for k
      C[i][j] += A[i][k] * B[k][j];
```
We can notice that:
- `A[i][k]` has good locality (k moves through contiguous memory).
- `B[k][j]` has bad locality (j changes slow, so B elements are far apart in memory).

Each access to B[k][j] often misses the cache, slowing everything down. However, if we inspect the following order: 

```
for i
  for k
    for j
      C[i][j] += A[i][k] * B[k][j];
```
- `A[i][k]` stays in cache (k still contiguous).
- `B[k][j]` now accessed in contiguous memory order (j moves fastest).
- `C[i][j]` stays in cache while updating the row.

Result:
Almost no cache misses in the inner loop, which is a huge speedup. Perhaps 5× faster on real hardware. Column-walking in row-major storage = constant cache misses. 
Therefore, we must always avoid that.

###### 2. Loop-invariant values
The compiler ( or us, the programmer) can pull repeated values out of the innermost loop. Instead of repeatedly loading:
```
A[i][k]
```
We can store it once: 
```
temp = A[i][k]
for j:
  C[i][j] += temp * B[k][j]
```
###### 3. Blocking (loop-tiling)
Even with good loop order, large matrices still don’t fit in cache. Blocking divides the matrix into smaller chunks that do fit. 
We Process submatrices of size `BLOCK_SIZE × BLOCK_SIZE`.

Inside each block:
- Data stays in cache longer (temporal locality).
- Accesses walk through contiguous memory (spatial locality).
- So instead of loading data once per multiplication, each block is reused many times before being evicted from cache.





#### Cache Oblivious Algorithm 
A.k.a. a cache-transcendent algorithm, is designed to take advantage of a cache without having the size of the cache (or the length of the cache lines, etc.) as an explicit parameter.
It is designed to perform well, without modification, on multiple machines with different cache sizes, or for a memory hierarchy with different levels of cache having different sizes.
Cache-oblivious algorithms are contrasted with *"explicit loop tiling"*, which breaks a problem into blocks that are optimally sized for a given cache.

> "Optimal cache-oblivious algorithms are known for matrix multiplication, matrix transposition, sorting, and several other problems. "

#### Communication avoiding algorithm 
Those minimize movement of data within a memory hierarchy for improving its running-time and energy consumption. This minimizes time and energy on two levels: arithmetic and communication.
Communication, in this context refers to moving data, either between levels of memory or between multiple processors over a network. It is much more expensive than arithmetic.


## DEFINITIONS 
##### Temporal locality 
> "If at one point a particular memory location is referenced, then it is likely that the same location will be referenced again in the near future. 
There is temporal proximity between adjacent references to the same memory location. In this case it is common to make efforts to store a copy of the
referenced data in faster memory storage, to reduce the latency of subsequent references."

##### Spatial locality 
If a certain storage location is referenced at a particular time, then it is likely that *nearby memory locations* will be referenced soon too.

##### Cache Lines 
A cache line is the smallest unit of data that can be transferred between a computer's main mem and its cache. They typically range from 32 to 128 bytes, with 64 bytes being common.
