# Catalog of Patterns

   This book catagories patterns based  on several criterions.

   First is **purpose** (either by **creational**, **structural** or **behavioral** purposes).
   Second is **scope**. This specifies whether the pattern applies primarily to classes or to objects.
        * Class patterns deal with realtionaship between classes and their subclasses. These relationships are established through inheritance so they are static at compile time
        * Object pattern deal with object relationships, which can change at run time and are more dynamic
        * Almost all patterns uses inheritance to some exten
   * creational calass pattenrs defer some part of object creation to subclasses while cretional object patterns defer to another4 object
   * Structural class pattens uses inheritance to compse classes, while structural object pattenr describe ways to assemble objects
   * Bheavioral class patterns uses inheritance to describe algorithms and flow control while Behavioral object patterns describe how a group of objects cooperate to form a task that no single object can carry out alone.

# How Deisgn Pattenrs Solve Diesgn Problems

* here are several problems and how design patterns solve them

## Finding Approprioate Objects

* OOP are made up of objects.
* An object packages both data and the procedures that operate on that data. Procedures are typically called **methods** or operations. An object performs an operaiton when it receives a request (or **message**) from a **client**

* Requests are the only way to get an object to execute an operation. Operations are the only way to change an object's internal data. Because of these restrictions, the object's internal state is said to be **_incapsulated_** and cannot be accessed directly and its representation is invisible from outside the object

* Design Pattenrs help you identify less-bobvious abstractions and hte objects that can capture them. 

ex: Objects that represents ar process or algoirthm don\'t occur in nature, yet theyy are a part of flexible design
 * Strategy pattern: describes how to implement interchangeable families of algorithms
 * State pattern: represents each state of an entitty as an boject

## Determinging Object Granularity

Object can vary in size and numbers. Thye can represent everything down to the hardware or up the entire app.How do we decie what should be an object


