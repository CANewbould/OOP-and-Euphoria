--------------------------------------------------------------------------------
-- Library: atom.e
--------------------------------------------------------------------------------
-- Notes:
--
--
--------------------------------------------------------------------------------
--/*
--= OOEU Library for the Atom Class and all derived classes
------
--[[[Version: 1.0.0
--OOEU Versions: 1.9.0 and later
--Author: C A Newbould
--Date: 2020.08.04
--Status: operational; incomplete
--Changes:]]]
--* created
--* **Atom** defined
--* ##abs## defined
--* ##sign## defined
--* ##Atom## defined
--* **Integer## defined
--* ##Integer## defined
--
------
--==OOEU Module Library: atom.e
--===Constants
--===Types
--===Routines
--===Classes (methods)
--* **Atom**(**Object**)
--** ##Atom##(a) : A
--** ##abs##() : a
--** ##sign##() : i
--* **Integer** (**Atom**)
--** ##Integer(i) : I
--
-- Utilise these features
-- by adding the following statement to your module:
--<eucode>include atom.e</eucode>
--
------
--*/
--------------------------------------------------------------------------------
--/*
--==Interface
--*/
--------------------------------------------------------------------------------
--/*
--=== Includes
--*/
--------------------------------------------------------------------------------
include object.e -- parent
--------------------------------------------------------------------------------
--
--=== Constants
--
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--
--=== Euphoria types
--
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--
--=== Variables
--
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--
--=== Routines
--
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--/*
--=== Classes
--*/
--------------------------------------------------------------------------------
global euclass Atom(Object self) -- the type class for all single-valued objects: extends Object
    function abs() : atom
        if this < 0 then return (0-this)
        else return this
        end if
    end function
    function sign() : integer
        if this < 0 then return -1
        elsif this = 0 then return 0
        else return 1
        end if
    end function
    function Atom(atom a) : Atom
        return a -- type-checking
    end function
end euclass
--------------------------------------------------------------------------------
--/*
--====Property
--<eucode>atom this</eucode>
--====Constructors
--<eucode>Atom(atom a) : Atom -- assigns type-checked property value</eucode>
--====Methods
--<eucode>abs() : atom -- the absolute value</eucode>
--<eucode>sign() : integer -- -1|0|1, depending on the sign</eucode>
--*/
--------------------------------------------------------------------------------
global euclass Integer(Atom self) -- single-valued integer objects; extends Atom
    function Integer(integer i) : Integer
        return i -- type-checking
    end function
end euclass
--------------------------------------------------------------------------------
--/*
--====Property
--<eucode>integer this</eucode>
--====Constructors
--<eucode>Integer(integer i) : Integer -- assigns type-checked property value</eucode>
--====Methods
--*/
--------------------------------------------------------------------------------
--==== Defined instances
--
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Previous versions
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
