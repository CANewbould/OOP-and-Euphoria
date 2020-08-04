# OOP and Euphoria
A set of OOP libraries for use with the OOEU version of the Euphoria programming language.

# Core Euphoria

Euphoria has a simple typing system:
* **atom** for all single values
* **sequence** for all multiple values, which are shown enclosed in curly brackets

Strictly no more typing is needed, but it is possible to define more refined forms of each of these type classes using the *type* keyword, which has a structure akin to a *function*, but returns a boolean (TRUE/FALSE) value.

A variable value may be typed as an **object** if at the time of declaration the user wishes to leave open the range of possible values.

Routine definitions must specify, for each argument, its type (restriction).

## The OOEU libraries

This implementation of OOP using [OOEU](http://ooeu.sourceforge.net/) follows the relationships of these types. There are two separate libraries, *atom.e* and *sequence.e* which contain, respectively, methods which apply to Objects of the **Atom** and **Sequence** classes. Each of these holds, as property, an **atom** or **sequence** value, alongside a range of *methods* relevant to each data class.

Within these library modules further sub-classes are defined. For example, *atom.e* contains the definition of the **Integer** class; whilst *sequence.e* contains the definitions of both **String** and **Vector**.

Also as a parallel to the parent language, Euphoria, a library *object.e* is defined, which acts, as in other OOP contexts, as a core module. Its main purpose, in fact, is to hold the definition of a type missing from Core Euphoria but which is crucial to effective operation of both Euphoria and OOEU: the **boolean** type. The few other entries are methods which provide a rudimentary framework, but are typically overridden in the more specialised modules.

### Documentation

The library modules use a form of in-built comment, from which html documentation is derived. The *docs* folder hold the html output, but a study of the source code may well be sufficient in many cases.

## Examples

Also included in the repository are examples of the use of the modules, which were originally written as tests of the correct working of the methods, but which also as guides to understanding.

## Extension libraries

Clearly there is no limit to the extensibility of this development and users are encouraged to develop their own specialist modules to augment the core provided here.

Nevertheless, one extension module is included, as it provides a Graphical User Interface (GUI). This accesses the Java Swing toolkit.
