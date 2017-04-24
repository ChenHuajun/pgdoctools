
1)检查编译错误
查看并修复build.log中的编译错误


2)生成离线html
2.1 进入docbuilder执行
su - pgdoc

2.2 修改发布文件名
vi release.sh
...
release_name=PostgreSQL9.5.3-CN-v1.0
htmlfilename=PostgreSQL9.5.3-CN-HTML-v1.0

2.3 执行发布脚本
./release.sh

2.2 拷贝以下文件到Windows的sgml2pdf目录
PostgreSQLx.y.z-CN-HTML-v1.x.tar.gz
PostgreSQLx.y.z-CN-v1.0.hhc
PostgreSQLx.y.z-CN-v1.0.hhk
postgres-A4.tex-pdf.gz

3)生成pdf文档

3.1 进入sgml2pdf目录解压postgres-A4.tex-pdf.gz

3.2 执行以下文件
run.bat

3.3 用ORPALIS PDF Reducer给生成的pdf瘦身

4)生成chm文档
4.1 解压PostgreSQLx.y.z-CN-HTML-v1.x.tar.gz然后将PostgreSQLx.y.z-CN-HTML-v1.x目录改名为移动html

4.2 参考以下步骤生成chm文件
https://github.com/ChenHuajun/gen_pgdoc_chm/blob/master/README.md

