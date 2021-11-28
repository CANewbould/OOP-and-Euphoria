--------------------------------------------------------------------------------
-- Library: file.e
--------------------------------------------------------------------------------
-- Notes:
--
-- ##readlines## needs to trim trailing LF
--------------------------------------------------------------------------------
--/*
--= OOEU Library for the File Class
------
--[[[Version: 1.1.1
--OOEU Versions: 1.9.0 and later
--Author: C A Newbould
--Date: 2021.03.28
--Status: operational; complete
--Changes:]]]
--* ##readlines## modified
--
------
--==OOEU extension library: file.e
--
-- The following summary gives a short-form indication of the contents of this
-- module.
--
--===Classes (methods)
--* **File**(handle)
--** ##File##(string, string) : File
--** ##close##()
--** ##fileno##() : File
--** ##flush##()
--** ##getInfo##() : sequence
--** ##length##() : integer
--** ##next##() : object (EOF|string)
--** ##read##(integer) : sequence
--** ##readline##() : object
--** ##readlines##() : sequence
--** ##seek##(integer[, integer]) : boolean
--** ##tell##() : integer
--** ##truncate##(integer)
--** ##write##(object)
--** ##writelines##(sequence)
--
-- Utilise these features
-- by adding the following statement to your module:
--<eucode>include file.e</eucode>
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
--------------------------------------------------------------------------------
--
--=== Constants
--
--------------------------------------------------------------------------------
constant EOF = -1
constant M_FLUSH = 60
constant M_SEEK  = 19
constant M_TELL = 20
constant UNSET = -1
--------------------------------------------------------------------------------
--
--=== Euphoria types
--
--------------------------------------------------------------------------------
type handle(integer self)
    return self = UNSET or self >= 3
end type
--------------------------------------------------------------------------------
--
--=== Variables
--
--------------------------------------------------------------------------------
sequence fileInfo fileInfo = {}
--------------------------------------------------------------------------------
--
--=== Routines
--
--------------------------------------------------------------------------------
--/*
--=== Classes
--*/
--------------------------------------------------------------------------------
global euclass File(handle self) -- a file handle
    function File(string fileName, string mode) : File
        fileInfo = {TRUE, mode, fileName}
        return open(fileName, mode)
    end function
    procedure close()
        close(this)
        fileInfo[1] = FALSE
    end procedure
    function fileno() : File
        return this
    end function
    procedure flush()
        machine_proc(M_FLUSH, this)
    end procedure
    function getInfo() : sequence
        return fileInfo
    end function
    function next() : object
        object line
        line = gets(this)
        if atom(line) then return line
        else return line[1..$-1]
        end if
    end function
    function read(integer bytes) : sequence
        sequence text
        text = ""
        if fileInfo[1] then -- only if open
            for i = 1 to bytes do
                text &= getc(this)
            end for
        end if
        return text
    end function
    function readline() : object
        return gets(this)
    end function
    function readlines() : sequence
        object line
        sequence lines
        lines = {}
        line = gets(this)
        while line != EOF do
            lines = append(lines, line[1..$-1])
            line = gets(this)
        end while
        return lines
    end function
    function seek(integer offset) : boolean
        return not machine_func(M_SEEK, {this, offset})
    end function
    function seek(integer offset, integer from) : boolean
        boolean ret
        ret = this.seek(from)
        return this.seek(offset)
    end function
    function tell() : integer
        return machine_func(M_TELL, this)
    end function
    procedure write(object str)
        puts(this, str)
    end procedure
    procedure writelines(sequence strs)
        for i = 1 to length(strs) do
            puts(this, strs[i])
        end for
    end procedure
    procedure truncate(integer size)
        boolean ret
        integer len
        sequence data
        ret = this.seek(0) -- start
        ret = this.seek(-1) -- end
        len = this.tell() --> # characters
        if len > size then -- truncate
            ret = this.seek(0) -- back to start
            data = this.read(size) -- overwrite
            ret = this.seek(0) -- back to start
            this.write(data)
        else -- nothing to do
        end if
    end procedure
    function length() : integer
        boolean ret
        integer len
        ret = this.seek(-1) -- to end
        len = this.tell()
        ret = this.seek(0) -- to start
        return len
    end function
end euclass
--------------------------------------------------------------------------------
--/*
--====Property
--<eucode>handle this</eucode>
--====Constructors
--<eucode>File(string fileName, string mode) : File</eucode>
--====Methods
--<eucode>procedure close() -- closes File Object and releases handle</eucode>
--<eucode>function fileno() : File -- 'this' handle</eucode>
--<eucode>procedure flush() -- flushes the File Object's buffer</eucode>
--<eucode>function getInfo() : sequence -- {isOpen, mode, name}</eucode>
--<eucode>function length() : integer -- # bytes in file</eucode>
--<eucode>function next() : object -- read from File Object - EOF or next line, less LF/CR</eucode>
--<eucode>function read(integer bytes) : string -- read from File Object <= {next 'bytes'}</eucode>
--<eucode>function readline() : object -- read from File Object - EOL or next line, including LF/CR</eucode>
--<eucode>function readlines() : sequence -- read from File Object - {line1,...}</eucode>
--<eucode>function seek(integer offset[, integer from]) : boolean -- moves offset characters forward [from a position]</eucode>
--<eucode>function tell() : integer -- zero-referenced position in file</eucode>
--<eucode>procedure write(object str) -- write object to file, starting at current position</eucode>
--<eucode>procedure writelines(sequence strs) -- writes each 'strs' serially to file</eucode>
--<eucode>procedure truncate(integer size) -- (re)write only 'size' characters</eucode>
--*/
--------------------------------------------------------------------------------
--==== Defined instances
--
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Previous versions
--------------------------------------------------------------------------------
--[[[Version: 1.1.0
--OOEU Versions: 1.9.0 and later
--Author: C A Newbould
--Date: 2021.01.19
--Status: operational; complete
--Changes:]]]
--* ##length## defined
--* ##read## re-defined
--------------------------------------------------------------------------------
--[[[Version: 1.0.1
--OOEU Versions: 1.9.0 and later
--Author: C A Newbould
--Date: 2021.01.19
--Status: operational; complete
--Changes:]]]
--* reversed TRUE/FALSE return value in ##seek##
--------------------------------------------------------------------------------
--[[[Version: 1.0.0
--OOEU Versions: 1.9.0 and later
--Author: C A Newbould
--Date: 2021.01.18
--Status: operational; complete
--Changes:]]]
--* created
--* created parallels for Python file operations
--------------------------------------------------------------------------------
