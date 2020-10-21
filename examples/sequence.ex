--------------------------------------------------------------------------------
-- Example: sequence.ex
--------------------------------------------------------------------------------
-- Notes:
--
-- Connected processes are placed together on a single line for clarity
--------------------------------------------------------------------------------
--/*
--= Example using OOEU library sequence.e
------
--[[[Version: 1.4.0
--Euphoria Versions: 3.1.1 and later
--Author: C A Newbould
--Date: 2020.08.22
--Status: operational; incomplete
--Changes:]]]
--* modified test of ##sum##
--
------
--== Module holding examples of Sequence Objects
--
------
--*/
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--
--=== Includes
--
--------------------------------------------------------------------------------
include sequence.e
--------------------------------------------------------------------------------
--
--=== Constants
--
--------------------------------------------------------------------------------
constant M_INSTANCE = 55
--------------------------------------------------------------------------------
--
--=== Types
--
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--
--=== Variables
--
--------------------------------------------------------------------------------
String Filter Filter = "Even numbers between 10 and 20: "
String Low Low = "Transform to Lower-Case: "
String Rev Rev = "Evens in descending order: "
String Seq Seq = "The sequence is: "
String Upp Upp = "Transform to Upper-Case: "
String Vec Vec = "The run from -5 to +5 in absolute terms is: " --v1.3.0
--------------------------------------------------------------------------------
--
--=== Routines
--
--------------------------------------------------------------------------------
function toLower(Character c) : character
    return c.lower()
end function
constant DOWN = routine_id("toLower")
--------------------------------------------------------------------------------
function toUpper(Character c) : character
    return c.upper()
end function
constant UP = routine_id("toUpper")
--------------------------------------------------------------------------------
function even(Integer n) : boolean
    return (n.mod(2) = 0)
end function
constant EVEN = routine_id("even")
--------------------------------------------------------------------------------
--v1.3.0 starts
function abs_(Atom a) : atom
    return a.abs()
end function
constant ABS = routine_id("abs_")
--v1.3.0 ends
--------------------------------------------------------------------------------
--
--=== Classes
--
--------------------------------------------------------------------------------
--*** v1.2.0 starts
euclass App(atom self)
    function App()
        return machine_func(M_INSTANCE, 0)
    end function
    procedure main(String title)
        Integer l
        Vector list
        String s
        String transformed
        String dashes
        dashes = Sequence('-', length(title))
        dashes.show(LF) title.show(LF) dashes.show(LF)
        Seq.show() s = String("I am the way, the truth and the light!") s.show(LF)
        l = s.length() l.show("The length is: %d\n")
        Upp.show() transformed = s.map(UP) transformed.show(LF)
        Low.show() transformed = s.map(DOWN) transformed.show(LF)
        list = Vector(1, 10) l = list.sum() l.show("The sum of [1..10] is %d\n") --v1.4.0
        Filter.show() list = 2*list list = list.filter(EVEN) list.show()
        list = list.reverse() Rev.show() list.show()
        list = run(-5,5) Vec.show() list = list.map(ABS) list.show() --v1.3.0
    end procedure
end euclass
--------------------------------------------------------------------------------
-- Execution
--------------------------------------------------------------------------------
App seqeg seqeg = App() -- instantiate
seqeg.main("Testing Sequence library") -- execute 'main'
--*** v1.2.0 ends
--------------------------------------------------------------------------------
-- Previous versions
--------------------------------------------------------------------------------
--[[[Version: 1.3.0
--Euphoria Versions: 3.1.1 and later
--Author: C A Newbould
--Date: 2020.08.12
--Status: operational; incomplete
--Changes:]]]
--* added a ##map## to a **Vector**
--------------------------------------------------------------------------------
--[[[Version: 1.2.0
--Euphoria Versions: 3.1.1 and later
--Author: C A Newbould
--Date: 2020.08.08
--Status: operational; incomplete
--Changes:]]]
--* added an App definition & moved former 'Head' into it
--------------------------------------------------------------------------------
--[[[Version: 1.1.0
--Euphoria Versions: 3.1.1 and later
--Author: C A Newbould
--Date: 2020.08.05
--Status: operational; incomplete
--Changes:]]]
--* extended version of ##show## utilised
--* ##foldr## exemplified
--* ##filter## exemplified
--* ##Sequence##(o,i) utilised
--* **Vector** utilised
--* ##Vector## utilised
--* local Head class defined
--* ##reverse## tested
--------------------------------------------------------------------------------
--[[[Version: 1.0.0
--Euphoria Versions: 3.1.1 and later
--Author: C A Newbould
--Date: 2020.08.05
--Status: operational; incomplete
--Changes:]]]
--* created
--* ##length## tested
--* Upper and Lower cases tested
--------------------------------------------------------------------------------
