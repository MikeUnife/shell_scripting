#!/bin/sh

cd $1

for i in $(ls *.txt 2 >/dev/null)
do
    if test -f "$i" -a -r "$i"
    then
        if test $(grep -c "$CODICE" "$i") -gt 0
        then
            nPezzo=$(grep "$CODICE" "$i" | cut -d ',' -f 4)
            if test $nPezzo -ge $N_PEZZI -a $(expr $(cat /tmp/max_pezzi.tmp) + 0) -lt $nPezzo
            then
                echo $nPezzo> /tmp/max_pezzi.tmp
                echo $(grep "$CODICE" "$i" | cut -d ',' -f 1)> /tmp/max_fornitore.tmp
            fi
        fi
    fi
do


#RICORSIONE
for dir in *
do
    if test -d $dir -a -x $dir
    then
        cerca_tFornitori.sh $dir
    fi
done



