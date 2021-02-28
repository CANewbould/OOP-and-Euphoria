# OOP and Euphoria

A set of OOP libraries for use with the OOEU version of the Euphoria programming language.

# Core Euphoria

Euphoria has a simple typing system:
* **atom** for all single values
* **sequence** for all multiple values, which are shown enclosed in curly brackets

Strictly no more typing is needed, but it is possible to define more refined forms of each of these type classes using the *type* keyword, which has a structure akin to a *function*, but returns a boolean (TRUE/FALSE) value.

A variable value may be typed as an **object** if at the time of declaration the user wishes to leave open the range of possible values.

Routine definitions must specify, for each argument, its type (restriction).

## OOEU

This implementation of OOP uses [OOEU](http://ooeu.sourceforge.net/). The download options are:

* MS Windows binaries
* Linux binaries
* The source code, written in Euphoria

The Windows binary files still work even though they were last updated in 2006. It is my experience that the Linux binaries do not work "out of the box" but a study of the Open Euphoria Forum suggests that others have found a solution.

Consequently I use the source code, implemented as a pre-processor, for my Linux-based work. (As a not insignificant aside, this source code is the pre-cursor of the present-day Open Euphoria "source" material; it is my hope that, one day, these two might "merge" and this realisation of OOP become part of future editions of Euphoria.)

## OOE basics

This implementation of OOP grows naturally from the concept of types. In OOEU a class, denoted by **euclass** is, broadly speaking, a direct extension of type, but more broadly based. Although in Euphoria you can, albeit non-trivially, build a (sequence) type containing typed data and "method" association, through *routine_id*, OOEU classes make this much easier, and offers the familiar "dot-notation".

## The OOEU libraries

The specific nature of Euphoria, with its emphasis on data types, suggests that OOEU libraries should be data-related. This, however, is in stark contrast to "normal" OOP implementations, which often sideline and separate data from class definition and development.

The module libraries offered in this repository, probably as a consequence, represent a dual-track approach: one strongly data-related; the other, following other languages' approaches, is much more system-based. In practice, however, when developing OOEU applications a user can "mix-and-match" freely.

### Object-based libraries

The module *object.e* contains the definitions of **euclass**es which parallel Euphoria's core types. Definitions of **Atom** and **Sequence** classes mirror **atom**, **sequence** types, even if **Object** doesn't quite parallel the **object** type. Methods are added which apply to Objects of these classes and, broadly speaking, provide similar functionality to that offered in Open Euphoria's "standard" libraries. Each of these holds, as the property, an **atom** or **sequence** value.

Within this library module further sub-classes are defined. For example, the **Integer** class extends the **Atom**; whilst **Sequence** extends into **String** and **Vector**.

Underpinning *object.e* is a module *core.e* which provides some basic utilities and type definitions. These are essentially Euphoria rather than OOEU, but have been constructed using OOEU's facility to show the type of each return value.

### System-based libraries

To display the contents of an **Object** the method *show* is used. In contrast, in Java, you would write something like *system.out.write*(), putting the emphasis on Input/Output streams and away from data. Of course, this is also the standard Euphorian approach of such routines as *puts* and *printf*.

As a consequence, this repository also contains a set of modules following this approach. The module *os.e* is the basis of this development. It provides Operating System-level file management. It parallels the Python os library to some extent.

The *file.e* library provides basic Input/Output facilities for file streams. It parallels the Python file objects library to quite an extent.

## Documentation

The library modules use a form of in-built comment, from which html documentation is derived. The *docs* folder holds the html output, but a study of the source code may well be sufficient in many cases.

## Examples

Also included in the repository are examples of the use of the modules, which were originally written as tests of the correct working of the methods, but which also act as guides to understanding.

Some examples deliberately add further examples of OOP practice as further aids to understanding.

## Extension libraries

Clearly there is no limit to the extensibility of this development and users are encouraged to develop their own specialist modules to augment the cores provided here.

For completeness, the repository contains an extension library for creating graphical interfaces. This sits "on top" of the basic material.

* *japi.ew*: a library that provides a Graphical User Interface (GUI). This accesses the Java Swing toolkit. (There is also a very small support library //japi.e//, which handles library access and provides some useful system-level resources outside the Swing library.) At present this only works for MS Windows.

## State of development

Please note that the current repository is being re-written (Feb 2021) and will, therefore, undergo considerable change in the coming weeks and months. These changes will include merging of some modules, replacement and/or re-naming of others and, during this process, inconsistencies of various kinds. (This paragraph will be regularly updated to reflect these changes.)