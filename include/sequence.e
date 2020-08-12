--------------------------------------------------------------------------------
-- Library: sequence.e
--------------------------------------------------------------------------------
-- Notes:
--
--
--------------------------------------------------------------------------------
--/*
--= OOEU Library for the Sequence Class and all derived classes
------
--[[[Version: 1.2.0
--OOEU Versions: 1.9.0 and later
--Author: C A Newbould
--Date: 2020.08.12
--Status: operational; incomplete
--Changes:]]]
--* **complex** defined
--
------
--==OOEU Module Library: sequence.e
--
-- The following summary gives a short-form indication of the contents of this
-- module.
--
--===Constants
--===Types
--* **complex**(**vector**)
--* **string**(**sequence**)
--* **vector**(**sequence**)
--===Routines
--===Classes (methods)
--* **Sequence**(**Object**)
--** ##Sequence(s) : S
--** ##Sequence(o,i) : S
--** ##filter(r) : s
--** ##fold##(r,x) : x
--** ##length() : i
--** ##map(r) : s
--** ##reverse() : s
--* **String**(**Sequence**)
--** ##String##(str) : Str
--** ##show()
--** ##show(b)
--* **Vector**(**Sequence**)
--** ##Vector##() : V
--** ##Vector##(i,i) : V
--
-- Utilise these features
-- by adding the following statement to your module:
--<eucode>include sequence.e</eucode>
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
include atom.e -- for types
    --include object.e -- parent
    --include core.e -- for utilities
--------------------------------------------------------------------------------
--/*
--=== Constants
--*/
--------------------------------------------------------------------------------
global constant LF = TRUE -- trigger for line-feed
--------------------------------------------------------------------------------
--/*
--=== Euphoria types
--*/
--------------------------------------------------------------------------------
global type string(sequence str) -- all characters
    for i = 1 to length(str) do
        if character(str[i]) then continue
        else return FALSE
        end if
    end for
    return TRUE
end type
--------------------------------------------------------------------------------
global type vector(sequence str) -- all atoms
    for i = 1 to length(str) do
        if atom(str[i]) then continue
        else return FALSE
        end if
    end for
    return TRUE
end type
--------------------------------------------------------------------------------
global type complex(vector v) -- complex number holder - {real,imaginary}
    return length(v) = 2
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
global euclass Sequence(Object self) -- the type class for all multi-valued objects: extends Object
    function filter(Rid fn) : sequence
        sequence result
        result = {}
        for i = 1 to length(this) do
            if fn.func({this[i]}) then result &= this[i]
            else continue
            end if
        end for
        return result
    end function
    function foldr(rid fn, object init) : object
        object result
        result = init
        for i = 1 to length(this) do
            result = call_func(fn, {result, this[i]})
        end for
        return result
    end function
    function length() : integer
        return length(this)
    end function
    function map(rid fn) : sequence
        for i = 1 to length(this) do
            this[i] = call_func(fn, {this[i]})
        end for
        return this
    end function
    function reverse() : sequence
        sequence result
        result = {}
        for i = 1 to length(this) do
            result = prepend(result, this[i])
        end for
        return result
    end function
    function Sequence(sequence s) : Sequence
        return s -- type-checking
    end function
    function Sequence(object o, integer i) : Sequence
        return repeat(o, i)
    end function
end euclass
--------------------------------------------------------------------------------
--/*
--====Property
--<eucode>sequence this</eucode>
--====Constructors
--<eucode>Sequence(sequence s) : Sequence -- assigns type-checked property value</eucode>
--<eucode>Sequence(object o, integer i) : Sequence -- o repeated i times</eucode>
--====Methods
--<eucode>function filter(rid fn) : sequence -- selected elements of the source - this if fn this
--<eucode>function foldr(rid fn, object init) : object -- the accumulation of elements in the sequence, starting with init
--<eucode>function length() : integer -- the number of elements in the "outer" sequence
--<eucode>function map(rid fn) : sequence -- the transformed source - fn this
--<eucode>function reverse() : sequence -- the source reversed: {this[$]..this[1]}
--*/
--------------------------------------------------------------------------------
global euclass String(Sequence self) -- all character-based Objects
    procedure show()
        puts(1, this)
    end procedure
    procedure show(boolean lf)
        if lf then this &= '\n'
        else this = this
        end if
        puts(1, this)
    end procedure
    function String(string str) : string
        return str
    end function
end euclass
--------------------------------------------------------------------------------
--/*
--====Property
--<eucode>string this</eucode>
--====Constructors
--<eucode>String(string s) : String -- assigns type-checked property value</eucode>
--====Methods
--<eucode>procedure show([boolean lf]) -- displays the source</eucode>
--*/
--------------------------------------------------------------------------------
global euclass Vector(Sequence self) -- all-atom array Objects
    function Vector(vector v) : Vector
        return v
    end function
    function Vector(integer s, integer f) : Vector
        return run(s, f)
    end function
end euclass
--------------------------------------------------------------------------------
--/*
--====Property
--<eucode>vector this</eucode>
--====Constructors
--<eucode>Vector(vector v) : Vector -- assigns type-checked property value</eucode>
--<eucode>Vector(integer s, integer f) : Vector -- {s..f}</eucode>
--====Methods
--*/
--------------------------------------------------------------------------------
--==== Defined instances
--
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Previous versions
--------------------------------------------------------------------------------
--[[[Version: 1.1.1
--OOEU Versions: 1.9.0 and later
--Author: C A Newbould
--Date: 2020.08.08
--Status: operational; incomplete
--Changes:]]]
--* addressed knock-on effects of defining **Rid** in //atom.e//
--  had to leave two definitions as-is because of calling issues
--------------------------------------------------------------------------------
--[[[Version: 1.1.0
--OOEU Versions: 1.9.0 and later
--Author: C A Newbould
--Date: 2020.08.05
--Status: operational; incomplete
--Changes:]]]
--* ##Sequence## extended
--* **Vector** defined
--* ##Vector## defined - two versions
--------------------------------------------------------------------------------
--[[[Version: 1.0.1
--OOEU Versions: 1.9.0 and later
--Author: C A Newbould
--Date: 2020.08.05
--Status: operational; incomplete
--Changes:]]]
--* changed include to embrace //atom.e//
--* ##reverse## defined
--* ##map## defined
--* ##filter## defined
--* **string** defined
--* **String** defined
--* ##String## defined
--* ##show## defined
--* **vector** defined
--------------------------------------------------------------------------------
--[[[Version: 1.0.0
--OOEU Versions: 1.9.0 and later
--Author: C A Newbould
--Date: 2020.08.04
--Status: operational; incomplete
--Changes:]]]
--* created
--* **Sequence** defined
--* ##Sequence## defined
--* ##length## defined
--------------------------------------------------------------------------------
