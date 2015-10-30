#!/bin/bash

# Personalized "wc" tool to show data more clearly
# One item per line, numbers have thousand separator

# alias wc="/path/to/wc.sh"

files=( "$@" )

wc "${files[@]}" | \
awk 'BEGIN{OFS="\t";names[0]="lines"; names[1]="words"; names[2]="bytes"}
     {filename=gensub(/([^ ]+ +){3}/,"", "g", $0);
     printf "<< %s >>\n", filename;
     for (i=1;i<=3;i++) {
        printf "%s%s%'\''d\n", names[i-1],OFS,$i}
     print ""
     }'
