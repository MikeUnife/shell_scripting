#!/bin/sh

cd $1


for i in $(ls *.txt 2> /dev/null)
do
    if test -f $i -a -r $i -a $(grep -c "$NOME" $i) -gt 0
    then
        echo $(grep "$NOME" $i | cut -d ',' -f 1,3,5)>> $RESOCONTO
        if test $(cat $MIN_COUNTER) = "0" -a $(cat $FIUME) = ""
        then 
            echo $i> $FIUME 
            echo $(grep "$NOME" $i | cut -d ',' -f 1)> $MIN_COUNTER
        else if test $(expr $(grep "$NOME" $i | cut -d ',' -f 1) + 0) -lt $(expr $(cat $MIN_COUNTER) + 0)
        then
            echo $i> $FIUME
            echo $(grep "$NOME" $i | cut -d ',' -f 1)> $MIN_COUNTER
        fi     
    fi
done       
        

for dir in *
do
    if test -d $dir -a -x $dir
    then
        cerca_cfiumi.sh $dir
    fi
done


