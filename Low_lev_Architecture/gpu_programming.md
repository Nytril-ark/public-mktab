# GPU Programming

* GPU prog is writing code that runs on a GPU instead of (or alongside) the CPU to accelerate computation.

#### Definitions & Concepts
- **APIs & Frameworks**: CUDA (NVIDIA), OpenCL (cross-platform), Vulkan, DirectCompute.
- **Parallel execution**: GPUs have thousands of cores optimized for running the same operation on many data elements simult.
- **Kernels**: Functions that run on the GPU. Launched on many threads at once.
- **Thread**: a single “worker” running one instance of the kernel.
- **Thread index**: a way to give each thread a unique number so it knows which piece of data to work on
- **Memory hierarchy**: Different mem types with diff latency and visibility. 

        - Global memory: visible to all threads, slow.
        - Shared memory: visible to threads in the same block, faster.
        - Local memory:  private to each thread, fastest.


#### some CUDA-like pseudocode for visualization

```cpp
__global__ void addVectors(float* a, float* b, float* c, int n) {
    int i = threadIdx.x + blockIdx.x * blockDim.x;
    if(i < n) c[i] = a[i] + b[i];
}

int main() {
    // allocate GPU memory, copy data, launch kernel, copy results back
}

// `__global__` marks a kernel function that runs on the GPU.
// `threadIdx`, `blockIdx`, `blockDim` manage thread indexing.
```
