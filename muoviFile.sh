#!/bin/sh
#Controllo numero di argomenti >=4
if test $# -lt 4
then
    echo "Utilizzo: muoviFile <num> <dirSorgente> <dirDestinazione> <ext1> <ext2>...extN"
    exit 1
fi

num=$1
dirSorgente=$2
dirDestinazione=$3

shift
shift
shift


expr $num + 0
if test $? -ne 0
then
    echo "Errore: il primo argomento deve essere un numero"
    exit 1
fi

#controllo sulle directory
case $dirSorgente in
    /*) ;;
    *) echo "Exit: Il secondo arg deve essere una directory assoluta"
    exit 3
esac
case $dirDestinazione in
    /*) ;;
    *) echo "Exit: Il terzo arg deve essere una directory assoluta"
    exit 4
esac
if test ! -d $dirSorgente
then 
    echo "Exit: La directory sorgente non esiste"
    exit 5
fi
if test ! -d $dirDestinazione
then 
    echo "Exit: La directory Destinazione non esiste"
    exit 5
fi

#controllo sulle estensioni
for i in $*
do
    case $i in
    .*) ;;
    *) echo "Una delle estensioni non è un'estensione"
    exit 6
    esac
done

PATH=$PATH:$(pwd)
export PATH

> /tmp/counter.tmp

ricerca.sh $num $dirSorgente $dirDestinazione $*
echo $(wc -l < /tmp/.counter.tmp)

rm -f /tmp/.counter.tmp
