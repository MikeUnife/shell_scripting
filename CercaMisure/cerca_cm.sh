#!/bin/sh

cd $1
counter=0

for i in $(ls *.log 2> /dev/null)
do
    if test -f $i -a -r $i -a -w $i -a $(head -n 1 $i | grep -c "$HEADER") -gt 0
    then
        counter=$(expr $counter + 1)
        echo $(pwd)/$i >> $MISURE
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
        cerca_cm.sh $dir
    fi
done



