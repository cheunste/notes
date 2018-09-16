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

Design patterns address this question ads well
* Facade pattern: Describes how to represent complete subsystem as object
* Flyweight pattern: describes how to support huge numbers of objects at the finest granularities 


There are also other design patterns that describe specific ways of decomposing an object into smaller objects.

* Abstract Factory and Builder pattters: Yield objects whose only preponsibilities are creating other objects
* Visitor and Command patterns: Yield objects whose only reponsibilities are to implement a request on anothe5r object or group of objects

## Specifying Object Interfaces

Every operation declared by an object specifies the operation's name, the object it takes as parameters and the operation's return value This is known as the operation's signature.

The set of all signatures defined by an object's operations is called the "interface" to the object.

An object's interface characterizes the complete set of requests that can be sent to the object. 
Any request that matches a signature in the object's interface may be sent to the object

A **type** is a name used to denote a particular interface

We say a type is a **subtype** of another if its interface contains the interface of its **supertype**. Usually, a subtype inheriting the interface of its supertype

In OO systems, Objects are knwon only through their interfaces. An object's interface says nothing about its implementation. 

When a request is sent to an object, the particular operation that's performed depends on both the request and the receiving object.

Different boject that support identical requests may have different implementations of the operations that fulfill these requests.

The run-time assocation of a request to an object and one of its operaiton is knwon as **dyunamic binding**

Dynamic binding meants that issuring a request doesn't cojmmit you to a particular implementation until run-time

This lets you substitute objects that have identical interfaces for each other at run-time. This is knonw as **polymorphism**.

Deisgn patterns helpp you defie interfaces by id-ing their key elements and hte kinds of data that get sent across an interface. A design pattern might also tell you what not to put in the interface

* Mmento pattern: This describes how eto encapsulate and save the interfal state of an object so that the object can be restored to that state later..

Design pattenrs asl o specify relationships between interfaces. They often requrie some classes to have similar interfaces or they place constraints on the interfaces of some classes.

* Decorator and Proxy pattern: They require the interfaces of the Decorator and Proxy objects to be identical to the decorated and proxied objects.
* Visitor pattern: The visitor interface must reflect all classes of objects that visitors can visit

## Specifying Object Implementations

An object's implementations is dfeined by its **class**. The class specifies the objects's internal data and representation and defines the oeprations the object can perform

Objects are created by instantiating a class. Thie Object is said to be instance of the class. THe process of instantiating a class allocated storage for the object's internal data (made up of instance variables) and assocated the operations with these  data.

A dashed arrowhead line (think UML diagram) indicates a class that instantiates objects of antoher class. THe arrow points to the class of the instantiated object

ex: Instantiator ------> instantiatee

New classes can bew defined in terms of existing classes using class inheritance. When a subclass inherits from a parent class, it includes the defn of all the data and operations that the parent class defines.

Objects that are instances of hte subclass will contain all data defined yb hte subclass and its parent classes, and they'll be able to perform all operations defiend by this subclass and its parents. We indicate the subclass relationship with a vertical line and a triangle. (Need a diagram for this)

**Abstract class** is a class whose main purpose is to define a common interface for its subclasses. An abstract class will defer some or all of its implementation to operations defined in subclasses; hence  it cannot be instantiated.

operations that an abstract class declares but doesn't implement are called **abstract operations**. Classes that aren't abstract are called **concrete classes**.

Subclasses may overwrite an operation defiend by its parent class. Overriding gives subclasses a chance to handle requests instead of hteir parent classes. Class inheritance lets you define a class simply be extending other classes. 
'
A **mixin class** is a class that's intended to provide an optinal interface or functionality to other classes. It's similar to an bastrct class (in that its not intedned to be instantiated), buty require multiple inheritance

## Class vs. Interface Inheritance

It's important to understand the difference between an object's class and its type

An object's aclass defines how the object is implemented. The class defines the object's internal state and the implementation of its operations. 

An objects's type only referes to its interface, the set of requests to which it can respond An object can have many types, and objects of different classes can have the same type
