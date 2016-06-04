gemforce-tables
==========

Full gem tables for [gemforce](https://github.com/gemforce-team/gemforce) query programs


### Instructions:

Download the tables here and put them in the same directory as the build/query program you want to use with them.


### Split tables:

Github has a file size limit of 50 MB, so lots of tables had to be splitted to be uploaded.
The parts can be found in the `table_X.d` folders and have to be joined together to be used.

To join the tables (example for 3 parts) write in a terminal:

**On an unix-like OS:**  
`cat table_X_p00 table_X_p01 table_X_p02 > table_X`

**On Windows:**  
`type table_X_p00 table_X_p01 table_X_p02 > table_X`

There is also a bash script called `auto_join.sh` than can join all the tables automatically, but needs a *nix shell.


### Table lengths

Automatically generated by `ruler.sh` in this folder.

|Name		|Length	|
|:--------------|------:|
|table_crit	|1024	|
|table_kgcappr	|2048	|
|table_kgcexact	|512	|
|table_kgcomb	|262144	|
|table_kgsappr	|235	|
|table_kgsexact	|64	|
|table_leech	|4219469	|
|table_mgcappr	|32768	|
|table_mgcexact	|2048	|
|table_mgcomb	|524288	|
|table_mgsappr	|2048	|
|table_mgsexact	|256	|


### Repository state:

Be warned, this repository is often rebased to keep its size under control,
so you are advised to not clone it.

If for some reason you want to clone the repository you may want to contact me before.


### Format documentation:

Table files are no more than plain text files, with LF line ends.  
The tables are built by blocks (called pools) of increasing gem value.
Each pool begins with the number of gems of that value, then encodes one gem per line
and ends with the value-1 of the block.

Gem encoding is little-endian, in a custom base 64:  
64 consecutive ascii chars starting from `0` (0) and ending at `o` (63)
and consist of 3 numbers, separated by spaces:

* value of one parent gem -1 (father)  
* offset of father gem from the head of the father pool  
* offset of mother gem from the head of the mother pool

The value of the mother gem is computed from the other two values.

Block format:

```
number_of_gems_in_this_pool
value_father1 offset_father1 offset_mother1
value_father2 offset_father2 offset_mother2
value_father3 offset_father3 offset_mother3
...
value_of_pool-1
```

An example:

```
4
<6 0 0
D6 1 1
@8 2 1
V8 4 3
2047
```


### Report bugs:

To report a bug with gemforce-tables look at the
[Issues page on Github](https://github.com/gemforce-team/gemforce-tables/issues) if it was already reported.  
If your bug isn't there open a [new issue](https://github.com/gemforce-team/gemforce-tables/issues/new).
Be sure to include all the relevant information (OS, gemforce version, etc...) and give a reliable way to reproduce the bug.


### Credits:

Author:

* Andrea Stacchiotti aka AG/Steam user '12345ieee'

People who contributed with some computational power:

* AG user 'tom0815'
* GC player 'Lanore'
