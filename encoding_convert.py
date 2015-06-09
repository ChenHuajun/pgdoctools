# convert all sgml files from UTF8 to GBK
import os

sourceDir = r"H:\\sgml\\new"
targetDir = r"H:\\sgml\\utf8"
sourceEncoding=r"GBK"
targetEncoding=r"UTF-8"

def process(sourceFile, targetFile):
	print(sourceFile)
	if os.path.isdir(sourceFile):
		# process all files in this dir
		if not os.path.exists(targetFile):
			os.makedirs(targetFile)
		for f in os.listdir(sourceFile):
			sourceF = os.path.join(sourceFile, f)
			targetF = os.path.join(targetFile, f)
			process(sourceF, targetF)
	elif(sourceFile.endswith(".sgml")):
		# encoding convert
		fin=open(sourceFile, "r", encoding=sourceEncoding)
		fout=open(targetFile, "w", encoding=targetEncoding)
		fout.write(fin.read())
		fin.close()
		fout.close()
	else:
		# copy file
		open(targetFile, "wb").write(open(sourceFile, "rb").read())

if __name__ == "__main__":
	process(sourceDir,targetDir)
