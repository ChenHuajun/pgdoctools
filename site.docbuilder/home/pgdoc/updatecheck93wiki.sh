#!/bin/bash
psql -f updatecheck93wiki.sql -v tbl=check93_`date +%Y%m%d`
