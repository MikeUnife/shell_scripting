#!/bin/sh

#CONTROLLO ARGOMENTI

if test $# -ne 3
then
    echo "Utilizzo: $0 <dir> <cod_parte> <num>"
    exit 1
fi

case $1 in
 /*)    ;;
 *) echo "Errore $1 non è una directory assoluta"
    exit 2
esac

if test ! -d $1 -a ! -x $1
then
    echo "La directory $1 non esiste o non si hai il permesso di esecuzione"
    exit 3
fi

case $3 in
    *[!0-9]*) echo "Errore $3 deve essere un numero" 
                exit 3 ;;
    *)  ;;
esac

PATH=$PATH:$(pwd)
export PATH

CODICE=$2
N_PEZZI=$3

export CODICE
export N_PEZZI


echo 0> /tmp/max_pezzi.tmp
> /tmp/max_fornitore.tmp

cerca_tFornitori.sh $1

if test $(wc -l /tmp/max_fornitore.tmp) -gt 0
then
    echo "Il fornitore con più disponibilità è $(cat /tmp/max_fornitore.tmp) con $(cat /tmp/max_pezzi.tmp) pezzi"
else
    echo "Nessun fornitore disponibile"
fi

rm -f /tmp/max_pezzi.tmp
rm -f /tmp/max_fornitore.tmp