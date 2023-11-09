#!/bin/sh

#CONTROLLO PARAMETRI

if test $# -ne 2
then
    echo "Utilizzo: $0 <nome> <anno>"
    exit 1
fi

case $2 in
    /* ;;
    *)  echo "$2 deve esser una directory con path assoluto"
       exit 2 ;;
esac

if test ! -d $2 -o ! -x $2
then
    echo "$2 non esiste o non si hanno i permessi per accedervi"
    exit 3
fi


#VARIABILI GLOBALI

export PATH=$PATH:$(pwd)
export NOME=$1
export MIN_COUNTER=/tmp/.min_counter.tmp
export FIUME=/tmp/.min_fiume.tmp
export RESOCONTO=$HOME/fiumilog.txt

> $RESOCONTO
> $FIUME
echo 0> $MIN_COUNTER

#ricorsione
cerca_cfiumi.sh $2

#CONCLUSIONI
echo "Il giorno con livello più basso del fiume $1: $(cat $FIUME) con $(cat $MIN_COUNTER)"


rm -f $FIUME
rm -f $MIN_COUNTER




