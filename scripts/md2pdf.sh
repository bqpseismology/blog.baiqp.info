#########################################################################
# File Name: md2pdf.sh
# Author: Qipeng Bai
# mail: baiqp@mail.ustc.edu.cn
# Created Time: Wed 02 May 2018 04:48:02 PM CST
#########################################################################
#!/bin/bash

MarkDown=$1
template="../scripts/book-template.tex"

pandoc -N -s --toc -f markdown+smart --pdf-engine=xelatex -V mainfont="SimSun" \
       -V geometry:margin=1in --template=${template} ${MarkDown} -o output.pdf
