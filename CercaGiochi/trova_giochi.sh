#!/bin/sh

#CONTROLLO PARAMETRI

if test $# -lt 1
then
    echo "Utilizzo: $0 <dir>"
    exit 1
fi

case $1 in 
    /*) echo "$1 deve essere una directory relativa"
        exit 2  ;;
    *) ;;
esac

if test ! -d $1 -a ! -x $1
then 
    echo "$1 non esiste o non si hanno i permessi di esecuzione"
    exit 3
fi

#"VARIABILI GLOBALI"
export PATH=$PATH$(pwd)
echo 0> /tmp/.counter.tmp
> /tmp/.max_righe.tmp
> $HOME/trovato.txt

export MAX_COUNTER=/tmp/.counter.tmp
export MAX_RIGHE=/tmp/.max_righe.tmp
export TROVATO=$HOME/trovato.txt

#ricorsione
ricerca_tg.sh $1

#CONCLUSIONE
echo "$(cat $MAX_RIGHE) è il file con più righe: $(cat $MAX_COUNTER)"

rm -f $MAX_COUNTER
rm -f $MAX_RIGHE

