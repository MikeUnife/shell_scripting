#!/bin/sh

cd $1

for i in $(ls *.txt 2> /dev/null)
do
    if test -f $i -a -r $i
    then
        RIGHE=$(grep $GENERE $i | grep -c $TIPO)
        if test $RIGHE -gt 0
        then
            echo "$(grep $GENERE $i | grep $TIPO | cut -d ',' -f 1,3,6)">> $RISULTATI
            if test $RIGHE -gt $(expr $(cat /tmp/.max_counter.tmp) + 0)
            then
                echo $RIGHE> /tmp/.max_counter.tmp
                echo $i> /tmp/.max_mese.tmp
            fi
        fi
    fi
done

for dir in *
do
    if test -d $dir -a -x $dir
    then
        cerca_cf.sh $dir
    fi
done
    


