#!/bin/sh

dir=$1
stringa=$2
shift
shift

cd $dir
for i in $*
do
        if test -f "$i" -a -r "$i" 
        then
            if test $(grep -c $stringa "$i") -gt 0
            then
                grep $stringa "$i" >> /tmp/.linesStringa.tmp
                mv "$i" /tmp/
                expr $(cat /tmp/.counter.tmp) + 1 > /tmp/.counter.tmp
            fi
        fi
done

for dir in *
do
    if test -d $dir
    then
        cercaStringa.sh "$(pwd)/$dir" $stringa $*
    fi
done
