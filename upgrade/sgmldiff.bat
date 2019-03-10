

# SET OLD_PGVERSION=10.1
# SET NEW_PGVERSION=11.2
SET OLD_PGVERSION=%1
SET NEW_PGVERSION=%2

C:\Python27\python diffcount_prepare.py -i postgresql-%OLD_PGVERSION%\doc\src\sgml -o postgresql-%OLD_PGVERSION%_sgml
C:\Python27\python diffcount_prepare.py -i postgresql-%NEW_PGVERSION%\doc\src\sgml -o postgresql-%NEW_PGVERSION%_sgml

diffcount\diffcount.exe --print-files-info postgresql-%OLD_PGVERSION%_sgml postgresql-%NEW_PGVERSION%_sgml>sgmldiff_%OLD_PGVERSION%_to_%NEW_PGVERSION%.txt