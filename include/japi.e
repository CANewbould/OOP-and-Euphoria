--------------------------------------------------------------------------------
-- Library: japi.e
--------------------------------------------------------------------------------
-- Notes:
--
--
--------------------------------------------------------------------------------
--/*
--= OOEU Base Library for calling the Java Application Programming Interface
------
--[[[Version: 1.1.0
--OOEU Versions: 1.9.0 and later
--Author: C A Newbould
--Date: 2020.11.09
--Status: operational; incomplete
--Changes:]]]
--  * ##sleep## defined
--  * ##sync## defined
------
--==OOEU Base JAPI Library
--
-- The following summary gives a short-form indication of the contents of this
-- module.
--
--===Variables
--* Clib //japi//
--===Classes (methods)
--* **Japi**(**Clib**)
--** ##Japi##(s) : J
--** ##quit##()
--** ##sleep##(i)
--** ##start##() : b
--** ##sync##()
--
-- Utilise these features
-- by adding the following statement to your module:
--<eucode>include japi.e</eucode>
--
-- You will rarely need to do this, as the base library is automatically
-- called by the main JAPI library.
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
include sequence.e -- for String
    --include atom.e -- for Clib, Crid
--------------------------------------------------------------------------------
--
--=== Constants
--
--------------------------------------------------------------------------------
constant NOT_FOUND = 0
constant KEYBOARD = 0
--------------------------------------------------------------------------------
--
--=== Euphoria types
--
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--/*
--=== Variables
--*/
--------------------------------------------------------------------------------
String Abort Abort = "*** Press ENTER to abort ***"
String Failure Failure = "!!! Unable to locate the JAPI C-library !!!"
global Clib japi -- needed to pass through to japi.ew
--------------------------------------------------------------------------------
--
--=== Routines
--
--------------------------------------------------------------------------------
function fail()
    Failure.show(LF)
    Abort.show()
    if getc(KEYBOARD) then end if -- proxy for IO feature not yet defined
    return NOT_FOUND
end function
--------------------------------------------------------------------------------
--/*
--=== Classes
--*/
--------------------------------------------------------------------------------
global euclass Japi(Clib self) -- JAPI Object
    function start() : boolean
        Crid jstart
        jstart = Crid(this, "j_start", {}, C_BOOL)
        return jstart.func()
    end function
    procedure quit()
        Crid jquit
        jquit = Crid(this, "j_quit", {}, NULL)
        jquit.proc()
    end procedure
    procedure sleep(integer msecs)
        Crid jsleep
        jsleep = Crid(this, "j_sleep", {C_INT}, NULL)
        jsleep.proc({msecs})
    end procedure
    procedure sync()
        Crid jsync
        jsync = Crid(this, "j_sync", {}, NULL)
        jsync.proc()
    end procedure
    function Japi(sequence dll)
        japi = Clib(dll)
        if japi then return japi
        else return fail()
        end if
    end function
end euclass
--------------------------------------------------------------------------------
--/*
--====Property
--<eucode>clib this</eucode>
--====Constructors
--<eucode>Japi(sequence dll) : Japi -- assigns type-checked property value</eucode>
--====Methods
--<eucode>function start() : boolean -- [successful] connection to interface</eucode>
--<eucode>procedure quit() -- disconnect interface</eucode>
--*/
--------------------------------------------------------------------------------
--
--==== Defined instances
--
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Previous versions
--------------------------------------------------------------------------------
--[[[Version: 1.0.1
--OOEU Versions: 1.9.0 and later
--Author: C A Newbould
--Date: 2020.08.25
--Status: operational; incomplete
--Changes:]]]
--  * //japi// defined
--------------------------------------------------------------------------------
--[[[Version: 1.0.0
--OOEU Versions: 1.9.0 and later
--Author: C A Newbould
--Date: 2020.08.22
--Status: operational; incomplete
--Changes:]]]
--  * created
--  * **Japi** defined
--  * ##Japi## defined
--  * ##start## defined
--  * ##quit## defined
--------------------------------------------------------------------------------
