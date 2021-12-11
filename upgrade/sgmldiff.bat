@echo off

REM USAGE: sgmldiff.bat 13.1 14.1

SET OLD_PGVERSION=%1
SET NEW_PGVERSION=%2

python diffcount.py -s work/postgresql-%OLD_PGVERSION%/doc/src/sgml -t work/postgresql-%NEW_PGVERSION%/doc/src/sgml >sgmldiff_%OLD_PGVERSION%_to_%NEW_PGVERSION%.txt
