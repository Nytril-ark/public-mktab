# C++ Object-Oriented Concepts:

### Binding and Polymorphism
- **Static Binding**: The function call is resolved **at compile time**, used with non-virtual functions.
- **Dynamic Binding**: The function call is resolved **at runtime** based on the actual object type, used with virtual functions.
- **Overriding**: Child provides a new definition for a **virtual** parent function, and **dynamic dispatch** ensures the child version is called via base pointers/references. Overriding preserves polymorphism.
- **Hiding**: Child defines a function with the same name as a **non-virtual** parent function. Base pointers/references still call the parent function; the child function is **not polymorphic**.

### Constructor Initializer List
- Syntax used to directly initialize member variables or base classes before the constructor body runs.
- Necessary for initializing const members, references, and base class constructors.
- More efficient than assignment in the body 

### Object Slicing
- Occurs when you copy a derived object by value into a base object.
- When this happens, C++ copies only the Base subobject (Base fields and Base vtable); everything below Base (extra Child fields, overridden virtual functions) is discarded.
- Slicing has no polymorphism because the object's vtable pointer now only points to the Base implementation.

### Composition 
1. A class contains another class as a member.
   Example: `Car` *has a* `Engine`, so `Engine` is a field inside `Car`.

2. The containing object controls the lifetime of the contained object.
   When a `Car` is created/destroyed, its `Engine` is created/destroyed automatically.

3. Used instead of inheritance when you want behavior by combining parts, not by extending types.
   It avoids deep inheritance trees and keeps design flexible.

### Constructor and Destructor Execution Order
- When a Child object is created, C++ runs the Base constructor first, followed by the Child constructor.
- This sequence is mandatory because a Derived object contains a Base subobject inside it, and the Base part must be initialized first.
- The Child constructor *never* "extends" or "edits" the Base constructor logic; it only initializes the child's specific fields after the base construction is complete.
- If the Child constructor does not specify which Base constructor to call, C++ automatically calls the Base's default constructor.
- Destructors run in the opposite order.


### Cstruc/Dstruc order example
- Constructors always run from base to derived:
1. `Base`
2. `Mid`
3. `Derived`
- Destructors always run from derived to base, but only if the *destructor chain* is actually invoked.

#### 1. **Virtual destructor rule**
- Deleting through a base pointer *without* a virtual destructor => only the Base destructor runs => undefined behavior.
- Deleting through a base pointer *with* a virtual destructor => full chain runs:  
  `Derived -> Mid -> Base`.

#### 2. **Inheritance access rule**
- `public` inheritance: `Derived` *is-a* `Base`. Conversions like `Base* p = new Derived();` are allowed.
- `private` inheritance (default for `class`) : `Derived` is *not-a* `Base` outside the class.  
   Using a base pointer to instantiate a child object is not allowed => compile error.


---


### RAII 
> "Resource acquisition is initialization (RAII) is an approach to the problem commonly taken in C++, D, and Ada. It involves associating 
scoped objects with the acquired resources, and automatically releasing the resources once the objects are out of scope. Unlike garbage 
collection, RAII has the advantage of knowing when objects exist and when they do not."

For comparison purposes: 

This is C:
```C
#include <stdlib.h>
void someOperation(int* a) {
    // ...
}
void f(int n) {
    int* a = (int*)calloc(n, sizeof(int));
    someOperation(a);
    free(a);
}
```
And C++: 
```cpp
import std;
using std::vector;
void someOperation(vector<int>& a) {
    // ...
}
void f(int n) {
    vector<int> a(n);
    someOperation(a);
}
```
<sup>(Note that unlike malloc(), calloc() initializes all elements to 0.)</sup>

We notice that in C we have to explicitly deallocate the dynamically allocated mem, while in c++ it gets automatically deallocated once it goes out of scope.

