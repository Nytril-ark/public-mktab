# Chapter 4: Comments

> [!NOTE]
> Starting a reading session 
> on day 2. Page 84. Finished
> 22 pages in 1 hr 15 mins.

> [!NOTE]
> I'm not writing much down because I understand the general gist and find it intuitive. 


---

### Position Markers

> "Sometimes programmers like to mark a particular position in a source file. For example, I
recently found this in a program I was looking through:
```cpp
// Actions //////////////////////////////////
```
> There are rare times when it makes sense to gather certain functions together beneath a
banner like this. But in general they are clutter that should be eliminated—especially the
noisy train of slashes at the end.
> 
> Think of it this way. A banner is startling and obvious if you don’t see banners very
often. So use them very sparingly, and only when the benefit is significant. If you overuse
banners, they’ll fall into the background noise and be ignored."

---

### Close Brace comments 
if you find yourself wanting to mark your closing braces, try to shorten your functions instead.





---

## Extra learning: 

---


#### Unit Tests, simply:
##### Definition
- Code that checks a small piece of functionality (e.g., a single function or class) to ensure it works correctly.  

##### Passing or failing
- The code behaves as expected, test passes
- Otherwise, the testing framework reports an error, showing which *"assertion"* failed, so you know what part of the code is broken.

##### *Assertion*:
- A statement in code that checks if a condition is true at runtime.
- If the condition is true, execution continues.
- If the condition is false, the assertion fails, stopping the test and reporting an error.
- In unit tests, assertions verify that code behaves as expected.

