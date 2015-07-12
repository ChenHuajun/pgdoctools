
1)查看9.3校对的wiki更新
进入docbuilder
./updatecheck93wiki.sh

2)生成离线html和pdf文档
2.1 进入docbuilder执行
./release.sh

2.2 拷贝以下文件到Windows的sgml2pdf目录
PostgreSQLx.y.z-CN-HTML-v1.x.tar.gz
postgres-A4.tex-pdf.gz

2.3 进入sgml2pdf目录解压postgres-A4.tex-pdf.gz

2.4 执行以下文件
run.bat

2.4 用ORPALIS PDF Reducer给生成的pdf瘦身