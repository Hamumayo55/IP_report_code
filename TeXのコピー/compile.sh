#!/bin/sh

filename=${basename%.*}
pdfflag=1
dviflag=1

echo "enter file"
read filename
set f = filename

if [ -f $f ]; then   # tex -> dvi                                                                                
    platex ${filename}.tex
    platex ${filename}.tex
else
    echo "file not found ${filename}.tex"
    dviflag=0
    pdfflag=0
fi

if [ -f $f ]; then # dvi -> pdf                                                                                
    dvipdfmx ${filename}.dvi
elif [ $dviflag != 0 ]; then
    echo "file not found ${filename}.dvi"
    pdfflag=0
fi

if [ -f $f ]; then  # open pdf                                                                             
    open ${filename}.pdf
    rm "${filename}.toc" "${filename}.log" "${filename}.aux" "${filename}.dvi" # remove                 
elif [ $pdfflag != 0 ]; then
    echo "file not found ${filename}.pdf"
fi