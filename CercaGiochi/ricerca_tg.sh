#!/bin/sh
 
cd $1

for i in $(ls *.txt 2> /dev/null)
do
    if test -f $i -a -r $i
    then
        if test $(head -n 1 $i | grep -c "giochi") -gt 0
        then
            if test $(expr $(cat $MAX_COUNTER) + 0) -lt $(wc -l $i)
            then
                echo "$(wc -l < $i)"> $MAX_COUNTER 
                echo "$i"> $MAX_RIGHE
            fi
            echo "$(pwd)/$i">> $TROVATO
        fi
    fi
done

for dir in *
do 
    if test -d $dir -a -x $dir
    then
        ricerca_tg.sh $(pwd)/$dir
    fi
done



