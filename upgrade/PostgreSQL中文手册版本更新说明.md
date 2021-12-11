# PostgreSQL中文手册版本更新说明

以下以13.1到14.1为例说明处理过程

## 1. 更新pgdoc-cn的github仓库上的分支用于新版手册翻译

1. 获取pgdoc-cn代码

		git clone https://github.com/postgres-cn/pgdoc-cn.git
		cd pgdoc-cn

2. 创建旧版本分支

		git branch 13

3. 更新README.md中各个分支相关的描述
	
	比如:

		master分支对于正在翻译的版本，当前是14.1，各个分支对应于PostgreSQL文档的版本如下。
		- 9.3：9.3.1
		- 9.4：9.4.4
		- 9.5：9.5.3
		- 9.6：9.6.0
		- 10：10.1
		- 11.2
		- 12.2
		- 13.1
		- master：14.1

4. 提交master分支的修改

		git commit
		git push

## 2. 对比升级前后的版本差异

1. 下载文件升级工具

		git clone https://github.com/ChenHuajun/pgdoctools.git
		cd pgdoctools/upgrade
		mkdir work

2. 下载PG 13.1和PG14.1的源码到work目录并解压

	- https://www.postgresql.org/ftp/source/

3. 对比版本差异

		cd pgdoctools/upgrade
		sgmldiff.bat 13.1 1.41

	版本差异将会输出到文件`sgmldiff_13.1_to_14.1.txt`中

4. 将版本差异输出粘贴到excel中

	模板参考`sgmldiff_13.1_to_14.1.xlsx`


## 3. 创建PG14初始翻译用的sgml文件
1. 从PG14中直接拷贝以下sgml到pgdoc-cn

		postgresql\doc\src\sgml\filelist.sgml
		postgresql\doc\src\sgml\ref\allfiles.sgml

2. 先翻译或合并以下文件

		postgresql\doc\src\sgml\postgres.sgml
		postgresql\doc\src\sgml\reference.sgml
		postgresql\doc\src\sgml\release.sgml
		postgresql\doc\src\sgml\Makefile
		postgresql\doc\src\sgml\stylesheet-speedup-common.xsl
		postgresql\doc\src\sgml\pgdoccn-notes.sgml
		
		注:postgres.sgml和pgdoccn-notes.sgml中要表明当前是翻译中版本
		
			<title>PostgreSQL &version; 手册(翻译中)</title>

	注意:
	  - 中文手册的stylesheet.css经过深度定制，所以不合并新版上stylesheet.css的修改，如果今后遇到显示问题可以检查这部分内容。
	  - 由于编译是会将sgml目录中的文件拷贝到原始源码目录，所以sgml目录中不存放不需要修改的非sgml文件(generate-errcodes-table.pl等)。

3. 处理PG14新增和删除的文件并提交

4. 使用PG14.1源码包，创建文档编译环境。再用pgdoc-cn中的sgml文件覆盖PG14.1原始英文sgml

		postgresql\doc\src\sgml

5. 编译html文档，并处理出现的编译错误

		cd postgresql-14.1\doc\src\sgml
		make html

## 4. 更新翻译wiki
1. 更新版本差异excel
    参考`sgmldiff_13.1_to_14.1.xlsx`模板
  
2. 生成翻译管理Wiki页面

	格式参考前一版本的翻译wiki，任务一览从版本差异excel中拷贝

## 5. 更新pgdoc站点 
1. 进入pgdoc站点，下载PG14源码(postgresql-14.1.tar.bz2)并解压

		cd /home/pgdoc
		tar xjf postgresql-14.1.tar.bz2
		mv postgresql-14.1 postgresql-14
		cd postgresql-14
		./configure --without-readline
		cd /home/pgdoc/gitrep

2. 修改以下文件，增加对PG14的支持

		autobuild.sh
		check_github_update.sh
		builddoc.sh

3. 手动编译PG14文档

		./autobuildone.sh 14 -f

4. 确认postgres.cn的在线文档是否已更新

		http://www.postgres.cn/docs/14

 