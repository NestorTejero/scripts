#!/bin/bash

# Personalized "wc" tool to show data more clearly
# One item per line, numbers have thousand separator

# alias wc="/path/to/wc.sh"


lines=0
chars=0
bytes=0

files=()
while test $# -gt 0; do
    case "$1" in
        -l)
            lines=1
            shift
            ;;
        -c)
            chars=1
            shift
            ;;
        -b)
            bytes=1
            shift
            ;;
        *)
            files+=("$1")
            shift
            ;;
    esac
done

wc "${files[@]}" | \
awk -v lines="$lines" -v chars="$chars" -v bytes="$bytes" \
    'BEGIN{OFS="\t";names[0]="lines"; names[1]="words"; names[2]="bytes"}
     {filename=gensub(/([^ ]+ +){3}/,"", "g", $0);
     printf "<< %s >>\n", filename;
     for (i=1;i<=3;i++) {
        printf "%s%s%'\''d\n", names[i-1],OFS,$i}
     print ""
     }'
