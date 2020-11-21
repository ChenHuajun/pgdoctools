
# PostgreSQL中文手册版本更新说明

以下以12.2到13.1为例说明处理过程

## 1. 更新pgdoc-cn的github仓库上的分支用于新版手册翻译

1. 获取pgdoc-cn代码

		git clone https://github.com/postgres-cn/pgdoc-cn.git
		cd pgdoc-cn

2. 创建旧版本分支

		git branch 12

3. 更新README.md中各个分支相关的描述
	
比如:

		master分支对于正在翻译的版本，当前是13.1，各个分支对应于PostgreSQL文档的版本如下。
		
		- 9.3：9.3.1
		- 9.4：9.4.4
		- 9.5：9.5.3
		- 9.6：9.6.0
		- 10：10.1
		- 11.2
		- 12.2
		- master：13.1

4. 提交master分支的修改

		git commit
		git push

## 2. 创建PG13初始翻译用的sgml文件

1. 从PG13中直接拷贝以下sgml到pgdoc-cn

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

3. 处理PG13新增河删除的文件并提交

4. 下载PG13源码包，创建文档编译环境。再用pgdoc-cn中的sgml文件覆盖PG13原始英文sgml

		postgresql\doc\src\sgml

5. 编译html文档，并处理出现的编译错误

	    cd postgresql-13.1\doc\src\sgml
	    make html


## 3. 更新pgdoc站点 
1. 进入pgdoc站点，下载PG13源码(postgresql-13.1.tar.bz2)并解压

		cd /home/pgdoc
		tar xjf postgresql-13.1.tar.bz2
		mv postgresql-13.1 postgresql-13
		cd postgresql-13
		./configure --without-readline
		cd /home/pgdoc/gitrep

2. 修改以下文件，增加对PG13的支持

		autobuild.sh
		check_github_update.sh
		builddoc.sh

3. 手动编译PG13文档

		./autobuildone.sh 13 -f

4. 确认postgres.cn的在线文档是否已更新

		http://www.postgres.cn/docs/13

## 4. 更新翻译wiki
1. 对比PG13和前一版本的差异
  步骤可参考[PostgreSQL中文手册版本更新说明](https://github.com/ChenHuajun/pgdoctools/tree/master/upgrade/PostgreSQL中文手册版本更新说明.md)
  
2. 生成翻译管理Wiki页面
		
 