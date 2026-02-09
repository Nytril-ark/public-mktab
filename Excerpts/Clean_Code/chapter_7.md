# Chapter 7: Error Handling 

> [!NOTE]
> starting reading at 106
> chapter starts at 134

---

### Introduction
> "Error handling is important, but if it
obscures logic, it’s wrong."

Therefore, *separate it.* Also, as already mentioned before, exceptions are better to use than error codes, in many cases.


> "Your catch has to leave your program in a consistent state, no matter what happens in the try."

Example <sub><sup>java</sup></sub> code: 

```java
public List<RecordedGrip> retrieveSection(String sectionName) {
  try {
    FileInputStream stream = new FileInputStream(sectionName);
    stream.close();
  } catch (FileNotFoundException e) {
    throw new StorageException("retrieval error”, e);
  }
  return new ArrayList<RecordedGrip>();
}
```

For TDD, you may write tests that force an exception, and then make you handler (the catch block) satisfy those test. 
This approach forces you to design the “transactional” part of the try block first — i.e., the code that must run
safely and consistently, even if an exception occurs.

##### Context matters 
> "Each exception that you throw should provide enough context to determine the source and
location of an error."


You may wrap exceptions thrown by a class in a way that simplifies and reduces duplication in try/catch blocks later. This has already been mentioned in a bit we summarized. Wrapping in general is very useful in exception handling, use it wisely.

> "Wrapping third-party APIs is a best practice. When you wrap a third-party API, you minimize 
your dependencies upon it: You can choose to move to a different library in the future without
much penalty. Wrapping also makes it easier to mock out third-party calls when you are
testing your own code."

---

### Define the Normal Flow
Following the aforementioned rules, we probably have a good separation between *business logic* and error handling. 
The Author mentions a nice example that may or may not be worth it if you want to unclutter a bit of code:

```java
try {
  MealExpenses expenses = expenseReportDAO.getMeals(employee.getID());
  m_total += expenses.getTotal();
} catch(MealExpensesNotFound e) {
  m_total += getMealPerDiem();
}
```
> "In this business, if meals are expensed, they become part of the total. If they aren’t, the
employee gets a meal per diem amount for that day."

The author proceeds to explain that we can include the concept of returning that per-diem default in the getTotal method itself. 
```java
public class PerDiemMealExpenses implements MealExpenses {
  public int getTotal() {
    // return the per diem default
  }
}
```
And as such, we get rid of the try/catch block in the calculation/business logic section of our code.
This is called the *special case pattern*, where you configure a class or object so that it handles
special cases for you. Thus, client code doesn't deal with such cases, and the behaviour is encapsulated.

---

### Don't Return Null 

> "When we return `null`, we are essentially creating work for ourselves and foisting
problems upon our callers. All it takes is one missing `null` check to send an application
spinning out of control."


> "If you are decide to return null from a function, consider throwing an exception or returning a SPECIAL CASE object instead."

It is also helpful, if we're calling null-returning method from a third-party API, to wrapping that
method with something that does the above.

> [!TIP]
>
> **Rust:**
> - There are no null pointers in safe Rust.
> - Instead, Option<T> is used: Some(value) or None to represent optional values safely.
>
> **Rust avoids raw null to prevent null-pointer bugs at compile time.**





---

### Some learned concepts:


##### Test-Driven Development (TDD)
- *Step 1:* Write a test first that specifies the desired behavior, including edge/error cases.
- *Step 2:* Run the test and see it fail.
- *Step 3:* Write the minimal code needed (e.g., exception handling) to make the test pass.
- *Step 4:* Refactor the code while keeping all tests passing.

##### Coupling
- A measure of how dependent one module, class, or function is on another.
- **Tightly coupled:** changes in one part require changes in others.
- **Loosely coupled:** parts can change independently.
- Goal: keep coupling low to make code easier to maintain, extend, and test.

##### Business Logic 
 - Business logic is the part of our program that implements the actual rules, 
   calculations, and processes specific to the application’s purpose.

