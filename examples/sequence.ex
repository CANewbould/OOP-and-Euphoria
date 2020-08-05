--------------------------------------------------------------------------------
-- Example: sequence.ex
--------------------------------------------------------------------------------
-- Notes:
--
--
--------------------------------------------------------------------------------
--/*
--= Example using OOEU library sequence.e
------
--[[[Version: 1.0.0
--Euphoria Versions: 3.1.1 and later
--Author: C A Newbould
--Date: 2020.08.05
--Status: operational; incomplete
--Changes:]]]
--* created
--* ##length## tested
--* Upper and Lower cases tested
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
String Len Len = "The length is: "
String Low Low = "Transform to Lower-Case: "
String Seq Seq = "The sequence is: "
String Upp Upp = "Transform to Upper-Case: "
--------------------------------------------------------------------------------
--
--=== Routines
--
--------------------------------------------------------------------------------
function toLower(Character c)
    return c.lower()
end function
constant DOWN = routine_id("toLower")
--------------------------------------------------------------------------------
function toUpper(Character c)
    return c.upper()
end function
constant UP = routine_id("toUpper")
--------------------------------------------------------------------------------
procedure main(String title)
    String dashes
    Integer l
    integer t
    String s, transformed
    t = length(title)
    dashes = repeat('-', t)
    dashes.show(LF) title.show(LF) dashes.show(LF)
    s = String("I am the way, the truth and the light!")
    Seq.show() s.show(LF)
    Len.show() l = s.length() l.show()
    Upp.show() transformed = s.map(UP) transformed.show(LF)
    Low.show() transformed = s.map(DOWN) transformed.show(LF)
end procedure
--------------------------------------------------------------------------------
-- Execution
--------------------------------------------------------------------------------
main("Testing Sequence library")
--------------------------------------------------------------------------------
-- Previous versions
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
