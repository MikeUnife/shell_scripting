#!/bin/sh

cd $1
COUNTER=0



for i in $(ls *.log 2> /dev/null)
do
    if test -f $i -a -r $i -a $(head -n 1 $i | cut -d ',' -f 5) = "venduto"
    then
        COUNTER=$(expr $COUNTER + 1)
    fi
done

if test $COUNTER -gt $(cat $MAX_COUNTER)
then
    echo $1> $MAX_CATEGORIA
    echo $COUNTER> $MAX_COUNTER
    > $LISTA
    for i in $(ls *.log 2> /dev/null)
    do
        if test -f $i -a -r $i -a $(head -n 1 $i | cut -d ',' -f 5) = "venduto"
        then
            echo $(head -n 1 $i) >> $LISTA
        fi
    done    
fi


#ricorisione
for dir in *
do
    if test -d $dir -a -x $dir
    then
        cerca_tg.sh $dir
    fi
done

