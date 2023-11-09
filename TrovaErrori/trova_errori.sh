#!/bin/sh

if test $# ! -e 1
then 
    echo "Utilizzo: trova_errori <dir>"
    exit 1
fi

case $1 in
    /*) ;;
    *)  echo "$1 non è una directory assoluta"
        exit 2 ;;
esac

if test -d $1
then
    echo "$1: Directory inesistente"
    exit 3
fi

PATH=$PATH:$(pwd)
export PATH

> $HOME/errori.txt
> $HOME/warning.txt
> /tmp/max_dir.tmp
0 > /tmp/max_err.tmp

cercatore.sh $1

echo "La directory contenente il maggior numero di errori è: $(cat /tmp/max_dir.tmp)"
rm /tmp/max_dir.tmp
rm /tmp/max_err.tmp