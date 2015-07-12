\! curl  https://github.com/postgres-cn/pgdoc-cn/wiki/check9.3 >check9.3.html
\! python3 checkwiki2csv.py >/tmp/check9.3.csv

drop table :tbl;
create table :tbl(id int,sgml text,title text,lines int,status text,translator text,planchecker text,checker text);
copy :tbl from '/tmp/check9.3.csv' (format csv);
select translator 翻译者,sum(lines) 翻译sgml行数  from :tbl group by translator order by 翻译sgml行数 desc;
select checker 校对者,sum(lines) 校对sgml行数  from :tbl where status='完成' group by checker order by 校对sgml行数 desc;
