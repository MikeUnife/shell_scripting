#!/bin/sh

cd $1
counter=0

for i in $(ls *.bak 2> /dev/null)
do 
    if test -f $i -a -r $i
    then
        prima=$(head -n 1)
        if test "$prima" = "$TITOLO"
        then
            cp $i $RECUPERATI
            counter=$(expr $counter + 1)
        fi
    fi
done

if test $counter -gt $(cat $MAX_COUNTER)
then
    echo $counter> $MAX_COUNTER
    echo $1> $MAX_DIR
fi

for dir in *
do
    if test -d $dir -a -x $dir
    then
        cerca_ct.sh $dir
    fi
done


