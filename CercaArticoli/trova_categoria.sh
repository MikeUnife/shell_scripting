#!/bin/sh

#CONTROLLO ARGOMENTI

if test $# -lt 2
then
    echo "Utilizzo: $0 <dir> <lista_articoli>"
    exit 1
fi

case $1 in
    /*) ;;
    *)  echo "Errore: $1 deve essere una directory assoluta"
        exit 2  ;;
esac

if test ! -d $1 -o ! -x $1
then
    echo "Errore: $1 non è una directory o non si hanno i permessi di esecuzione"
    exit 3
fi

#"VARIABILI GLOBALI"

export PATH=$PATH:$(pwd)
export LISTA=$2.log
export MAX_COUNTER=/tmp/.max_counter.tmp
export MAX_CATEGORIA=/tmp/.max_categoria.tmp

> $2.log
echo 0> /tmp/.max_counter.tmp
> /tmp/.max_categoria.tmp

#RICORSIONE
cerca_tg.sh $1

#CONCLUSIONI

if test $(cat $MAX_COUNTER) -gt 0
then
    echo "Con $(cat $MAX_COUNTER), $(cat $MAX_CATEGORIA) è la categoria con più oggetti venduti"
fi

rm -f $MAX_COUNTER
rm -f $MAX_CATEGORIA
