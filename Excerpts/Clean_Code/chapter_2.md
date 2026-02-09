# Chapter 2: Meaningful Names

### {1} Use intention-revealing names 

If a name requires a comment, then the name does not reveal its intent.

*Bad code:*
```cpp
int d; // elapsed time in days
```

the name d reveals nothing. Instead:
```cpp
int elapsedTimeInDays;
int daysSinceCreation;
int daysSinceModification; 
int fileAgeInDays;
```
### {2}  Avoid Disinformation

### {3} Make Meaningful  Distinctions

### {4} Use Pronounceable Names 

### {5} Use Searchable Names 

> "Likewise, the name e is a poor choice for any variable for which a programmer might need to search. It is the most common letter in the English language and likely to show up in every passage of text in every program. In this regard, longer names trump shorter names, and any searchable name trumps a constant in code."

### {6} Avoid Encodings
> "We have enough encodings to deal with without adding more to our burden. Encoding type or scope information into names simply adds an extra burden of deciphering."

### {7} Avoid Mental Mapping
> In general programmers are pretty smart people. Smart people sometimes like to show off their smarts by demonstrating their mental juggling abilities. After all, if you can reliably remember that r is the lower-cased version of the url with the host and scheme removed, then you must clearly be very smart.
>
>One difference between a smart programmer and a professional programmer is that the professional understands that *clarity is king.* Professionals use their powers for good and write code that others can understand. 


### {8} Solution domain and problem domain names.

> "Remember that the people who read your code will be programmers. So go ahead and use computer science (CS) terms, algorithm names, pattern names, math terms, and so forth. It is not wise to draw every name from the problem domain because we don’t want our coworkers to have to run back and forth to the customer asking what every name means when they already know the concept by a different name."
>
> "When there is no “programmer-eese” for what you’re doing, use the name from the prob- lem domain. At least the programmer who maintains your code can ask a domain expert what it means."


