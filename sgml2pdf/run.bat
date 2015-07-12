del postgres-A4.aux postgres-A4.log postgres-A4.out postgres-A4.pdf

pdflatex --hash-extra=2000000 --job-name=postgres-A4 \input jadetex.ltx \input postgres-A4.tex-pdf
pdflatex --hash-extra=2000000 --job-name=postgres-A4 \input jadetex.ltx \input postgres-A4.tex-pdf
pdflatex --hash-extra=2000000 --job-name=postgres-A4 \input jadetex.ltx \input postgres-A4.tex-pdf

rename postgres-A4.pdf PostgreSQL9.3.1-CN-v1.1.pdf
