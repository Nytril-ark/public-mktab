# Chapter 8: Boundaries 

> [!NOTE]
> starting reading at 106
> Still in the same reading sesh
> as the past chapters

## Using Third-Party Code 
The provider of an interface or framework aims for broadness and applicability in different invironments. 
The user of the interface has more specific needs. This can create problems at the *boundaries* of our code. 
The interface we are using might be providing more capability than we want to allow. Moreover, if the 
interface changes, and it is being passed around a lot in our system, it could prompt major re-writes 
throughout our codebase. 

Therefore, *once again,* we wrap the interface at the *boundary* in a way hides the implementation details. 
This lets us constain the interface to meet our specific needs.


### More on Boundaries 
> "It’s not our job to test the third-party code, but it may be in our best interest to write 
tests for the third-party code we use."

When dealing with an interface, we want to avoid long debugging sessions where we try to
understand whether the bugs we are experiencing are in our code or theirs. 

The author suggests that learning the third party code and integrating it is very difficult, and thus, a new approach is proposed.

> "We could write some tests to explore our understanding of the third-party code"

Thus, we test and experiment with calling the API to check our understanding of that interface.

> "Not only are learning tests free, they have a positive return on investment. When there
are new releases of the third-party package, we run the learning tests to see whether there
are behavioral differences."


#### Using Code That Does Not Yet Exist
Say you want to deal with an interface that isn't yet finished. You do not want to wait until it is fully coded,
but you know the general gist of what it is supposed to be, when it does get coded. Wrapping the interface at the 
boundary from within your system allows you to code as if the awaited third-party code already exists. The details 
aren't there, but your system is ready for when they arrive. When they do arrive, you will - probably - only have
to modify the small linking interface that you wrote within your system, that interacts with the third-party.

This is very close to - or almost the same as - the ***Adapter*** from Design Patterns.

We can also, obviously, use our "adapter" of sorts here to fake an actual api for testing purposes.



---

#### Some learned concepts:

##### Boundary
- public-facing methods and members of a class that other code interacts with
