
# PostgreSQL文档发布步骤

## 1. 检查编译错误
查看并修复build.log中的编译错误


## 2. 生成离线html
### 2.1 进入docbuilder执行

	su - pgdoc

### 2.2 修改发布文件名

	vi release.sh
	...
	release_name=PostgreSQL10.1-CN-v1.0
	htmlfilename=PostgreSQL10.1-CN-HTML-v1.0

### 2.3 执行发布脚本

	./release.sh

发布脚本执行后生成以下两个文件

- PostgreSQLx.y.z-CN-HTML-v1.x.tar.gz
- postgres-A4.po.gz

## 3. 生成pdf文档

### 3.1 获取pgdoctools工具

在Linux系统获取pgdoctools工具

	git clone https://github.com/ChenHuajun/pgdoctools
	cd pgdoctools/fo2pdf

### 3.2 生成PDF
拷贝postgres-A4.po.gz到fo2pdf目录，生成PDF

	gunzip postgres-A4.po.gz
	sh fo2pdf.sh

将生成的postgres-A4.pdf改名为PostgreSQL10.1-CN-v1.0.pdf

## 4. 生成chm文档

### 4.1 获取pgdoctools工具

在Windows系统获取pgdoctools工具

	git clone https://github.com/ChenHuajun/pgdoctools
	cd pgdoctools/html2chm

### 4.2 拷贝HTML压缩文件

拷贝PostgreSQLx.y.z-CN-HTML-v1.x.tar.gz到html2chm目录，并解压

### 4.3 删除所有html文件中的xml头

	<?xml version="1.0" encoding="UTF-8" standalone="no"?>

### 4.4 参考以下步骤生成chm文件
https://github.com/ChenHuajun/pgdoctools/html2chm/html2chm.md



