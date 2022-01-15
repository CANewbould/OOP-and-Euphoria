--------------------------------------------------------------------------------
-- Example: file.ex
--------------------------------------------------------------------------------
-- Notes:
--
-- Connected processes are placed together on a single line for clarity
--------------------------------------------------------------------------------
--/*
--= Example using OOEU library file.e
------
--[[[Version: 1.1.1
--Euphoria Versions: 3.1.1 and later
--Author: C A Newbould
--Date: 2022.01.15
--Status: operational; incomplete
--Changes:]]]
--* modified output to add a LF
--
------
--== Module holding examples of File Objects
--
------
--*/
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--
--=== Includes
--
--------------------------------------------------------------------------------
include file.e
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
    File atm
    sequence info
    String mess
    string mode
    mode = "r"
    atm = File("atom.ex", mode)
    title.heading()
    info = atm.getInfo()
    mess = "Handle to '" & info[3] & "': " mess.show(LF)
    mess = "Opening mode: " & info[2] mess.show(LF)
    mess = "The first line is:"  mess.show(LF)
    mess = atm.next() mess.show(LF)
    mess = "The next 15 characters are: " mess.show()
    mess = atm.read(15) mess.show(LF)
    mess = "We are now at position: " mess.show() ?atm.tell()
    mess = "Re-position to start of file" mess.show(LF)
    if atm.seek(0) then mess = "We are now at position: " mess.show() ?atm.tell() end if
    mess = "The file 'atom.ex' has length = " mess.show() ?atm.length()
    atm.close()
end procedure
--------------------------------------------------------------------------------
-- Execution
--------------------------------------------------------------------------------
main("Testing File library")
--------------------------------------------------------------------------------
-- Previous versions
--------------------------------------------------------------------------------
--[[[Version: 1.1.0
--Euphoria Versions: 3.1.1 and later
--Author: C A Newbould
--Date: 2021.01.19
--Status: operational; incomplete
--Changes:]]]
--* simplified by using ##length##
--------------------------------------------------------------------------------
--[[[Version: 1.0.1
--Euphoria Versions: 3.1.1 and later
--Author: C A Newbould
--Date: 2021.01.18
--Status: operational; incomplete
--Changes:]]]
--* revised output
--------------------------------------------------------------------------------
--[[[Version: 1.0.0
--Euphoria Versions: 3.1.1 and later
--Author: C A Newbould
--Date: 2021.01.18
--Status: operational; incomplete
--Changes:]]]
--* created
--------------------------------------------------------------------------------
