# scripts
Some tools for text processing

## wc.sh
Personalized "wc" tool to show data more clearly. One item per line, numbers have thousand separator.

### Installation
Add the following line into your ~/.bashrc file:
````
alias wc="/path/to/wc.sh"
````

### Usage

````
wc <file1> <file2> ...
````

### Test
````
$ seq 200 > a
$ seq 1200 > b
$ wc a b
<<  a >>
lines    200
words	200
bytes	692

<< b >>
lines	1,200
words	1,200
bytes	4,893

<< total >>
lines	1,400
words	1,400
bytes	5,585
````
