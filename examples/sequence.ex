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
function add(integer acc, integer n) : integer
    return acc + n
end function
constant ADD = routine_id("add")
--------------------------------------------------------------------------------
function even(Integer n) : boolean
    return (n.mod(2) = 0)
end function
constant EVEN = routine_id("even")
--------------------------------------------------------------------------------
--
--=== Classes
--
--------------------------------------------------------------------------------
euclass Head(String self)
    procedure heading()
        String dashes
        integer t
        t = length(this)
        dashes = Sequence('-', t)
        dashes.show(LF) this.show(LF) dashes.show(LF)
    end procedure
end euclass
--------------------------------------------------------------------------------
--
--=== Main routine
--
--------------------------------------------------------------------------------
procedure main(Head title)
    Integer l
    Vector list
    String s
    String transformed
    title.heading()
    Seq.show() s = String("I am the way, the truth and the light!") s.show(LF)
    l = s.length() l.show("The length is: %d\n")
    Upp.show() transformed = s.map(UP) transformed.show(LF)
    Low.show() transformed = s.map(DOWN) transformed.show(LF)
    list = Vector(1, 10) l = list.foldr(ADD, 0) l.show("The sum of [1..10] is %d\n")
    Filter.show() list = 2*list list = list.filter(EVEN) list.show()
    list = list.reverse() Rev.show() list.show()
end procedure
--------------------------------------------------------------------------------
-- Execution
--------------------------------------------------------------------------------
main("Testing Sequence library")
--------------------------------------------------------------------------------
-- Previous versions
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
