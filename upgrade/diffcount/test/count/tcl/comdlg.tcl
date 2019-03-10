# comdlg.tcl --
#
#	Some functions needed for the common dialog boxes. Probably need to go
#	in a different file.
#
# SCCS: @(#) comdlg.tcl 1.4 96/09/05 09:07:54
#
# Copyright (c) 1996 Sun Microsystems, Inc.
#
# flags = currently unused.
#
# argList = The list of  "-option value" pairs.
#
proc tclParseConfigSpec {w specs flags argList} {
    upvar #0 $w data

    # 1: Put the specs in associative arrays for faster access
    #
    foreach spec $specs {
	if {[llength $spec] < 4} {
	    error "\"spec\" should contain 5 or 4 elements"
	}
	set cmdsw [lindex $spec 0]
	set cmd($cmdsw) ""
	set rname($cmdsw)   [lindex $spec 1]
	set rclass($cmdsw)  [lindex $spec 2]
	set def($cmdsw)     [lindex $spec 3]
	set verproc($cmdsw) [lindex $spec 4]
    }

    if {([llength $argList]%2) != 0} {
	foreach {cmdsw value} $argList {
	    if {![info exists cmd($cmdsw)]} {
	        error "unknown option \"$cmdsw\", must be [tclListValidFlags cmd]"
	    }
	}
	error "value for \"[lindex $argList end]\" missing"
    }

    # 2: set the default values
    #
    foreach cmdsw [array names cmd] {
	set data($cmdsw) $def($cmdsw)
    }

    # 3: parse the argument list
    #
    foreach {cmdsw value} $argList {
	if {![info exists cmd($cmdsw)]} {
	    error "unknown option \"$cmdsw\", must be [tclListValidFlags cmd]"
	}
	set data($cmdsw) $value
    }

    # Done!
}

proc tclListValidFlags {v} {
    upvar $v cmd

    set len [llength [array names cmd]]
    set i 1
    set separator ""
    set errormsg ""
    foreach cmdsw [lsort [array names cmd]] {
	append errormsg "$separator$cmdsw"
	incr i
	if {$i == $len} {
	    set separator " or "
	} else {
	    set separator ", "
	}
    }
    return $errormsg
}

# This procedure is used to sort strings in a case-insenstive mode.
#
proc tclSortNoCase {str1 str2} {
    return [string compare [string toupper $str1] [string toupper $str2]]
}


# Gives an error if the string does not contain a valid integer
# number
#
proc tclVerifyInteger {string} {
    lindex {1 2 3} $string
}


