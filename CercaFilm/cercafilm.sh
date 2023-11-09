#!/bin/sh

#CONTROLLO ARGOMENTI

if test $# -lt 3
then
    echo "Utilizzo: $0 <genere> <tipo> <anno>"
    exit 1
fi

case $3 in
    /*) ;;
    *) echo "$3 non è una directory assoluta"
        exit 3 ;;
esac

if test ! -d $3 -o ! -x $3
then
    echo "$3 non esiste o non si hanno i permessi di esecuzione"
    exit 4
fi

#export di "variabili globali e creazione file"
export GENERE=$1
export TIPO=$2

PATH=$PATH:$(pwd)
export PATH

echo 0> /tmp/.max_counter.tmp
> /tmp/.max_mese.tmp
export RISULTATI=$HOME/risultati.txt
> $HOME/risultati.txt

#chiamata ricorsiva
sh cerca_cf.sh $3

#STAMPE
echo "Film trovati:"
echo "$(sort -r -n $RISULTATI)"
echo "Il mese con più titoli inerenti: $(cat /tmp/.max_mese.tmp), con $(cat /tmp/.max_counter.tmp)"

#chiusura
rm /tmp/.max_counter.tmp
rm /tmp/.max_mese.tmp


