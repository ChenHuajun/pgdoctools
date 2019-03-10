
# PostgreSQL中文手册版本更新说明

以下以10.1到11.2为例说明处理过程(略过部分PG11 sgml改xml的新增的处理)

## 1. 更新pgdoc-cn的github仓库上的分支用于新版手册翻译

1. 获取pgdoc-cn代码

		git clone https://github.com/postgres-cn/pgdoc-cn.git
		cd pgdoc-cn

2. 更新README.md中各个分支相关的描述
	
比如:

		master分支对于正在翻译的版本，当前是11.2，各个分支对应于PostgreSQL文档的版本如下。
		
		- 9.3：9.3.1
		- 9.4：9.4.4
		- 9.5：9.5.3
		- 9.6：9.6.0
		- 10：10.1
		- master：11.2

3. 提交master分支的修改

		git commit
		git push

4. 创建旧版本分支

		git branch 10
		git checkout 10

2. 更新`tools\add_edit_link.py`中的“纠错本页面”链接

		<a style="margin : 0px 0px 0px 10px;" href="https://github.com/postgres-cn/pgdoc-cn/edit/master/postgresql/doc/src/sgml/{0}" 

	改成
	
		<a style="margin : 0px 0px 0px 10px;" href="https://github.com/postgres-cn/pgdoc-cn/edit/10/postgresql/doc/src/sgml/{0}" 

		git commit
		git push --set-upstream origin 10


## 2. 创建PG11初始翻译用的sgml文件

1. 从PG11中直接拷贝以下sgml到pgdoc-cn

		postgresql\doc\src\sgml\filelist.sgml
		postgresql\doc\src\sgml\ref\allfiles.sgml

2. 先翻译或合并以下sgml

		postgresql\doc\src\sgml\postgres.sgml
		postgresql\doc\src\sgml\reference.sgml
		postgresql\doc\src\sgml\release.sgml
		postgresql\doc\src\sgml\Makefile
		postgresql\doc\src\sgml\stylesheet.css
		postgresql\doc\src\sgml\pgdoccn-notes.sgml
	
		注:postgres.sgml和pgdoccn-notes.sgml中要表明当前是翻译中版本
		
			<title>PostgreSQL &version; 手册(翻译中)</title>

3. 删除PG11中删除的sgml文件

4. 下载PG11源码包，创建文档编译环境。再用pgdoc-cn中的sgml文件覆盖PG11原始英文sgml

		postgresql\doc\src\sgml

5. 编译html文档，并处理出现的编译错误

	    cd postgresql-11.2\doc\src\sgml
	    make html


## 3. 更新pgdoc站点 
1. 进入pgdoc站点，下载PG11源码(postgresql-11.2.tar.bz2)并解压到以下目录

		/home/pgdoc/gitrep


2. 修改以下文件，增加对PG11的支持

		autobuild.sh
		check_github_update.sh

3. 手动编译PG11文档

		forcebuildone.sh 11

4. 确认postgres.cn的在线文档是否已更新

		http://www.postgres.cn/docs/11


## 4. 更新翻译wiki


1. 从PostgreSQL官网下载新老版本的[PostgreSQL源码](https://ftp.postgresql.org/pub/source/)并解压到当前目录

		postgresql-10.1/
		postgresql-11.2/

2. 比较sgml差异

		sgmldiff.bat 10.1 11.2

	差异对比结果保存在文件`sgmldiff_10.1_to_11.2.txt`中


3. 根据生成的差异文件，创建翻译wiki页面

		https://github.com/postgres-cn/pgdoc-cn/wiki/pg11
