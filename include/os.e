--------------------------------------------------------------------------------
-- Library: os.e
--------------------------------------------------------------------------------
-- Notes:
--
--
--------------------------------------------------------------------------------
--/*
--= OOEU Library for the OS Class
------
--[[[Version: 1.0.0
--OOEU Versions: 1.9.0 and later
--Author: C A Newbould
--Date: 2021.01.18
--Status: operational; incomplete
--Changes:]]]
--* created
--Changes:]]]
--* created
--* **OS** defined
--* ##OS## defined
--* OS constants defined
--* ##getcwd## defined
--* ##chdir## defined
--* ##mkdir## defined
--
------
--==OOEU extension library: os.e
--
-- The following summary gives a short-form indication of the contents of this
-- module.
--
--===Classes (methods)
--* **OS**(integer)
--** ##OS##() : OS
--** ##chdir##(string) : boolean
--** ##getcwd##() : string
--** ##mkdir##(string) : boolean
--
-- Utilise these features
-- by adding the following statement to your module:
--<eucode>include os.e</eucode>
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
include atom.e -- for Clib, Crid, func
include sequence.e -- for String
--------------------------------------------------------------------------------
function If(boolean test, object ifTrue, object ifFalse)
    if test then return ifTrue
    else return ifFalse
    end if
end function
--------------------------------------------------------------------------------
--
--=== Constants
--
--------------------------------------------------------------------------------
constant M_CHDIR = 63
constant M_CURRENT_DIR = 23
global constant FREEBSD = 8
global constant LINUX = 3
global constant NETBSD = 7
global constant OSX = 4
global constant OPENBSD = 6
global constant WIN32 = 2
global constant WINDOWS = WIN32
constant SLASH = If(platform() = WINDOWS, '\\', '/')
--------------------------------------------------------------------------------
--
--=== Euphoria types
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
--/*
--=== Classes
--*/
--------------------------------------------------------------------------------
global euclass OS(integer self) -- the Operating System Class
    function OS() : OS
        return platform()
    end function
    function chdir(string newDirectory) : boolean
        return machine_func(M_CHDIR, newDirectory)
    end function
    function getcwd() : string
        return machine_func(M_CURRENT_DIR, 0)
    end function
    function mkdir(String newDirectory) : boolean
        Sequence cArgs
        String kernel
        Clib kLib
        integer mode
        atom pname
        integer retTyp
        Crid xCD
        String xCDName
        if not newDirectory.length() then return FALSE end if
        -- Remove any trailing slash.
        if newDirectory[$] = SLASH then newDirectory = newDirectory[1..$-1] end if 
        pname = newDirectory.toC()
        if this = WINDOWS then
            kernel = "kernel32.dll" xCDName = "CreateDirectoryA" mode = 0
            cArgs = {C_POINTER, C_POINTER} retTyp = C_BOOL
        else
            kernel = "libc.so" xCDName = "mkdir" mode = 448
            cArgs = {C_POINTER, C_INT} retTyp = C_INT
        end if
        kLib = Clib(kernel)
        xCD = Crid(kLib, xCDName, cArgs, retTyp)
        return xCD.func({pname, mode})
    end function
    end euclass
--------------------------------------------------------------------------------
--/*
--====Property
--<eucode>OS this</eucode>
--====Constructors
--<eucode>OS() : OS -- the current Operating System</eucode>
--====Methods
--<eucode>function chdir(string newDirectory) : boolean -- [un]successful change of the current directory</eucode>
--<eucode>function getcwd() : string -- the current directory</eucode>
--<eucode>function mkdir(string newDirectory) : boolean -- [un]successful creation of a new directory</eucode>
--*/
--------------------------------------------------------------------------------
--==== Defined instances
--
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Previous versions
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
