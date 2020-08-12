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
--[[[Version: 1.3.0
--OOEU Versions: 1.9.0 and later
--Author: C A Newbould
--Date: 2020.08.12
--Status: operational; incomplete
--Changes:]]]
--* ##power## defined
--* ##square## defined
--* ##sqrt## defined
--
------
--==OOEU Module Library: atom.e
--
-- The following summary gives a short-form indication of the contents of this
-- module.
--
--===Constants
--===Types
--* **character**(i)
--* **rid**(i)
--===Routines
--===Classes (methods)
--* **Atom**(**Object**)
--** ##Atom##(a) : A
--** ##abs##() : a
--** ##power##(a) : a
--** ##sign##() : i
--** ##square##() : a
--** ##sqrt##() : a
--* **Character**(**Integer**)
--** ##Character##(c) : C
--** ##lower##() : c
--** ##upper##() : c
--* **Integer** (**Atom**)
--** ##Integer(i) : I
--** ##div##(i) : i
--** ##mod##(i) : i
--* **Rid**(**Integer**)
--** ##routine_id##(s) : r
--** ##func([s]) : o
--** ##proc##([s])
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
    --include core.e -- for utilities
--------------------------------------------------------------------------------
--
--=== Constants
--
--------------------------------------------------------------------------------
constant CHARS = run(9, 13) & run(32, 126)
constant LOWER = run('a', 'z')
constant UNSET = -1
constant UPPER = run('A', 'Z')
--------------------------------------------------------------------------------
--/*
--=== Euphoria types
--*/
--------------------------------------------------------------------------------
global type character(integer c) -- control or printable ascii code
    return find(c, CHARS)
end type
--------------------------------------------------------------------------------
global type rid(integer r) -- routine_id value
    return r = UNSET or r >= 0
end type
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
    function power(atom pow) : atom
        return power(this, pow)
    end function
    function sign() : integer
        if this < 0 then return -1
        elsif this = 0 then return 0
        else return 1
        end if
    end function
    function square() : atom
        return this.power(2)
    end function
    function sqrt()
        if this >= 0 then return sqrt(this)
        else return {0, sqrt(-this)} -- complex (defined in sequence.e)
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
--<eucode>power(atom pow) : atom -- this raised to pow</eucode>
--<eucode>sign() : integer -- -1|0|1, depending on the sign</eucode>
--<eucode>square() : atom -- this squared</eucode>
--<eucode>sqrt() -- sqrt of this; either atom or complex</eucode>
--*/
--------------------------------------------------------------------------------
global euclass Integer(Atom self) -- single-valued integer objects: extends Atom
    function div(integer that) : integer
        return floor(this/that)
    end function
    function mod(integer that) : integer
        return remainder(this, that)
    end function
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
--<eucode>function div(integer that) : integer -- integer division this/that</eucode>
--<eucode>function mod(integer that) : integer -- modulus this of that</eucode>
--*/
--------------------------------------------------------------------------------
global euclass Character(Integer self) -- ascii coded objects: extends Integer
    function lower() : character
        if find(this, UPPER) then return this + 32
        else return this
        end if
    end function
    function upper() : character
        if find(this, LOWER) then return this - 32
        else return this
        end if
    end function
    function Character(character c) : Character
        return c
    end function
end euclass
--------------------------------------------------------------------------------
--/*
--====Property
--<eucode>character this</eucode>
--====Constructors
--<eucode>Character(character c) : Character -- assigns type-checked property value</eucode>
--====Methods
--<eucode>function lower() : character -- lower-case transformation</eucode>
--<eucode>function upper() : character -- upper-case transformation</eucode>
--*/
--------------------------------------------------------------------------------
global euclass Rid(rid self) -- routine_id Objects
    function func() : object
        return call_func(this, {})
    end function
    function func(sequence a) : object
        return call_func(this, {a})
    end function
    procedure proc()
        call_proc(this, {})
    end procedure
    procedure proc(sequence a)
        call_proc(this, {a})
    end procedure
end euclass
--------------------------------------------------------------------------------
--/*
--====Property
--<eucode>rid this</eucode>
--====Constructors
--<eucode>routine_id(sequence s) : Rid -- assigns type-checked property value</eucode>
--====Methods
--<eucode>function func([sequence args]) : object -- executes the function</eucode>
--<eucode>procedure proc([sequence args]) -- executes the procedure</eucode>
--*/
--------------------------------------------------------------------------------
--==== Defined instances
--
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Previous versions
--------------------------------------------------------------------------------
--[[[Version: 1.2.0
--OOEU Versions: 1.9.0 and later
--Author: C A Newbould
--Date: 2020.08.08
--Status: operational; incomplete
--Changes:]]]
--* **Rid** defined
--* ##Rid## defined
--* ##func## defined
--* ##proc## defined
--------------------------------------------------------------------------------
--[[[Version: 1.1.0
--OOEU Versions: 1.9.0 and later
--Author: C A Newbould
--Date: 2020.08.05
--Status: operational; incomplete
--Changes:]]]
--* created
--* ##div## defined
--* ##mod## defined
--* **character** defined
--* **Character** defined
--* ##lower## defined
--* ##upper## defined
--* **rid** defined
--------------------------------------------------------------------------------
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
--------------------------------------------------------------------------------
