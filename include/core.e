--------------------------------------------------------------------------------
-- Library: core.e
--------------------------------------------------------------------------------
-- Notes:
--
--
--------------------------------------------------------------------------------
--/*
--= Euphoria Core Library
------
--[[[Version: 1.0.0
--Euphoria Versions: 3.1.1 and later
--Author: C A Newbould
--Date: 2020.08.05
--Status: operational; incomplete
--Changes:]]]
--* created
--* moved material from //object.e//
--* ##run## defined
--
------
--== Library holding basic type & functional definitions
--
-- This library has been created for use with the OOEU version of Euphoria.
--
-- The following summary gives a short-form indication of the contents of this
-- module.
--
--===Constants
--* //FALSE//
--* //TRUE//
--===Types
--* **boolean**
--===Routines
--* ##iif##(i,x,x) : x
--* ##run##(i,i) : s
--
-- Utilise these features
-- by adding the following statement to your module:
--<eucode>include core.e</eucode>
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
--/*
--=== Types
--*/
--------------------------------------------------------------------------------
global type boolean(integer this)
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
    if test then return true
    else return false
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
global function run(integer start, integer finish) : sequence -- {start..finish}
    if start > finish then return {}
    elsif start = finish then return {start}
    else return append(run(start, finish-1), finish)
    end if
end function
--------------------------------------------------------------------------------
--/*
--Parameters:
--# //start//: the first desired value
--# //finish//: the terminating value
--
-- Returns:
--
-- a **sequence**: the series of integers from //start// to //finish//
--*/
--------------------------------------------------------------------------------
-- Previous versions
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
