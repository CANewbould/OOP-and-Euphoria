--------------------------------------------------------------------------------
-- Example: atom.ex
--------------------------------------------------------------------------------
-- Notes:
--
-- Connected processes are placed together on a single line for clarity
--------------------------------------------------------------------------------
--/*
--= Example using OOEU library atom.e
------
--[[[Version: 1.3.0
--Euphoria Versions: 3.1.1 and later
--Author: C A Newbould
--Date: 2021.02.27
--Status: operational; incomplete
--Changes:]]]
--* further test for ##Clib## added
--* further test for ##Crid## added
--
------
--== Module holding examples of Atom Objects
--
------
--*/
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--
--=== Includes
--
--------------------------------------------------------------------------------
include ..\include\sequence.e
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
--------------------------------------------------------------------------------
--
--=== Routines
--
--------------------------------------------------------------------------------
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
    Atom a, a_
    Character c, c_
    Integer i, i_
    Clib iup
    Crid iopen
    Crid mbox
    complex s
    Clib user
    title.heading()
    a = Atom(-4.6) a.show("The absolute value of %.1f is ") a_ = a.abs() a_.show()
    a.show("The sign of %.1f is ") a_ = a.sign() a_.show()
    a_ = a.square() a.show("The square of %.1f") a_.show(" is %.2f\n")
    a_ = a.power(3) a.show("The cube of %.1f") a_.show(" is %.2f\n")
    s = a.sqrt() a.show("The square root of %.1f") a_ = s[2] a_.show(" is %.2fi\n")
    i = Integer(13) i.show("%d integer-divided by ") i_ = Integer(4) i_.show("%d = ") ?i.div(i_)
    i.show("%d mod ") i_.show("%d = ") ?i.mod(i_)
    c = Character('s') c.show("Upper-case '%s' = ") c_ = c.upper() c_.show("'%s'\n")
    user = Clib("user32.dll")
    user.show("The handle to 'user32.dll' is %d\n")
    mbox = Crid(user, "MessageBoxA", {C_POINTER, C_POINTER, C_POINTER, C_INT}, C_INT)
    mbox.show("The handle to 'MessageBoxA' is %d\n")
    iup = Clib("\\dll\\32\\iup.dll")
    iup.show("The handle to 'iup.dll' is %d\n")
    iopen = Crid(iup, "+IupOpen", {C_INT, C_POINTER}, C_INT)
    iopen.show("The handle to 'IupOpen' is %d\n")
end procedure
--------------------------------------------------------------------------------
-- Execution
--------------------------------------------------------------------------------
main("Testing Atom library")
--------------------------------------------------------------------------------
-- Previous versions
--------------------------------------------------------------------------------
--[[[Version: 1.2.0
--Euphoria Versions: 3.1.1 and later
--Author: C A Newbould
--Date: 2021.01.19
--Status: operational; incomplete
--Changes:]]]
--* test for ##Clib## added
--* test for ##Crid## added
--------------------------------------------------------------------------------
--[[[Version: 1.1.0
--Euphoria Versions: 3.1.1 and later
--Author: C A Newbould
--Date: 2020.08.12
--Status: operational; incomplete
--Changes:]]]
--* created
--* test for ##power## added
--* test for ##square## added
--* test for ##sqrt## added
--------------------------------------------------------------------------------
--[[[Version: 1.0.0
--Euphoria Versions: 3.1.1 and later
--Author: C A Newbould
--Date: 2020.08.06
--Status: operational; incomplete
--Changes:]]]
--* created
--* test for ##abs## added
--* test for ##sign## added
--* test for ##div## added
--* test for ##mod## added
--* test for ##upper## added
--------------------------------------------------------------------------------
