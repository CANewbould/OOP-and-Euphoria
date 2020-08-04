--------------------------------------------------------------------------------
-- Library: object.e
--------------------------------------------------------------------------------
-- Notes:
--
--
--------------------------------------------------------------------------------
--/*
--= OOEU Library for the Object Class
------
--[[[Version: 1.0.0
--OOEU Versions: 1.9.0 and later
--Author: C A Newbould
--Date: 2020.08.04
--Status: operational; incomplete
--Changes:]]]
--* created
--* //TRUE// and //FALSE// defined
--* **boolean** defined
--* ##iif## defined
--* **Object** defined
--* ##show## (**Object**) defined
--
------
--==OOEU core library: object.e
--===Constants
--* //FALSE//
--* //TRUE//
--===Types
--* **boolean**
--===Routines
--* ##iif##(i,x,x) : x
--===Classes (methods)
--* **Object**
--** ##show##()
--
-- Utilise these features
-- by adding the following statement to your module:
--<eucode>include object.e</eucode>
--
------
--*/
--------------------------------------------------------------------------------
--/*
--==Interface
--*/
--------------------------------------------------------------------------------
--
--=== Includes
--
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--/*
--=== Constants
--*/
--------------------------------------------------------------------------------
global constant FALSE = (1=0)
global constant TRUE = (1=1)
--------------------------------------------------------------------------------
--
--=== Euphoria types
--
--------------------------------------------------------------------------------
type boolean(integer this)
    return this = TRUE or this = FALSE
end type
--------------------------------------------------------------------------------
--
--=== Variables
--
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--/*
--=== Routines
--*/
--------------------------------------------------------------------------------
global function iif(integer test, object true, object false) : object -- inline if statement
    if test then true
    else false
    end if
end function
--------------------------------------------------------------------------------
--/*
--Parameters:
--# //test//: expression which return a Euphoria true/false
--# //true//: the value to return if the expression is true
--# //false//: the value to return if the expression is false
--
-- Returns:
--
-- an **object**: either //true// or //false//
--*/
--------------------------------------------------------------------------------
--/*
--=== Classes
--*/
--------------------------------------------------------------------------------
global euclass Object(object self) -- the base (anonymous) class
    procedure show()
        ?this
    end procedure
end euclass
--------------------------------------------------------------------------------
--/*
--====Property
--<eucode>object this</eucode>
--====Methods
--<eucode>show() -- displays (prettily) the Object's property value</eucode>
--*/
--------------------------------------------------------------------------------
--==== Defined instances
--
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Previous versions
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
