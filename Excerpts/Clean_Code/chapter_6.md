# Chapter 6: Objects and data structures.

> [!NOTE]
> starting reading at 106
> chapter starts at 124

---

##### listing 6-1 ... Concrete Point
```
public class Point {
  public double x;
  public double y;
}
```

##### listing 6-2 ... Abstract Point
```
public interface Point {
  double getX();
  double getY();
  void setCartesian(double x, double y);
  double getR();
  double getTheta();
  void setPolar(double r, double theta);
}
```

In the latter code, you have no idea about the implementation of the coordinates. Thus, you do not need to change anything if the implemntation changes, as the interface is the same. 


This may sound already obvious, but furthermore:

> "The methods enforce an access policy. You can read the individual coordinates 
independently, but you must set the coordinates together as an atomic operation. "


#### Abstractions
> "A class does not simply push its variables out through getters and setters. 
Rather it exposes abstract interfaces that allow its users to manipulate the 
*essence* of the data, without having to know its implementation."

---

### Objects vs Data Structures 
> "Objects hide their data behind abstractions and expose functions that operate 
on that data. Data structure expose their data and have no meaningful functions. "


#### Anti-symmetry 

If we consider the listings below. If a new perimeter() function, for example, were
to be added to `Geometry`, the class would be unaffected, and dependent classes that
need that class will also remain unaffected. BUT, adding a new shape means we must 
manually change the functions in `Geometry`. 

In the Polymorphic example, conversly, adding a new shape doesn't affect the 
existing functions, but adding a new function means the shapes must all be 
changed.<sup><sup>   but, with caveats - "visitor pattern".. "dual-dispatch"</sup></sup>

##### - Listing 6-5 ... Procedural Shape
```java
public class Square {
  public Point topLeft;
  public double side;
}
public class Rectangle {
  public Point topLeft;
  public double height;
  public double width;
}
public class Circle {
  public Point center;
  public double radius;
}
public class Geometry {
  public final double PI = 3.141592653589793;
  public double area(Object shape) throws NoSuchShapeException 
  {
    if (shape instanceof Square) {
      Square s = (Square)shape;
      return s.side * s.side;
    }
    else if (shape instanceof Rectangle) {
      Rectangle r = (Rectangle)shape;
      return r.height * r.width;
    }
    else if (shape instanceof Circle) {
      Circle c = (Circle)shape;
      return PI * c.radius * c.radius;
    }
    throw new NoSuchShapeException();
  }
}
```

##### - Listing 6-6 ... Polymorphic Shape
```java 
public class Square implements Shape {
  private Point topLeft;
  private double side;
  public double area() {
    return side*side;
  }
}
public class Rectangle implements Shape {
  private Point topLeft;
  private double height;
  private double width;
  public double area() {
    return height * width;
  }
}
public class Circle implements Shape {
  private Point center;
  private double radius;
  public final double PI = 3.141592653589793;
  public double area() {
    return PI * radius * radius;
  }
}
```


Hence, we find ***the fundamental dichotomy between objects and data structures***:
> *"Procedural code (code using data structures) makes it easy to add new functions without
changing the existing data structures. OO code, on the other hand, makes it easy to add
new classes without changing existing functions."*


### Law of Demeter 
The Law of Demeter (LoD) or principle of least knowledge is a design guideline for developing 
software, particularly OO programs. The following three recommendations serve as a succinct summary:
- Each unit should have only limited knowledge about other units: only units "closely" related to the current unit.
- Each unit should only talk to its friends; don't talk to strangers.
- Only talk to your *immediate* friends.

> "More precisely, the Law of Demeter says that a method f of a class C should only call
the methods of these:
>- C
>- An object created by f
>- An object passed as an argument to f
>- An object held in an instance variable of C"

### Hybrids 
> "This confusion sometimes leads to unfortunate hybrid structures that are half object and
half data structure ... Such hybrids make it hard to add new functions but also make it hard
to add new data structures. They are the worst of both worlds. Avoid creating them."

An object should *do* something. We shouldn't be navigating though its internals. If we find
ourselves doing so, we may ask ourselves what is the purpose of that, and accordinly, add a 
method to the object's class that deals with the internals for us. This way, we do not 
violate the Law of Demeter.

## Data Transfer Objects 
DTOs are classes with public variables and no functions. They are useful when communicating with 
databases or pasing messages from sockets, etc.

> "They often become the first in a series of translation stages that convert raw data
in a database into objects in the application code."

The <sup><sup><sub>java</sub></sup></sup> "bean" form has private variables that are manipulated by getters/setters. 

> "The quasi-encapsulation of beans seems to make some OO purists feel better 
but usually provides no other benefit"



