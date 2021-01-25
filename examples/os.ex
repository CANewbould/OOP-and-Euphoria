--------------------------------------------------------------------------------
-- Example: os.ex
--------------------------------------------------------------------------------
-- Notes:
--
-- Connected processes are placed together on a single line for clarity
--------------------------------------------------------------------------------
--/*
--= Example using OOEU library os.e
------
--[[[Version: 1.0.1
--Euphoria Versions: 3.1.1 and later
--Author: C A Newbould
--Date: 2021.01.18
--Status: operational; incomplete
--Changes:]]]
--* added confirmation line
--* removed test lines
--
------
--== Module holding examples of OS Objects
--
------
--*/
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--
--=== Includes
--
--------------------------------------------------------------------------------
include os.e
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
    OS os
    String mess
    os = OS()
    title.heading()
    mess = "The current OS is "
    mess.show()
    if os = 2 then mess = "MS Windows"
    else mess =  "a variant of UNIX"
    end if
    mess.show(LF)
    mess = "The current directory is: '%s'" & os.getcwd() & "'" mess.show(LF)
    mess = "Change the directory to 'GitHub'" mess.show(LF)
    if os.chdir("\\GitHub") then
        mess = "The current directory is: '%s'" & os.getcwd() & "'" mess.show(LF)
    end if
    mess = "Try creating a sub-directory 'Fred' here" mess.show(LF)
    if os.mkdir("Fred") then mess = "!! Successful !!" mess.show(LF) end if
end procedure
--------------------------------------------------------------------------------
-- Execution
--------------------------------------------------------------------------------
main("Testing OS library")
--------------------------------------------------------------------------------
-- Previous versions
--------------------------------------------------------------------------------
--[[[Version: 1.0.0
--Euphoria Versions: 3.1.1 and later
--Author: C A Newbould
--Date: 2021.01.18
--Status: operational; incomplete
--Changes:]]]
--* created
--------------------------------------------------------------------------------
