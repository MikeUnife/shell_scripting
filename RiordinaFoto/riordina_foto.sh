#!/bin/sh

#CONTROLLO ARGS
#N- args 
if test $# -ne 2
then
    echo "Utilizzo: riordina_foto <dir_sorgente> <dir_destinazione>" >&2
    exit 1
fi

shift
dir_sorgente=$0
dir_destinazione=$1

#controllo su dir sorgente
case $dir_sorgente in
    /*) echo "Errore: <dir_sorgente> deve essere una directory relativa" >&2
        exit 2 ;;
    *)  ;;
esac

if test ! -d $dir_sorgente
then
    echo "Errore: <dir_sorgente> non è una directory" >&2
    exit 3
fi

#controllo dir_destinazione
if test ! -d $dir_destinazione
then 
    mkdir $dir_destinazione
fi

#SALVATAGGIO PATH
PATH=$PATH:$(pwd)
export PATH

> /tmp/spostati

#CHIAMATA RICORSIVA
mkdir $(pwd)/$dir_destinazione/duplicati
cercaJpg.sh $dir_sorgente $(pwd)/$dir_destinazione

echo "File spostati: $(wc -l < /tmp/spostati)"
rm /tmp/spostati