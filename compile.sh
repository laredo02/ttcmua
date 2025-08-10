


rm masters-thesis.aux.b* masters-thesis.log masters-thesis.out masters-thesis.pdf masters-thesis.tex.b* masters-thesis.toc

lualatex -shell-escape masters-thesis.tex
biber masters-thesis
lualatex -shell-escape masters-thesis.tex
lualatex -shell-escape masters-thesis.tex


